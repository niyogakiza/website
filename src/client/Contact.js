import React from 'react'
import styled from 'styled-components'
import { Helmet } from 'react-helmet'
import theme from 'style/theme'
import PageContainer from 'client/PageContainer'
import Header from 'client/Header'
import Footer from 'client/Footer'
import ContactForm from 'client/contact/ContactForm'
import MainTitle from 'modules/components/MainTitle'
import Lead from 'modules/components/Lead'
import Hero from 'modules/components/Hero'

const ContactHero = Hero.extend`
  background-color: #655C52;
  background-image: url(http://res.cloudinary.com/smooth/image/upload/f_auto,q_auto/v1497534886/typewriter-8019212_hiim90.jpg);
`

const Container = styled.div`
  flex: 1;
  display: flex;
  flex-direction: column-reverse;
  margin: 20px auto;
  max-width: 1000px;
  width: 100%;
  @media (min-width: ${theme.medias.phablet}) {
    flex-direction: row;
    margin: 50px auto;
  }
`

const FormContainer = styled.div`
  flex: 2;
`

const Infos = styled.div`
  flex: 1;
  padding: 20px;
  @media (min-width: ${theme.medias.phablet}) {
    padding: 40px;
  }
`

const Label = styled.div`
  font-weight: bold;
  font-size: 14px;
  text-transform: uppercase;
  margin-bottom: 10px;
`

const Info = styled.div`
  margin-bottom: 30px;
  font-size: 20px;
  font-weight: 300;

  address {
    font-style: normal;
  }

  a {
    color: ${theme.colors.primary};
    text-decoration: none;
  }
`

const Contact = () =>
  <PageContainer>
    <Helmet>
      <title>Nous contacter</title>
    </Helmet>
    <Header />
    <ContactHero>
      <MainTitle>Contactez-nous</MainTitle>
      <Lead>L&apos;équipe Smooth Code est à votre service.</Lead>
    </ContactHero>
    <Container>
      <Infos>
        <Label>Adresse</Label>
        <Info>
          <address>41 rue Réaumur Sébastopol<br />75003 Paris</address>
        </Info>
        <Label>Téléphone</Label>
        <Info><a href="tel:0650588079">06 50 58 80 79</a></Info>
        <Label>Email</Label>
        <Info>
          <a href="mailto:contact@smooth-code.com">contact@smooth-code.com</a>
        </Info>
      </Infos>
      <FormContainer>
        <ContactForm />
      </FormContainer>
    </Container>
    <Footer />
  </PageContainer>

export default Contact
