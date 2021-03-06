import { shortDuration } from 'modules/dateUtils'
import { absClUrl, createText } from 'modules/cloudinary'

const distinctSessions = sessions =>
  sessions.reduce((all, session) => {
    if (all.every(({ training: { slug } }) => slug !== session.training.slug)) {
      all.push(session)
    }
    return all
  }, [])

export const validSessions = sessions =>
  distinctSessions(sessions.filter(session => session.inStock)).slice(0, 4)

export const summarizeSession = session =>
  `${session.location.city} | ${shortDuration(
    session.startDate,
    session.endDate,
  )}`

export const generateSocialPicture = session => {
  const size = 'c_scale,w_1200,h_628'
  const title = createText(
    `Workshop\n${session.training.title}`.toUpperCase(),
    { fontSize: 60, fontWeight: 'bold' },
    'co_white,g_north_west,y_90,x_350',
  )
  const abstract = createText(
    session.training.socialAbstract,
    { fontSize: 45, textAlign: 'center', lineSpacing: 1.5 },
    'co_white,g_north,y_280,w_1000,c_fit',
  )
  const summary = createText(
    `${shortDuration(session.startDate, session.endDate)}\n${
      session.location.city
    }`.toUpperCase(),
    { fontSize: 50, fontWeight: 'bold', textAlign: 'center' },
    'co_white,g_south,y_50',
  )
  const brand = 'l_yyftwnsqdvsmrfq6db7c,c_scale,w_200,g_north_east,y_20,x_20'
  const icon = `l_${
    session.training.icon
  },c_scale,w_200,h_200,g_north_west,y_50,x_150`

  return absClUrl(
    'lucian-moldovan-180777_cs1uwi',
    [size, title, abstract, summary, brand, icon].join('/'),
  )
}
