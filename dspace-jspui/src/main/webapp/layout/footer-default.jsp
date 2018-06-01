<%--

    The contents of this file are subject to the license and copyright
    detailed in the LICENSE and NOTICE files at the root of the source
    tree and available online at

    http://www.dspace.org/license/

--%>
<%--
  - Footer for home page
  --%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ page contentType="text/html;charset=UTF-8" %>

<%@ page import="java.net.URLEncoder" %>
<%@ page import="org.dspace.app.webui.util.UIUtil" %>

<%
    String sidebar = (String) request.getAttribute("dspace.layout.sidebar");
%>

            <%-- Right-hand side bar if appropriate --%>
<%
    if (sidebar != null)
    {
%>
	</div>
	<div class="col-md-3">
                    <%= sidebar %>
    </div>
    </div>       
<%
    }
%>
</div>
</main>

	<div id="footerWrapper" style="padding-bottom:10px;">

            <!-- innerLayoutWrapper -->
            <div class="innerLayoutWrapper">

                <!-- quickLinksCol -->
                <div id="quickLinksCol1" class="quickLinksCol">

                    <h3 class="title">
					Faculdade Boas Novas                    </h3>
		    <img src="<%= request.getContextPath() %>/image/LOGO.png" style="padding-right:10px;" height="100">

                    
                    

                </div><!-- /quickLinksCol -->

                <!-- quickLinksCol -->
                <div id="quickLinksCol2" class="quickLinksCol">

                    <h3 class="title">
					Contatos                    </h3>

                    <p>Ligue para nós:<br>
(92) 3237 2214<br>
(92) 98121 2373</p>

<p>Email:<br>
<a href="mailto:biblioteca@fbnovas.edu.br">biblioteca@fbnovas.edu.br</a></p>
<%--
<p>Sales:<br>
<a href="mailto:sales@smalley.com">sales@smalley.com</a></p>--%>

                </div><!-- /quickLinksCol -->

                <!-- emailSignupWrapper -->
                <div id="emailSignupWrapper" class="emailSignupCol">
                    <!-- Begin: Pseudo-Generated Code -->
                    <div id="socialNetworksWrapper">
                        <h3 class="title">Nossas mídias Socias</h3>
                        <ul id="menu-social-networks-menu"><li class="menu-541 first"><a href="https://www.facebook.com/FaculdadeBoasNovas" class="facebook" target="_blank">Facebook</a></li>
<li class="menu-542"><a href="https://twitter.com/fbnovasoficial" class="twitter" target="_blank">Twitter</a></li>
<%--<li class="menu-543"><a href="http://www.linkedin.com/company/smalley-steel-ring-co" class="linkedin" target="_blank">LinkedIn</a></li>--%>
<li class="menu-544"><a href="https://plus.google.com/u/0/107259619052408844106" class="google" target="_blank">Google+</a></li>
<%--<li class="menu-684"><a href="http://www.youtube.com/user/SmalleySteelRing" class="youtube" target="_blank">YouTube</a></li>
<li class="menu-2025 last"><a href="https://www.slideshare.net/RingsandSprings" class="slideshare">Slideshare</a></li>--%>
</ul>                    </div>
                    <!-- End: Pseudo-Generated Code -->

                    <div class="clearer"></div>

			<br>
			<div id="socialNetworksWrapper">
						<h3 class="title">Links Úteis</h3>

				<p>
					<a href="<%= request.getContextPath() %>/feedback" style="color: #fff !important;">Feedback</a>
				</p>

	                </div>


			<div class="clearer"></div>

                </div>

                </div><!-- /emailSignupWrapper -->

                <div class="clearer"></div>

            </div><!-- innerLayoutWrapper -->

        </div>

<%-- COPYRIGHT --%>
	<div id="copyrightWrapper" style="padding: 10px;">

            <!-- innerLayoutWrapper -->
            <div class="innerLayoutWrapper">

                <div id="copyrightText">
                    <a href="http://fbnovas.edu.br/sitefbnovas" style="color: #fff !important;">© 2018 | Faculdade Boas Novas</a>. Desenvolvido por Diogo <a href="http://diogosm.github.io/" style="color: #f0940a !important;">dsm[A]</a> Soares.                </div>

                <div id="copyrightMenu">
                                    </div>

                <div class="clearer"></div>

            </div><!-- /innerLayoutWrapper -->

        </div>
            <%-- Page footer --%>
             <%--<footer class="navbar navbar-inverse navbar-bottom">
          

	     
             <div id="footer_feedback" class="pull-right" style="padding-bottom: 25px;">  
                                
				<%-- <img src="<%= request.getContextPath() %>/image/ibict-60.png"> --%>
                                <%-- <img src="<%= request.getContextPath() %>/image/ABECIN_NEG.png" height="100"> --%>
                                <%-- <img src="<%= request.getContextPath() %>/image/ABECIN.png" style="padding-right:10px;" height="100"> --%>
                                <%-- <img src="<%= request.getContextPath() %>/image/ABECIN_POSI.png" height="100"> --%>
                                <%-- <img src="<%= request.getContextPath() %>/image/logo_ufam_png.png" height="100"> --%>
                                <%-- <img src="<%= request.getContextPath() %>/image/ctic_branca.png" height="100" style="padding-right:10px;"> --%>
               <%--                 <img src="<%= request.getContextPath() %>/image/LOGO.png" height="100" style="padding-right:10px;">
                                <%-- <img src="<%= request.getContextPath() %>/image/ufam_preta.png" height="100"> --%>
		<%--						
                                </div>
			</div>
    </footer>--%>
    </body>
</html>
