<%@ page import="com.fssa.books.model.User"%>
<nav class="navbar navbar-light bg-info navbar-expand-lg">

  <a class="navbar-brand" href="BookServlet" style="color: #fff; font-weight: bold">
    <img src="https://s3.eu-central-1.amazonaws.com/bootstrapbaymisc/blog/24_days_bootstrap/logo_white.png" width="30" height="30" alt="logo" >
    BookTrans
  </a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar-list-6" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
      <%-- Check if the "id" parameter exists and is not empty --%>
<% String id = request.getParameter("id"); %>
      <% User obj = (User) session.getAttribute("user"); %>
        <%-- Check if "id" is not equal to "admin" --%>
             <div class="collapse navbar-collapse justify-content-end" id="navbar-list-6">
         <%if (obj==null) {%>
    <ul class="navbar-nav">
          <li class="nav-item">
            <a class="nav-link" href="#" style="color: #fff; font-weight: bold;">Borrows</a>
          </li>
           <li class="nav-item">
            <a class="nav-link" href="#" style="color: #fff; font-weight: bold;">Returns</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#" style="color: #fff; font-weight: bold;">profile</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#" style="color: #fff; font-weight: bold;">Logout</a>
          </li>
          </ul>

        <%} else{%>
              <%String role=obj.getRole().toString(); %>
      <%String name = obj.getName(); %>
      <%String email=obj.getEmail();%>
        <% if (role.equals("BORROWER")) { %>
    <ul class="navbar-nav">
         <li class="nav-item">
            <a class="nav-link" href="borrow.jsp" style="color: #fff; font-weight: bold;">Borrows</a>
          </li>
           <li class="nav-item">
            <a class="nav-link" href="return.jsp" style="color: #fff; font-weight: bold;">Returns</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="ProfileServlet?email=<%=email%> %>" style="color: #fff; font-weight: bold;"><%=name %></a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="LogOutServlet" style="color: #fff; font-weight: bold;">Logout</a>
          </li>
          </ul>
        <% } else { %>
    <ul class="navbar-nav">
          <li class="nav-item">
            <a class="nav-link" href="addbooksform.jsp" style="color: #fff; font-weight: bold;">AddBooks</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="borrow.jsp" style="color: #fff; font-weight: bold;">Borrows</a>
          </li>
           <li class="nav-item">
            <a class="nav-link" href="return.jsp" style="color: #fff; font-weight: bold;">Returns</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="ProfileServlet?email=<%=email%>" style="color: #fff; font-weight: bold;"><%=name%></a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="LogOutServlet" style="color: #fff; font-weight: bold;">Logout</a>
          </li>
          </ul>
        <% } } %>
        </div>
</nav>

