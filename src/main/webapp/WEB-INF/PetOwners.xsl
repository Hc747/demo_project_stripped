<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    xmlns:wsd="https://au.edu.uts.wsd/pet-manager" exclude-result-prefixes="wsd"
    version="2.0">
    <xsl:output method="html" indent="yes"/>

    <xsl:template match="/">
        <div>
            <div>
                <xsl:apply-templates/>
            </div>
        </div>
        
        <section>
            <div>
                <h1>
                    The data above was rendered using JSP and XSLT.
                </h1>
            </div>
        </section>
    </xsl:template>
    
    <xsl:template match="wsd:person">
        <div>
            
            <xsl:variable name="total">
                <xsl:value-of select="count(wsd:pets/wsd:animal)"/>
            </xsl:variable>
            
            <div id="person-{@id}">
                <div>
                    <div>
                        User Profile
                    </div>
                    <div>
                        <p>
                            <strong>
                                <xsl:value-of select="wsd:name"/>
                            </strong>
                        </p>
                        <p>
                            Contact: <a href="mailto:{wsd:email}">
                                <xsl:value-of select="wsd:email"/>
                            </a>
                        </p>
                        
                        <div>
                            <small>Dogs: <xsl:value-of select="count(wsd:pets/wsd:animal[wsd:species = 'DOG'])"/></small>
                            <small>Cats: <xsl:value-of select="count(wsd:pets/wsd:animal[wsd:species = 'CAT'])"/></small>
                            <small>Birds: <xsl:value-of select="count(wsd:pets/wsd:animal[wsd:species = 'BIRD'])"/></small>
                            <small>Total: <xsl:value-of select="$total"/></small>
                        </div>
                    </div>
                    <xsl:if test="$total &gt; 0">
                        <div>
                            <button>
                                Toggle
                            </button>
                        </div>
                    </xsl:if>
                </div> 
            </div>
        </div>
        
        <div id="pets-{@id}">
            <xsl:apply-templates select="wsd:pets"/>
        </div>
        
    </xsl:template>
    
    <xsl:template match="wsd:animal">
        <div>
            <div>
                <img src="{wsd:imageURL}" width="192" height="192"/>
                <div>
                    <p>
                        <strong>
                            <xsl:value-of select="wsd:name"/>
                        </strong>
                        <span>, <xsl:value-of select="wsd:species"/></span>
                    </p>
                    <small>
                        Microchip: <xsl:value-of select="@microchip"/>
                    </small>
                        
                    <div>
                        <a href="#person-{//@id}">Owners Profile</a>
                    </div>
                </div>
            </div>
        </div>
    </xsl:template>

</xsl:stylesheet>
