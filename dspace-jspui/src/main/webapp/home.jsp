<%--

    The contents of this file are subject to the license and copyright
    detailed in the LICENSE and NOTICE files at the root of the source
    tree and available online at

    http://www.dspace.org/license/

--%>
<%--
  - Home page JSP
  -
  - Attributes:
  -    communities - Community[] all communities in DSpace
  -    recent.submissions - RecetSubmissions
  --%>

<%@page import="org.dspace.content.Bitstream"%>
<%@ page contentType="text/html;charset=UTF-8" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ taglib uri="http://www.dspace.org/dspace-tags.tld" prefix="dspace" %>

<%@ page import="java.io.File" %>
<%@ page import="java.util.Enumeration"%>
<%@ page import="java.util.Locale"%>
<%@ page import="javax.servlet.jsp.jstl.core.*" %>
<%@ page import="javax.servlet.jsp.jstl.fmt.LocaleSupport" %>
<%@ page import="org.dspace.core.I18nUtil" %>
<%@ page import="org.dspace.app.webui.util.UIUtil" %>
<%@ page import="org.dspace.app.webui.components.RecentSubmissions" %>
<%@ page import="org.dspace.content.Community" %>
<%@ page import="org.dspace.core.ConfigurationManager" %>
<%@ page import="org.dspace.core.NewsManager" %>
<%@ page import="org.dspace.browse.ItemCounter" %>
<%@ page import="org.dspace.content.Metadatum" %>
<%@ page import="org.dspace.content.Item" %>
<%@page import="org.dspace.core.Utils"%>
<link rel="stylesheet" href="<%= request.getContextPath() %>/thrive.css" type="text/css" />

<%
    Community[] communities = (Community[]) request.getAttribute("communities");

    Locale sessionLocale = UIUtil.getSessionLocale(request);
    Config.set(request.getSession(), Config.FMT_LOCALE, sessionLocale);
    String sideNews = NewsManager.readNewsFile(LocaleSupport.getLocalizedMessage(pageContext, "news-side.html"));

    boolean feedEnabled = ConfigurationManager.getBooleanProperty("webui.feed.enable");
    String feedData = "NONE";
    if (feedEnabled)
    {
        feedData = "ALL:" + ConfigurationManager.getProperty("webui.feed.formats");
    }

    ItemCounter ic = new ItemCounter(UIUtil.obtainContext(request));

    RecentSubmissions submissions = (RecentSubmissions) request.getAttribute("recent.submissions");
    RecentSubmissions rs = (RecentSubmissions) request.getAttribute("recently.submitted");//recent.submissions");
    //Item[] itemsS = rs.getRecentSubmissions();
%>


<dspace:layout locbar="nolink" titlekey="jsp.home.title" feedData="<%= feedData %>">

    <div class="container">
<%--
        <form method="get" action="<%= request.getContextPath() %>/simple-search" class="form-horizontal col-md-12 form-group form-group-lg" scope="search" role="form">

                <%-- <div id="logo-deposita" class="text-center">
                    <a  id="link-logo-deposita" href="<%= request.getContextPath() %>/community-list">
                        <img src="<%= request.getContextPath() %>/image/logo.gif" usemap="#mapa-brasil">
                    </a>
                </div> --%>
<%--

            <div class="col-md-12 searchbox">
                <div class="col-md-11">
                    <input type="text" class="form-control " placeholder="<fmt:message key="jsp.layout.navbar-default.search"/>" name="query" id="tequery-main-page" size="25"/>
                </div>
                <div class="col-md-1">
                    <button type="submit" class="btn btn-primary pull-right search-button"><span class="glyphicon glyphicon-search"></span></button>
                </div>
            </div>


        </form>
--%>

        <div class="container row" style="padding-top:1px;">
		<div class="col-xs-12 col-sm-12 col-md-12 main-content">
			<div>
				<%-- <h2 class="ds-div-head page-header first-page-header">About</h2>--%>
				<h1 class="ds-div-head page-header first-page-header"><fmt:message key="jsp.fbn.sobre"/></h1>
				<div id="file_news_div_news" class="ds-static-div primary">
					<p style="font-size: 18px;">
					O<strong> repositório institucional da Faculdade Boas Novas</strong> foi criado em 2018 e almeja armazenar, preservar, disseminar e permitir o acesso aberto aos documentos acadêmicos, científicos e técnicos produzidos por pesquisadores, docentes e discentes da Boas Novas.</p>
				</div>
				<div class="ds-div-head page-header first-page-header" style="margin: 1px 0 1px;"></div>
				
				<h1 class="ds-div-head page-header first-page-header"><fmt:message key="jsp.community-list.title"/></h1>
				<%-- 
				<h2 class="ds-div-head page-header">Autoarquivamento de Dissertações e Teses</h2>
				<div id="file_news_div_news" class="ds-static-div primary">
					<p class="ds-paragraph">Para iniciar seu autoarquivamento clique em: <a href="/submissions" class="btn btn-default">Login</a>
					</p>
					<p class="ds-paragraph">Para mais informações acesse <a href="http://bit.ly/1IPyV6L" class="btn btn-default"><span class="glyphicon glyphicon-info-sign">&nbsp;</span>Informações autoarquivamento</a>
					</p>
				</div>

				<h2 class="ds-div-head page-header">Dúvidas</h2>
				<div id="file_news_div_news" class="ds-static-div primary">
					<p class="ds-paragraph">Caso possua dúvidas consulte um bibliotecário (de segunda a sexta das 09h às 12h, exceto feriados): <a href="/chat" class="btn btn-primary bold"><span class="glyphicon glyphicon-comment">&nbsp;</span>Atendimento online</a>
					</p>
					<p class="ds-paragraph">Você também pode enviar sua dúvida pelo formulário: <a href="/feedback" class="btn btn-primary bold"><span class="glyphicon glyphicon-envelope">&nbsp;</span>Envie sua dúvida</a>
					</p>
				</div>
				--%>

		</div>
		<div class="visible-xs visible-sm">
		<footer>
		<div class="row">
		<hr>
		<div class="col-xs-7 col-sm-8">
		<div>
		<a title="Universidade Estadual Paulista 'Júlio de Mesquita Filho'" target="_blank" href="http://www.unesp.br/">Universidade Estadual Paulista "Júlio de Mesquita Filho"</a>
		</div>
		<div class="hidden-print">
		<a href="/page/about">About Repositório Institucional UNESP</a> • <a href="/page/faq">Frequently Asked Questions (FAQ)</a> • <a href="/feedback">Contact Us</a> • <a href="/password-login"><span class="hidden-xs">Administrativo</span></a>
		</div>
		</div>
		<div class="col-xs-5 col-sm-4 hidden-print">
		<div class="pull-right hidden-xs">
		<a href="http://www.unesp.br/" target="_blank" title="Universidade Estadual Paulista 'Júlio de Mesquita Filho'"><img src="/themes/Mirage2/images/logo-unesp.png" alt="Universidade Estadual Paulista 'Júlio de Mesquita Filho'"></a>
		</div>
		</div>
		</div>
		<a class="hidden" href="/htmlmap">&nbsp;</a>
		<p>&nbsp;</p>
		</footer>
		</div>
		</div>

            <% request.setAttribute("createRootDiv", false); %>

                <%-- Coloquei no final
                <%@ include file="discovery/static-sidebar-facet.jsp" %>
                --%>
        </div>

        <%
            //if (submissions != null && submissions.count() > 0)
            if(true == true)
            {
        %>
        <div class="row" style="padding-top:1px;">
            <%
                if (communities != null && communities.length != 0)
                //if(true == true)
                {
            %>

            <div class="row" style="padding-top:1px;">
                <div id="container">
                    <ul class="media-list">
                        <%
                            boolean showLogos2 = ConfigurationManager.getBooleanProperty("jspui.home-page.logos", true);
                            for (int i = 0; i < communities.length; i++)
                            {
                        %>
                        <li>
                            <div id="portfolio">
                                <div class="portfolio-item">
                                    <%
                                        Bitstream logo2 = communities[i].getLogo();
                                        if (showLogos2 && logo2 != null) { %>
                                    <a class="portfolio-link" href="<%= request.getContextPath() %>/handle/<%= communities[i].getHandle() %>">
                                        <div style="min-height: 50px;" class="portfolio-hover">
                                            <div class="portfolio-hover-content">
                                                <i class="fa fa-search-plus fa-4x"></i>
                                            </div>
                                        </div>
                                        <img alt="community logo" src="<%= request.getContextPath() %>/retrieve/<%= logo2.getID() %>" class="media-object img-responsive">
                                    </a>
                                    <% } else { %>

                                    <% }  %>
                                    <div class="portfolio-caption"><h4><a href="<%= request.getContextPath() %>/handle/<%= communities[i].getHandle() %>"><%= communities[i].getMetadata("name") %></a>
                                        <%
                                            if (ConfigurationManager.getBooleanProperty("webui.strengths.show"))
                                            {
                                        %>
                                        <span class="badge pull-right"><%= ic.getCount(communities[i]) %></span>
                                        <%
                                            }

                                        %>
                                    </h4>
                                    </div>
                                </div>
                            </div>
                        </li>
                        <%
                            }
                        %>
                    </ul>
                </div>
            </div>


            <div class="col-md-4">

                <%
                    }
                %>

                    <%--
                            <div class="col-md-8">
                            <div class="panel panel-primary">
                            <div id="recent-submissions-carousel" class="panel-heading carousel slide">
                              <h3><fmt:message key="jsp.collection-home.recentsub"/>
                                  <%
                        if(feedEnabled)
                        {
                                String[] fmts = feedData.substring(feedData.indexOf(':')+1).split(",");
                                String icon = null;
                                int width = 0;
                                for (int j = 0; j < fmts.length; j++)
                                {
                                    if ("rss_1.0".equals(fmts[j]))
                                    {
                                       icon = "rss1.gif";
                                       width = 80;
                                    }
                                    else if ("rss_2.0".equals(fmts[j]))
                                    {
                                       icon = "rss2.gif";
                                       width = 80;
                                    }
                                    else
                                    {
                                       icon = "rss.gif";
                                       width = 36;
                                    }
                        %>
                            <a href="<%= request.getContextPath() %>/feed/<%= fmts[j] %>/site"><img src="<%= request.getContextPath() %>/image/<%= icon %>" alt="RSS Feed" width="<%= width %>" height="15" style="margin: 3px 0 3px" /></a>
                        <%
                                }
                            }
                        %>
                              </h3>

                              <!-- Wrapper for slides -->
                              <div class="carousel-inner">
                                <%
                                boolean first = true;
                                for (Item item : submissions.getRecentSubmissions())
                                {
                                    Metadatum[] dcv = item.getMetadata("dc", "title", null, Item.ANY);
                                    String displayTitle = "Untitled";
                                    if (dcv != null & dcv.length > 0)
                                    {
                                        displayTitle = Utils.addEntities(dcv[0].value);
                                    }
                                    dcv = item.getMetadata("dc", "description", "abstract", Item.ANY);
                                    String displayAbstract = "";
                                    if (dcv != null & dcv.length > 0)
                                    {
                                        displayAbstract = Utils.addEntities(dcv[0].value);
                                    }
                            %>
                                <div style="padding-bottom: 50px; min-height: 200px;" class="item <%= first?"active":""%>">
                                  <div style="padding-left: 80px; padding-right: 80px; display: inline-block;"><%= StringUtils.abbreviate(displayTitle, 400) %>
                                      <a href="<%= request.getContextPath() %>/handle/<%=item.getHandle() %>" class="btn btn-success">See</a>
                                            <p><%= StringUtils.abbreviate(displayAbstract, 500) %></p>
                                  </div>
                                </div>
                            <%
                                    first = false;
                                 }
                            %>
                              </div>

                              <!-- Controls -->
                              <a class="left carousel-control" href="#recent-submissions-carousel" data-slide="prev">
                                <span class="icon-prev"></span>
                              </a>
                              <a class="right carousel-control" href="#recent-submissions-carousel" data-slide="next">
                                <span class="icon-next"></span>
                              </a>

                              <ol class="carousel-indicators">
                                <li data-target="#recent-submissions-carousel" data-slide-to="0" class="active"></li>
                                <% for (int i = 1; i < submissions.count(); i++){ %>
                                <li data-target="#recent-submissions-carousel" data-slide-to="<%= i %>"></li>
                                <% } %>
                              </ol>
                         </div></div></div>
                    --%>

                    <%-- div de sites relacionados --%>
<%--                <div class="col-md-4"><div style="padding-left: 10px;">
                    <h3>Sistemas Relacionados</h3>
                        <%-- <p><fmt:message key="jsp.home.com2"/></p> --%>
<%--                    <div class="container text-muted" style="padding-left: 0px;">

                        <div class="text-center col-md-8">
                            <div class="footer-logo pull-left">

                                <a href="http://ufam.edu.br/" target="_blank">
                                    <img class="pull-left" src="/image/logo-instituicao-rodape.jpg"></a>

                                <a href="http://protec.ufam.edu.br/" target="_blank">
                                    <img class="pull-left " style="padding-right:10px;" src="/image/protec.jpg"></a>

                                <a href="http://biblioteca.ufam.edu.br/" target="_blank">
                                    <img class="pull-left" src="/image/logo-tede.resize.png"></a>


                            </div>

                        </div>

                    </div>

                </div>
                </div>
            </div>
--%>
                <%-- div de sites relacionados --%>


        </div>
        <%
            }
        %>

        <div class="container row">

            <% request.setAttribute("createRootDiv", false); %>


            <%@ include file="discovery/static-sidebar-facet.jsp" %>

        </div>

    </div>

    <%--
    <div class="container row">
    <%
    if (communities != null && communities.length != 0)
    {
    %>
        <div class="col-md-4">
                   <h3><fmt:message key="jsp.home.com1"/></h3>
                    <p><fmt:message key="jsp.home.com2"/></p>
                    <div class="list-group">
    <%
        boolean showLogos = ConfigurationManager.getBooleanProperty("jspui.home-page.logos", true);
        for (int i = 0; i < communities.length; i++)
        {
    %><div class="list-group-item row">
    <%
            Bitstream logo = communities[i].getLogo();
            if (showLogos && logo != null) { %>
        <div class="col-md-3">
            <img alt="Logo" class="img-responsive" src="<%= request.getContextPath() %>/retrieve/<%= logo.getID() %>" />
        </div>
        <div class="col-md-9">
    <% } else { %>
        <div class="col-md-12">
    <% }  %>
            <h4 class="list-group-item-heading"><a href="<%= request.getContextPath() %>/handle/<%= communities[i].getHandle() %>"><%= communities[i].getMetadata("name") %></a>
    <%
            if (ConfigurationManager.getBooleanProperty("webui.strengths.show"))
            {
    %>
            <span class="badge pull-right"><%= ic.getCount(communities[i]) %></span>
    <%
            }

    %>
            </h4>
        </div>
    </div>
    <%
        }
    %>
        </div>
        </div>
    <%
    }
    %>
    </div>

    </div>
    --%>

</dspace:layout>
