/* eslint-disable no-param-reassign */

export const clUrl = (
  publicId,
  options,
  format,
  defaultOptions = 'q_auto,f_auto',
) =>
  `//res.cloudinary.com/smooth/image/upload/${
    !format ? (defaultOptions ? `${defaultOptions}/` : '') : ''
  }${options ? `${options}/` : ''}v1497970667/${publicId}${
    format ? `.${format}` : ''
  }`

export const absClUrl = (publicId, options, format) =>
  `https:${clUrl(publicId, options, format)}`

export const createText = (
  text,
  {
    fontFamily = 'roboto',
    fontSize = '',
    fontWeight = '',
    textAlign = '',
    lineSpacing = '',
  },
  options = '',
) => {
  if (lineSpacing) lineSpacing = `line_spacing_${lineSpacing}`
  const styleStr = [fontFamily, fontSize, fontWeight, textAlign, lineSpacing]
    .filter(x => x)
    .join('_')
  const overlay = `l_text:${styleStr}:${encodeURI(text)
    .replace(/,/g, '%252C')
    .replace(/'/g, `’`)}`
  if (options) return `${overlay},${options}`
  return overlay
}
