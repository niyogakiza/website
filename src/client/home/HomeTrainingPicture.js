import React from 'react'
import { clUrl } from 'modules/cloudinary'
import HomeContainer from './HomeContainer'

const Container = HomeContainer.extend`
  background-color: #333;
  background: url(${clUrl('trainingWorkshop2.jpg', 'e_art:audrey')}) top center;
  background-size: cover;
  height: 300px;
  width: 100%;
`

const HomePrice = () => <Container />

export default HomePrice
