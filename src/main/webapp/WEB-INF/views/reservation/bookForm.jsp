<%@ page language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<html lang="en">

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>jQuery UI Datepicker - Display inline</title>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  <script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>

<body>
 
Date:
      <input
        type="text"
        id="checkinDate"
        style="width: 80px"
      />~<input
        type="text"
        id="checkoutDate"
        style="width: 80px"
      />
    </p>

    <button
      id="write"
      onclick="checkDate()"
      type="button"
    >
      제출
    </button>
 
 
</body>
</html>
      

<script src="../js/reservation/reservation.js"></script>