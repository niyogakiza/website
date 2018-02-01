import gql from 'graphql-tag'

export const sessionCardFragment = gql`
  fragment SessionCard on Session {
    id
    startDate
    endDate
    link
    inStock
    location {
      id
      name
      address
      zipcode
      city
    }
    training {
      id
      slug
      title
      abstract
      socialTitle
      socialAbstract
      icon
      color
      price
    }
  }
`

export const articleCardFragment = gql`
  fragment ArticleCard on Article {
    id
    slug
    link
    title
    published_at
    feature_image {
      url
    }
    custom_excerpt
    author {
      slug
      name
      profile_image {
        url
      }
      link
    }
    tags {
      slug
      name
    }
  }
`
