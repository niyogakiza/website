import React from 'react'
import { Link } from 'react-router-dom'
import NavItem from 'client/NavItem'

export default () => (
  <nav className="navbar navbar-toggleable-sm navbar-inverse bg-inverse fixed-top">
    <button
      className="navbar-toggler navbar-toggler-right"
      type="button"
      data-toggle="collapse"
      data-target="#navbarSupportedContent"
      aria-controls="navbarSupportedContent"
      aria-expanded="false"
      aria-label="Toggle navigation"
    >
      <span className="navbar-toggler-icon" />
    </button>
    <Link to="/" className="navbar-brand">
      Smooth Code
    </Link>
    <div className="collapse navbar-collapse" id="navbarSupportedContent">
      <ul className="navbar-nav">
        <NavItem exact to="/">
          Home
        </NavItem>
        <NavItem to="/about">
          About
        </NavItem>
      </ul>
    </div>
  </nav>
)