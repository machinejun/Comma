<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../layout/header.jsp"%>

<div class="d-lg-flex half">
    <div class="bg order-1 order-md-2" style="background-image: url('images/bg_1.jpg');"></div>
    <div class="contents order-2 order-md-1">

      <div class="container">
        <div class="row align-items-center justify-content-center">
          <div class="col-md-7">
            <div class="mb-4">
              <h3>Sign Up</h3>
              <p class="mb-4">Please fill in this form to create an account.</p>
            </div>
            <form action="#" method="post">
              <div class="form-group first mb-2">
                <label for="username">Username</label>
                <input type="text" class="form-control" id="username">
				<div class="valid-feedback">Valid.</div>
    <div class="invalid-feedback">Please fill out this field.</div>
              </div>
              
              <div class="form-group second mb-2">
                <label for="password">Password</label>
                <input type="password" class="form-control" id="password">
					<div class="valid-feedback">Valid.</div>
    <div class="invalid-feedback">Please fill out this field.</div>
              </div>
              
              <div class="form-group third mb-2">
                <label for="repeatPassword">Repeat Password</label>
                <input type="password" class="form-control" id="repeatPassword">
					<div class="valid-feedback">Valid.</div>
    <div class="invalid-feedback">Please fill out this field.</div>
              </div>
              
              <div class="form-group fourth mb-2">
                <label for="email">Email</label>
                <input type="email" class="form-control" id="email">
					<div class="valid-feedback">Valid.</div>
    <div class="invalid-feedback">Please fill out this field.</div>
              </div>
              
              <div class="form-group fifth mb-2">
                <label for="phoneNumber">Mobile</label>
                <input type="text" class="form-control" id="phoneNumber">
                	<div class="valid-feedback">Valid.</div>
    <div class="invalid-feedback">Please fill out this field.</div>
              </div>
              
              <div class="form-group last mb-2">
                <label for="role">Role (Guest or Host)</label>
                <input type="text" class="form-control" id="role">
                	<div class="valid-feedback">Valid.</div>
    <div class="invalid-feedback">Please fill out this field.</div>
              </div>
              
              <input id="btn-save" type="submit" value="Sign Up" class="btn btn-block btn-primary">

              
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
  
  <script src="/js/guest.js"></script>
  
  <%@ include file="../layout/footer.jsp"%>