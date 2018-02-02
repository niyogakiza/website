import path from 'path'
import webpack from 'webpack'
import AssetsPlugin from 'assets-webpack-plugin'
import CompressionPlugin from 'compression-webpack-plugin'
import iltorb from 'iltorb'

const DIST_PATH = path.resolve(__dirname, 'public/dist')
const production = process.env.NODE_ENV === 'production'
const development =
  !process.env.NODE_ENV || process.env.NODE_ENV === 'development'

module.exports = {
  context: path.resolve(__dirname, 'src/client'),
  entry: [...(development ? ['react-hot-loader/patch'] : []), './main.js'],
  output: {
    path: DIST_PATH,
    filename: production ? '[name]-bundle-[hash].js' : '[name].js',
    publicPath: '/dist/',
  },
  resolve: {
    extensions: ['.js', '.json'],
    modules: ['node_modules', 'src'],
    alias: {
      moment$: 'moment/moment.js',
    },
  },
  devtool: 'inline-source-map',
  module: {
    rules: [
      {
        test: /\.js$/,
        exclude: /node_modules/,
        use: {
          loader: 'babel-loader',
          options: {
            babelrc: false,
            presets: [
              'react',
              [
                'env',
                {
                  modules: false,
                  loose: false,
                  targets: {
                    uglify: true,
                    browsers: ['> 1%', 'last 2 versions'],
                  },
                },
              ],
            ],
            plugins: [
              [
                "module-resolver",
                {
                  "root": [
                    "./src"
                  ]
                }
              ],
              'loadable-components/babel',
              'transform-object-rest-spread',
              'transform-class-properties',
              ['lodash', { id: 'recompact' }],
              [
                'styled-components',
                {
                  ssr: true,
                },
              ],
              ...(development ? ['react-hot-loader/babel'] : []),
            ],
          },
        },
      },
    ],
  },
  plugins: [
    new webpack.ProvidePlugin({
      $: 'jquery',
      jQuery: 'jquery',
      'window.jQuery': 'jquery',
      Tether: 'tether',
    }),
    new webpack.DefinePlugin({
      'process.env.NODE_ENV': JSON.stringify(process.env.NODE_ENV),
    }),
    ...(production
      ? [
          new webpack.LoaderOptionsPlugin({ minimize: true }),
          new AssetsPlugin({ path: DIST_PATH }),
          new webpack.optimize.UglifyJsPlugin(),
          new CompressionPlugin({
            algorithm: 'gzip',
            asset: '[path].gz[query]',
            test: /\.js$/,
            threshold: 10240,
            minRatio: 0.8,
          }),
          new CompressionPlugin({
            algorithm: (content, options, callback) => {
              iltorb.compress(content, callback)
            },
            asset: '[path].br[query]',
            test: /\.js$/,
            threshold: 10240,
            minRatio: 0.8,
          }),
        ]
      : [
          new webpack.HotModuleReplacementPlugin(),
          new webpack.NamedModulesPlugin(),
        ]),
  ],
  ...(development
    ? {
        devServer: {
          hot: true,
          contentBase: DIST_PATH,
          publicPath: '/dist/',
          allowedHosts: ['www.smooth-code.dev'],
          proxy: {
            '*': {
              target: 'http://localhost:8000',
            },
          },
        },
      }
    : {}),
}
