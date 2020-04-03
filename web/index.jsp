<%@ page import="beans.Pair" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title></title>
  </head>
  <body>
  <h3>Fifth Homework</h3>

  <%
    String key = request.getParameter("key");
    String value = request.getParameter("value");
    String scope = request.getParameter("scope");

    if (!(key == null || value == null || scope == null || key.equals("") || value.equals("") || scope.equals(""))){
      scope = scope.toLowerCase();
      Pair pair = new Pair().setKey(key).setValue(value);
      List<Pair> list;
      switch (scope) {
        case "request":
          request.setAttribute("pair", pair);
        break;
        case "session":
          list = (List<Pair>) session.getAttribute("list");
          if (list == null)
            list = new ArrayList<>();
          list.add(pair);
          session.setAttribute("list", list);
        break;
        case "application":
          list = (List<Pair>) application.getAttribute("list");
          if (list == null)
            list = new ArrayList<>();
          list.add(pair);
          application.setAttribute("list", list);
        break;
      }
    }
  %>

  <form>
    <label for="scopes">Choose a scope:</label>
    <select id="scopes" name="scope">
      <option value="REQUEST">REQUEST</option>
      <option value="SESSION">SESSION</option>
      <option value="APPLICATION">APPLICATION</option>
    </select>
    <br><br>
    Key   : <input type="text" name="key"/><br><br>
    Value : <input type="text" name="value"><br><br>
            <input type="submit" value="Potvrda"/>
  </form>

  <br><br>

  <% if(request.getAttribute("pair") != null) { %>
  <% Pair pair =  ((Pair)request.getAttribute("pair")); %>
  <div style="background-color:darkred">
    Request Scope
    <p>Key: <%= pair.getKey() %>, Value: <%= pair.getValue() %></p>
  </div>
  <%}%>
  <br>
  <% if(session.getAttribute("list") != null) { %>
  <div style="background-color:orangered">
    Session Scope
    <p>JSESSIONID je <%=session.getId()%> <% %></p>
    <% List<Pair> pairs = (List<Pair>)session.getAttribute("list");
      for(Pair pair : pairs) { %>
    <p>Key : <%= pair.getKey() %> , Value : <%= pair.getValue() %></p>
    <%}%>
  </div>
  <%}%>
  <br>
  <% if(application.getAttribute("list") != null) { %>
  <div style="background-color:greenyellow">
    Application Scope
    <% List<Pair> pairs = (List<Pair>)application.getAttribute("list");
      for(Pair pair : pairs) { %>
    <p>Key : <%= pair.getKey() %> , Value : <%= pair.getValue() %></p>
    <%}%>
  </div>
  <%}%>



  </body>
</html>