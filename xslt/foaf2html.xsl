<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
    xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#"
    xmlns:foaf="http://xmlns.com/foaf/0.1/"
    xmlns="http://www.w3.org/1999/xhtml"
    version="1.0"
    exclude-result-prefixes="xsl rdf rdfs foaf"
    >
    
    
    <xsl:template match="/">
        <xsl:apply-templates select="rdf:RDF"/>
    </xsl:template>
    
    <xsl:template match="rdf:RDF">
        <div id="foafprofile">
            <h2><a href="{foaf:Person/@rdf:about}">me: <xsl:value-of select="foaf:Person/@rdf:about"/></a></h2>
            
            
            <xsl:apply-templates select="foaf:Person"/>
            <div class="widgetfooter">
                <a href="foaf.rdf" title="download the raw foaf rdf"><img src="images/foaf8015.gif"/></a>
            </div>
        </div>    
    </xsl:template>
    
    <xsl:template match="foaf:Person">
        <div class="foafperson"><xsl:apply-templates/></div>
    </xsl:template>

    <xsl:template match="foaf:name">
        <p>name: <xsl:value-of select="."/></p>
    </xsl:template>
    <xsl:template match="foaf:nick">
        <p>nickname: <xsl:value-of select="."/></p>
    </xsl:template>
    <xsl:template match="foaf:givenname">
        <p>given name: <xsl:value-of select="."/></p>
    </xsl:template>
    <xsl:template match="foaf:family_name">
        <p>family name: <xsl:value-of select="."/></p>
    </xsl:template>
    <xsl:template match="foaf:title">
        <p>title: <xsl:value-of select="."/></p>
    </xsl:template>
    <xsl:template match="foaf:based_near">
        <p>based near: <a href="{@rdf:resource}"><xsl:value-of select="@rdf:resource"/></a></p>
    </xsl:template>
    <xsl:template match="foaf:weblog">
        <p>blog: <a href="{@rdf:resource}"><xsl:value-of select="@rdf:resource"/></a></p>
    </xsl:template>
    <xsl:template match="foaf:homepage">
        <p>homepage: <a href="{@rdf:resource}"><xsl:value-of select="@rdf:resource"/></a>
        </p>
    </xsl:template>
    <xsl:template match="foaf:workplaceHomepage">
        <p>workplace homepage: <a href="{@rdf:resource}"><xsl:value-of select="@rdf:resource"/></a>
        </p>
    </xsl:template>
    <xsl:template match="foaf:workinfoHomepage">
        <p>work info homepage: <a href="{@rdf:resource}"><xsl:value-of select="@rdf:resource"/></a>
        </p>
    </xsl:template>
    <xsl:template match="foaf:schoolHomepage">
        <p>school homepage: <a href="{@rdf:resource}"><xsl:value-of select="@rdf:resource"/></a>
        </p>
    </xsl:template>
    <xsl:template match="foaf:knows[not(preceding-sibling::foaf:knows)]">
        <p>people I know:</p>
        <ul>
        <xsl:for-each select="../foaf:knows">
            <li><a href="{foaf:Person/@rdf:about}"><xsl:value-of select="foaf:Person/foaf:name"/></a></li>
        </xsl:for-each>
        </ul>
    </xsl:template>
    
    
    <xsl:template match="*"/>
</xsl:stylesheet>