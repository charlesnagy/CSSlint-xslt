<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
  <html>
  <head>
	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.min.js"></script>
	<script type="text/javascript" src="http://balupton.github.com/jquery-syntaxhighlighter/scripts/jquery.syntaxhighlighter.min.js"></script>
	<script type="text/javascript">$.SyntaxHighlighter.init({'lineNumbers': false,});</script>
	<style>
		table { margin: 10px auto; }
		table td { padding: 5px 10px; }
		tr:nth-child(odd) td { background-color: #eee; }
		.file {background: #2488F2; text-align:left; color: #fff; padding: 5px 10px;}
		.error { color: #CC042F; }
		.warning { color: #F07A05; }
		footer { text-align: center; font-size:11px; background-color: #efefef; color: #555; margin: 20px 0; }
	</style>
  </head>
  <body>
  <h1>CSSLint</h1>
    <table cellpadding="0" cellspacing="0">
      <tr>
        <th>Line</th>
        <th>Char</th>
		<th>Reason</th>
		<th>Source</th>
      </tr>
      <xsl:for-each select="csslint/file">
	  <tr>
		<th colspan="5" class="file"><xsl:value-of select="@name"/></th>
	  </tr>
		  <xsl:for-each select="issue">
          <tr>
	        <td><xsl:value-of select="@line"/></td>
	        <td><xsl:value-of select="@char"/></td>
	        <td>
				<xsl:attribute name="class">
			        <xsl:value-of select="@severity"/>
				</xsl:attribute>
				<xsl:value-of select="@reason"/></td>
	        <td><pre class="highlight"><xsl:value-of select="@evidence"/></pre></td>
          </tr>
		  </xsl:for-each>
      </xsl:for-each>
    </table>
	<footer>
		Created by Karoly Nagy 2012<br/>
		<a href="http://charlesnagy.info">http://charlesnagy.info</a><br/>
		<a href="https://github.com/charlesnagy/CSSlint-xslt">https://github.com/charlesnagy/CSSlint-xslt</a>
	</footer>
  </body>
  </html>
</xsl:template>
</xsl:stylesheet>
