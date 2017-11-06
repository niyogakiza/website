import sm from 'sitemap'
import { gql } from 'server/graphql'
import * as routePaths from 'modules/routePaths'

const siteMapToString = sitemap =>
  new Promise((resolve, reject) => {
    sitemap.toXML((err, xml) => {
      if (err) {
        reject(err)
        return
      }

      resolve(xml.toString())
    })
  })

async function generateSitemap() {
  const { data, errors } = await gql`
    {
      sessions {
        updatedAt
        link
      }
      articles {
        link
        updated_at
      }
    }
  `

  if (errors) {
    console.error(errors) // eslint-disable-line no-console
    throw new Error('Error during sitemap generation')
  }

  return siteMapToString(
    sm.createSitemap({
      hostname: 'https://www.smooth-code.com',
      cacheTime: 600000,
      urls: [
        { url: routePaths.homeRoute(), changefreq: 'weekly', priority: 1 },
        ...data.sessions.map(session => ({
          url: session.link,
          lastmodISO: session.updatedAt,
          changefreq: 'weekly',
          priority: 0.9,
        })),
        ...data.articles.map(article => ({
          url: article.link,
          lastmodISO: article.updated_at,
          changefreq: 'weekly',
          priority: 0.9,
        })),
      ],
    }),
  )
}

export default generateSitemap
