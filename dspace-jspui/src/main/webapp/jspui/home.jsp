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
		<form method="get" action="<%= request.getContextPath() %>/simple-search" class="form-horizontal col-md-12 form-group form-group-lg" scope="search" role="form">
						
			<div id="logo-deposita" class="text-center">
				<a  id="link-logo-deposita" href="<%= request.getContextPath() %>/community-list">
					<img src="<%= request.getContextPath() %>/image/logo.gif" usemap="#mapa-brasil">		
				</a>
			</div>
			
			
		<div class="col-md-12 searchbox">
			<div class="col-md-11">
		   		<input type="text" class="form-control " placeholder="<fmt:message key="jsp.layout.navbar-default.search"/>" name="query" id="tequery-main-page" size="25"/>
			</div>				
			<div class="col-md-1">
			   <button type="submit" class="btn btn-primary pull-right search-button"><span class="glyphicon glyphicon-search"></span></button>
			</div>
		</div>

		
		</form>


<div class="container row">

    <% request.setAttribute("createRootDiv", false); %>
	
	<%@ include file="discovery/static-sidebar-facet.jsp" %>
</div>

<%
if (submissions != null && submissions.count() > 0)
//if(true == true)
{
%>
<div class="row">
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
<%--        <div class="col-md-4"><div style="padding-left: 10px;">
               <h3>Sistemas Relacionados</h3>
		       <%-- <p><fmt:message key="jsp.home.com2"/></p> --%>
<%--		<div class="container text-muted" style="padding-left: 0px;">

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
