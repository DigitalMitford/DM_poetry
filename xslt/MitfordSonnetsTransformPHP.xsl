<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
    xmlns="http://www.w3.org/1999/xhtml"
    xmlns:dm="http://digitalmitford.org/nss/dm"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes = "dm">
  
  <!--2021-08-14 updated output line for XHTML 5 with no XML declaration -->
    <xsl:output method="xhtml" omit-xml-declaration="yes" html-version="5.0"/>
      
   <!--2018-01-24 ebb: NOTES on updating this:
   TRANSFORM double-hyphens into proper em dashes, 
   KEEP CHECKING the output of add elements, and generate new span elements to style with CSS for handwritten notes by pen annotator and others.
   -->
      
 <xsl:variable name="si" select="document('http://digitalmitford.org/si.xml')" as="document-node()+"/> 
 <xsl:function name="dm:respHandler" as="item()">
     <xsl:param name="resp" as="attribute()"/>
     <xsl:sequence select="$resp ! tokenize(., '\s+') ! substring-after(., '#') => string-join(', ')"/>
     
 </xsl:function>
    
    <xsl:template match="/">
        <html lang="en">
            <head>
                <title>Digital Mitford: The Mary Russell Mitford Archive</title>
               <!-- <meta charset="UTF-8"/>-->
                <meta name="Description"
                    content="Supported by the Mary Russell Mitford Society and Penn State Erie, The Behrend College."/>
                <meta name="keywords"
                    content="Mitford, Mary Russell Mitford, Digital Mitford, Digital Mary Russell Mitford, Digital Mary Russell Mitford Archive, Mitford Archive, TEI, Text Encoding Initiative, digital edition, electronic edition, electronic text, Romanticism, Romantic literature, Victorianism, Victorian literature, humanities computing, electronic editing, Beshero-Bondar"/>
                <meta name="viewport" content="width=device-width, initial-scale=1.0" />
                <link rel="stylesheet" type="text/css" href="mitfordpoems.css"/>
                <!--<script type="text/javascript" src="MRMLetters.js" xml:space="preserve">...</script>-->
                <script type="text/javascript" src="MRMLetters.js">/**/</script>
            </head>
            <body>

                <div id="nav_wide">   <!--<h1>Digital Mitford:
            The Mary Russell Mitford Archive</h1>-->
                    <div id="menu">       
                        <!-- <h2><a href="index.html">Welcome</a> | <a href="about.html">About</a> | <a href="bibliogType.html">Published Works</a> | <a href="lettersData.html">Manuscript Locations</a> | <a href="letters.html">Letters</a> | <a href="visual.html">People, Places, and Networks</a> | <a href="staff.html">Staff</a> | <a href="workshop.html">Workshop Materials</a></h2>-->
                        <ul id="siteMenu">
                            <li class="title"><span class="mainTitle">Digital Mitford:</span><br/> <span class="subTitle">The Mary Russell Mitford Archive</span></li>
                            <li class="mainMenu"><ul class="mainMenu"><li class="section" id="Overview"><!--Overview-->
                                <span class="menuLarger">Prototype Testing View</span>
                                <ul class="subSec"><li class="subMenu"><a href="https://digitalmitford.org">Home</a></li>
                                  <li class="subMenu"><a href="https://digitalmitford.org/visual.html">Mitford’s Worlds</a></li>
                                </ul>
                            </li>
                                <li class="section" id="Editions"><!--Editions-->
                                    <ul class="subSec">
                                        <li class="subMenu"><a href="https://digitalmitford.org/letters.html">Letters</a></li>
                                        <li class="subMenu">Plays</li>
                                        <li class="subMenu">Poems</li>
                                        <li class="subMenu">Fiction</li>
                                    </ul>
                                </li>
                                
                                <li class="section" id="Bib"><!--Bibliography &amp; MSS-->
                                    <ul class="subSec">
                                        <li class="subMenu"><a href="https://digitalmitford.org/bibliogType.html">Bibliography</a></li>
                                        <li class="subMenu"><a href="https://digitalmitford.org/lettersData.html">Manuscript Locations</a></li>
                                        
                                    </ul>
                                </li>
                                
                                <li class="section" id="Project"><!--Project-->
                                    <ul class="subSec">
                                        <li class="subMenu"><a href="https://digitalmitford.org/about.html">Methods &amp; Background</a></li>
                                        <li class="subMenu"><a href="https://digitalmitford.org/staff.html">Staff</a></li>
                                        <li class="subMenu">Scholarship</li>
                                    </ul>
                                </li>
                                <li class="section" id="Outreach"><!--Outreach-->
                                    <ul class="subSec">
                                        <li class="subMenu"><a href="https://digitalmitford.org/workshop.html">Coding School</a></li>
                                        <li class="subMenu"><a href="https://digitalmitford.wordpress.com/">Blog</a></li>
                                        <li class="subMenu"><a href="https://digitalmitford.org/applicationProcess.html">Become a Mitford Editor</a></li>
                                    </ul>
                                    
                                </li>
                                
                            </ul>
                            </li>
                        </ul>
                    </div>
                </div>  
                
              <div id="container">                   
                    <div id="poemsHead">
                       
                       <!-- <div id="fieldset">
                            <fieldset>
                                <legend><span class="dipNorm">Our default is the Diplomatic view.<br/> Click to toggle the Normalized view</span><span class="dipNormSmall"> (shows conventional spellings;<br/> hides pagebreaks, insertion marks, and deletions):</span></legend>
                                <input type="checkbox"
                                    id="REGtoggle"
                                    style="cursor:pointer"/>
                                <br/>
                            </fieldset>
                        </div>-->
                        <xsl:apply-templates select="//teiHeader"/> 
                        <section class="interfaceInstructions">
                            <h3>For mouse or touchscreen interaction:</h3>
               
                            <ul>
                                <li>Click, tap, or move your cursor over a highlighted passage or number to display an annotation.</li>
                                <li>Multiple annotations may appear as you touch or click on multiple highlighted passages.</li>
                                <li>To hide an annotation, double-click with the mouse, or drag your finger out of the annotation box.</li>
                                
                            </ul>
                        </section>
                        <p class="boilerplate">
                            <span>
                               Maintained by: Elisa E. Beshero-Bondar (eeb4 at
                                psu.edu) <a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by-nc-sa/4.0/80x15.png" /></a>
                            </span>
                            <span>
                               Last modified: 
                                <xsl:value-of select="current-dateTime()"/>
                            </span>  
                        </p> 
                    </div>
                    <div id="floatright">
                        <div id="mainText">
                         <xsl:apply-templates select="//body"/>
                        </div>
                       <hr/>
                    </div>                  
                </div>
            </body>
        </html>
    </xsl:template>
       
    <xsl:template match="titleStmt">
        <h2><xsl:apply-templates select="title"/></h2>
        <h3><xsl:text>Edited by </xsl:text><xsl:apply-templates select="editor"/><xsl:text>. </xsl:text></h3>
        <p><xsl:text>Sponsored by: </xsl:text></p>
       <xsl:choose> 
           <xsl:when test="count(descendant::sponsor) gt 1">
            <ul>
        <xsl:for-each select="sponsor">
            <li><xsl:apply-templates select="current()//text()"/></li>
        </xsl:for-each>
        </ul>
           </xsl:when>
       <xsl:otherwise>
           <xsl:apply-templates select="sponsor//text()"/>
       </xsl:otherwise>
       </xsl:choose>
    </xsl:template>
    
    <xsl:template match="principal"/>
    <xsl:template match="respStmt">
        <xsl:apply-templates/><xsl:text>. </xsl:text>
    </xsl:template>
    
    <xsl:template match="editionStmt">
        <!--2021-08-13 ebb: CHANGE the link constructor below for Digital Mitford site publishing.
        It is currently set for prototype previewing on the DM_Poetry repo GitHub Pages:-->
        <p><a href="../Sonnets/{tokenize(base-uri(.),'/')[last()]}"><xsl:apply-templates select="edition"/></a>
            <!--  <xsl:value-of select="respStmt[1]/resp[1][not(idno)]"/>
            <xsl:text>. </xsl:text>
    
          <xsl:choose>
                <xsl:when test="contains(//msIdentifier/repository, 'Reading Central')"><xsl:for-each select="tokenize(respStmt/resp[idno]/idno, ', ')">       
                <a href="{current()}"><xsl:value-of select="current()"/> </a><xsl:text>, </xsl:text>
            </xsl:for-each>
                </xsl:when>
            <xsl:otherwise>
                <xsl:for-each select="tokenize(respStmt/resp[idno]/idno, ', ')">       
                    <xsl:value-of select="current()"/>
                    <xsl:text>, </xsl:text>
                </xsl:for-each>
            </xsl:otherwise>
            </xsl:choose>
            
            <xsl:text>. </xsl:text>-->
        </p>
    </xsl:template>
    
    <xsl:template match="publicationStmt">
        <p><xsl:text>Published by: </xsl:text>
        <xsl:apply-templates select="authority"/><xsl:text>, </xsl:text>
        <xsl:apply-templates select="pubPlace"/><xsl:text>: </xsl:text>
        <xsl:apply-templates select="date"/><xsl:text>. </xsl:text></p>
        <xsl:apply-templates select="availability/licence"/><xsl:text> </xsl:text> 
    </xsl:template>
    
    <xsl:template match="seriesStmt">
        <p><xsl:apply-templates/></p>
    </xsl:template>
    
    <xsl:template match="sourceDesc">
        <xsl:text>Source: </xsl:text>
        <xsl:apply-templates select="bibl"/>
        
       <!--ebb: Shutting this off b/c we only have one witness, and a bibl for it.
           <xsl:choose>
            <xsl:when test="count(listWit/witness) gt 1">
                <ul>
                    <xsl:apply-templates select="descendant::witness" mode="multipleWit"/>
                </ul>
            </xsl:when>
            <xsl:otherwise>
                <xsl:apply-templates select="descendant::witness"/>
            </xsl:otherwise>
            
        </xsl:choose>        -->
    </xsl:template>
    <!--Processing the source bibliography info in the TEI Header -->
    <xsl:template match="sourceDesc/bibl">
        <span class="sourceBibl">Mitford, Mary Russell. <i><xsl:apply-templates select="title"/></i>. 
        <xsl:apply-templates select="pubPlace/placeName"/>: <xsl:apply-templates select="publisher"/>, 
            <xsl:apply-templates select="date"/>.</span>
    </xsl:template>
    <xsl:template match="witness" mode="multipleWit">
        <li><xsl:apply-templates/></li>
    </xsl:template>
    <xsl:template match="witness">
        <p><xsl:apply-templates/></p>
    </xsl:template>
    
    <!--2021-08-14 ebb: Added to process title levels for source texts in the TEI header -->
    <xsl:template match="teiHeader//title[@level='m']">
        <i><xsl:apply-templates/></i>
    </xsl:template>
    <xsl:template match="teiHeader//title[@level='a']">
        <q><xsl:apply-templates/></q>
    </xsl:template>
    
    
    <xsl:template match="profileDesc">
        <p><xsl:text>Hands other than Mitford's noted on this manuscript: </xsl:text></p>
        <ul>
        <xsl:for-each select=".//handNote">
            <li><xsl:apply-templates select="."/></li>
        </xsl:for-each>
        </ul>
    </xsl:template>
    
    <xsl:template match="encodingDesc">
        <xsl:apply-templates select="editorialDecl"/>
    </xsl:template>
    
    <xsl:template match="revisionDesc"/>
   
  <!-- 2021-08-14 ebb: Uncomment this (and comment out the preceding template) to output a change log on the Mitford edition file, if present
      in a revisionDesc.
      
      <xsl:template match="revisionDesc">
        <h3>Change log</h3>
        <table>
            <tr><th>When</th><th>Who</th><th>What</th></tr>
            <xsl:apply-templates/>
        </table>
        
    </xsl:template>
    <xsl:template match="change">
       <tr>
          <td><xsl:apply-templates select="(@when, @notBefore)[1]"/></td> 
          <td><xsl:sequence select="dm:respHandler(@who)"/>
          </td>
           <td><xsl:apply-templates/></td>
       </tr>
    </xsl:template>-->
    
  
    <xsl:template match="body/div">
        <section class="poem">
            <xsl:apply-templates/>
            <xsl:apply-templates select="descendant::note[@resp='#MRM']" mode="MRMnotes"/>
        </section>
    </xsl:template>
    
  <!--  <xsl:template match="rdg">
        <!-\-ebb: Be careful of this. I'm writing this template match to suppress rdg elements on the understanding that we are using <lem> to indicate a Mitford editor's authoritative reading of the ms, vs. a misreading or alternate reading by L'Estrange or someone else. I'm not indicating the @wit here; it may need to be adjusted depending on the letter.-\->
    </xsl:template>-->

   
    
    <xsl:template match="lb">
        <br/>
    </xsl:template>
    
    <xsl:template match="lg">
        <div class="lg">
            <xsl:apply-templates/>
        </div>
    </xsl:template>

    <xsl:template match="l[not(ancestor::note)]">
       <div class="line"> 
           <xsl:choose>
               <xsl:when test="@rend">
                   <span class="line {@rend ! translate(., '+)', '') ! translate(., '(', '-')}" id="P{ancestor::div[1]/@n}-L{@n}">
                       <xsl:apply-templates/></span>
                   <span class="lineNumber"><xsl:value-of select="@n"/></span>
                   
               </xsl:when>
               <xsl:otherwise>
                   <span class="line" id="P{ancestor::div[1]/@n}-L{@n}">
                       <xsl:apply-templates/></span>
                   <span class="lineNumber"><xsl:value-of select="@n"/></span>
               </xsl:otherwise>
           </xsl:choose>
       </div>
    </xsl:template>
    
    <xsl:template match="l[ancestor::note]">
        <span class="line">
            <xsl:apply-templates/>
            <br/>
        </span>
    </xsl:template>

 

    <xsl:template match="hi[@rend='smallcaps']">
        <span class="smallcaps">
            <xsl:apply-templates/>
        </span>

    </xsl:template>

   
<xsl:template match="pb">
  <!-- <span class="pagebreak"><xsl:text>page&#xa0;</xsl:text><xsl:value-of select="@n"/><br/></span> -->
</xsl:template>


    <xsl:template match="note[not(@resp='#MRM')][ancestor::div[@type='section']]">
        <!-- 2021-08-13 ebb: added the last predicate to stop this from outputting SI note elements. -->
        <span id="Note{count (preceding::note[not(@resp='#MRM')]) + 1}" class="anchor">[<xsl:value-of
                select="count (preceding::note[not(@resp='#MRM')])+ 1"/>] <span class="note"
                    id="n{count (preceding::note[not(@resp='#MRM')]) + 1}"><xsl:sequence select="$clickTop"/>
               <xsl:if test="@resp"> <xsl:apply-templates/><xsl:text>—</xsl:text>
                    <xsl:sequence select="dm:respHandler(@resp)"/></xsl:if>
            </span>
        </span>
    </xsl:template>
    <xsl:template match="note[@resp='#MRM']"/>
    <xsl:template match="note" mode="MRMnotes">
        <div class="MRMfn"><hr class="MRMfn"/>
            <xsl:apply-templates/><xsl:text>—</xsl:text>
        <xsl:value-of select="dm:respHandler(@resp)"/></div>
        
    </xsl:template>
    <!-- 2021-08-14 ebb: For processing SI notes:-->
    <xsl:template match="note[ancestor::*[@sortKey]]">
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="*[@sortKey]//p">
        <!-- 2021-08-15 ebb: For site index <p> in note elements -->
        <xsl:apply-templates/><br/>
    </xsl:template>
    
      <!-- ******************************************* -->
     
  <!-- 2021-08-14 ebb: Updated templates for SI context coding. -->
    
    <!-- ******************************************* -->
    
   <xsl:variable name="clickTop" as="element()"> 
       <span class="topBox">  <span class="clickAway">☐</span></span>
   </xsl:variable>

    <xsl:template match="placeName | name[@type='place']">
        <span class="context" title="place">
            <xsl:apply-templates/>
            
            <xsl:if test="$si//*[@xml:id = substring-after(current()/@ref, '#')] and not(ancestor::note[not(@resp='#MRM')])">
                <span class="si"><xsl:sequence select="$clickTop"/>
                <xsl:variable name="siPlace" select="$si//*[@xml:id = substring-after(current()/@ref, '#')]"/>
                <xsl:value-of select="string-join($siPlace/*[not(self::note)], ' | ')"/>
                <xsl:if test="$siPlace/note"> <xsl:for-each select="$siPlace/note">
                    <xsl:apply-templates select="current()"/>
                    <xsl:if test="@resp"><xsl:text>—</xsl:text>
                    <xsl:sequence select="dm:respHandler(@resp)"/></xsl:if>
                </xsl:for-each>
                </xsl:if>
                
            </span></xsl:if>
        </span>
    </xsl:template>

    <xsl:template match="editor | persName | rs[@type='person'] | sp | author">
        <span class="context" title="person">
            <xsl:apply-templates/>
       
            <xsl:if test="($si//*[@xml:id = substring-after(current()/@ref, '#')] | $si//*[@xml:id = substring-after(current()/@who, '#')] | $si//*[@xml:id = substring-after(current()/@corresp, '#')]) and not(ancestor::note[not(@resp='#MRM')])"> 
                <span class="si"><xsl:sequence select="$clickTop"/>
               <xsl:variable name="siPers" select="$si//*[@xml:id = substring-after(current()/@ref, '#')] | $si//*[@xml:id = substring-after(current()/@who, '#')] | $si//*[@xml:id = substring-after(current()/@corresp, '#')]"/>
            
         <xsl:choose>
             <xsl:when test="$siPers//forename">  <xsl:value-of select="$si//*[@xml:id = substring-after(current()/@ref, '#')]//forename[1]"/>
            <xsl:text> </xsl:text>
            <xsl:if test="$siPers//forename[position() gt 1]"><xsl:value-of select="string-join($siPers//forename[position() gt 1], ' ')"/><xsl:text> </xsl:text></xsl:if>
            <xsl:if test="count($siPers//surname) gt 1"> <xsl:value-of select="string-join($siPers//surname[2] | surname[@type='maiden'], ' ')"/><xsl:text> </xsl:text></xsl:if>
            
            <xsl:value-of select="string-join($siPers//surname[1] | surname[@type='married'], ' ')"/>
                 <xsl:if test="$siPers//roleName">
                     <xsl:text>, </xsl:text>
                     <xsl:value-of select="string-join($siPers//roleName, ', ')"/>
                 </xsl:if>
                 
                 <xsl:if test="$siPers/persName[forename]/following-sibling::persName">
                 <xsl:text>, or: </xsl:text>
                     <xsl:value-of select="string-join($siPers/persName[forename]/following-sibling::persName, ', ')"/>
                 </xsl:if>
             </xsl:when>
             
             <xsl:otherwise>
                 <xsl:value-of select="string-join($siPers/persName, ' ')"/>
                 
             </xsl:otherwise>
           
         </xsl:choose>
            
 <xsl:if test="$siPers/birth"><xsl:text> | Born: </xsl:text>
            <xsl:value-of select="string-join($siPers/birth/@*, '-')"/>
            
            <xsl:if test="$siPers/birth/placeName">
                <xsl:text> in </xsl:text>
          <xsl:value-of select="$siPers/birth/placeName"/>
            </xsl:if>
           
            <xsl:text>. Died: </xsl:text>
            <xsl:value-of select="string-join($siPers/death/@*, '-')"/>
            
            <xsl:if test="$siPers/death/placeName">
                <xsl:text> in </xsl:text>
                <xsl:value-of select="$siPers/death/placeName"/>
            </xsl:if>
     <xsl:text>. </xsl:text>
 </xsl:if>
     <xsl:if test="$siPers/note">
         <xsl:for-each select="$siPers/note">
             <br/><xsl:apply-templates select="current()"/>
        <xsl:if test="@resp"> 
            <xsl:text>—</xsl:text>
         <xsl:sequence select="dm:respHandler(@resp)"/>
        </xsl:if>
         </xsl:for-each>
         
     </xsl:if>     
    
        </span>
       </xsl:if>
        </span>
    </xsl:template>

    <xsl:template match="orgName | rs[@type='org']">
        <span class="context" title="org">
            <xsl:apply-templates/>
       
            <xsl:if test="$si//*[@xml:id = substring-after(current()/@ref, '#')] and not(ancestor::note[not(@resp='#MRM')])"> 
                <span class="si"> <xsl:sequence select="$clickTop"/>
            <xsl:variable name="siOrg" select="$si//*[@xml:id = substring-after(current()/@ref, '#')]"/>
            <xsl:value-of select="string-join($siOrg/orgName, ' | ')"/>
            <xsl:if test="$siOrg/note">
              <xsl:for-each select="$siOrg/note">  
                  <br/>
                  <xsl:apply-templates select="current()"/>
                    <xsl:text>—</xsl:text>
               <xsl:if test="@resp"> <xsl:sequence select="dm:respHandler(@resp)"/>
               </xsl:if>
                </xsl:for-each>
            </xsl:if>
        </span></xsl:if>
        </span>
    </xsl:template>
    
  <!-- 2021-08-13 ebb: This template seems to be generating ambiguous rule matches. I don't think we need it because
      we seem to be covering this condition of rs with @type values in other ways in other rules.
      
      
      <xsl:template match="rs[not(@type='org')] | name">
        <span class="context" title="rs">
            <xsl:apply-templates/>
       
        
        <xsl:if test="$si//*[@xml:id = substring-after(current()/@ref, '#')] and not(ancestor::note[not(@resp='#MRM')])"><span class="si">
            <xsl:variable name="siRs" select="$si//*[@xml:id = substring-after(current()/@ref, '#')]"/>
            <xsl:value-of select="string-join($siRs/label, ' | ')"/>
            <xsl:value-of select="string-join($siRs/@*, ' - ')"/>
            <xsl:if test="$siRs/note">
                <br/><xsl:value-of select="$siRs/note"/>
                    <xsl:text>—</xsl:text>
                    <xsl:value-of select="$siRs/note/@resp"/>
                
            </xsl:if>
        </span></xsl:if>
        </span>
    </xsl:template>-->
    
    <xsl:template match="body//title[not(parent::head)] | body//bibl">
        <span class="context" title="title"><xsl:apply-templates/>
            <xsl:if test="($si//*[@xml:id = substring-after(current()/@ref, '#')] | $si//*[@xml:id = substring-after(current()/@corresp, '#')]) and not(ancestor::note[not(@resp='#MRM')])"> 
                <span class="si"><xsl:sequence select="$clickTop"/>
            <xsl:variable name="siBibl" select="$si//*[@xml:id = substring-after(current()/@ref, '#')] | $si//*[@xml:id = substring-after(current()/@corresp, '#')]"/>
            <xsl:if test="$siBibl/title"><xsl:value-of select="string-join($siBibl/title, ', ')"/>
            <xsl:text>. </xsl:text>
            </xsl:if>
            <xsl:if test="$siBibl/bibl">
                <xsl:value-of select="string-join($siBibl/bibl/title, ', ')"/>
                    <xsl:text>. </xsl:text>
            </xsl:if>
            <xsl:choose>
                <xsl:when test="$siBibl/author/text()">
                    <xsl:value-of select="string-join($siBibl//author, ', ')"/>
                    <xsl:text>. </xsl:text>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:variable name="AuthorLookup" select="$siBibl//author/@ref"/> 
                    
                    <xsl:if test="$si//*[@xml:id= substring-after($AuthorLookup, '#')]/persName[forename]">
                        <xsl:value-of select="$si//*[@xml:id= substring-after($AuthorLookup, '#')]/persName/forename[1]"/>
                    <xsl:text> </xsl:text>
                        <xsl:if test="$si//*[@xml:id= substring-after($AuthorLookup, '#')]/persName/forename[position() gt 1]"><xsl:value-of select="string-join($si//*[@xml:id= substring-after($AuthorLookup, '#')]/persName/forename[position() gt 1], ' ')"/>
                        <xsl:text> </xsl:text>
                        </xsl:if>
                        
                        <xsl:if test="$si//*[@xml:id= substring-after($AuthorLookup, '#')]/persName/surname[position() gt 1]">
                        
                        <xsl:value-of select="string-join($si//*[@xml:id= substring-after($AuthorLookup, '#')]/persName/surname[position() gt 1], ' ')"/>
                            <xsl:text> </xsl:text>
                        </xsl:if>
                        <xsl:value-of select="$si//*[@xml:id= substring-after($AuthorLookup, '#')]/persName/surname[1]"/>
                        <xsl:text>. </xsl:text>
                    
                    </xsl:if>               
                    <xsl:if test="$si//*[@xml:id= substring-after($AuthorLookup, '#')]/persName[not(forename)]">
                        <xsl:value-of select="$si//*[@xml:id= substring-after($AuthorLookup, '#')]/persName"/><xsl:text>. </xsl:text>
                        
                    </xsl:if>
                    
                </xsl:otherwise> 
            
            </xsl:choose>
            
            <xsl:if test="$siBibl/pubPlace">
                <xsl:value-of select="$siBibl/pubPlace"/>
                    <xsl:text>: </xsl:text>
            </xsl:if>
            <xsl:if test="$siBibl/publisher">
                <xsl:value-of select="$siBibl/publisher"/>
                <xsl:text>. </xsl:text>
            </xsl:if>
            <xsl:if test="$siBibl/date">
                
                <xsl:choose><xsl:when test="$siBibl/date/@*">
                    <xsl:value-of select="string-join($siBibl/date/@*, '-')"/><xsl:text>. </xsl:text>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="$siBibl/date"/>
                    <xsl:text>. </xsl:text>
                </xsl:otherwise>
                </xsl:choose>
                
            </xsl:if>
            
            <xsl:if test="$siBibl/note">
               <xsl:for-each select="$siBibl/note"> <br/><xsl:value-of select="current()"/>
                <xsl:if test="@resp">
                    <xsl:text>—</xsl:text>
                    <xsl:sequence select="dm:respHandler(@resp)"/>
                </xsl:if>
               </xsl:for-each>
            </xsl:if>
        </span></xsl:if>
        </span>
    </xsl:template>
    
<!--2021-08-13 The next template processes markup of plants and animals from the SI -->
<xsl:template match="name | rs[@type='animal'] | rs[@type='plant']">
    <span class="context" title="nature">
        <xsl:apply-templates/>
        <xsl:if test="$si//item[@xml:id=substring-after(current()/@ref, '#')] and not(ancestor::note[not(@resp='#MRM')])">
            <span class="si"><xsl:sequence select="$clickTop"/>
             <xsl:variable name="siNature" as="element()" select="$si//item[@xml:id=substring-after(current()/@ref, '#')]"/>
             <xsl:text>Name: </xsl:text>
             <xsl:value-of select="$siNature/name[not(@type)] => string-join(' or ')"/>
             <xsl:if test="$siNature/name[@type='genus']">
                 <xsl:text> | Genus: </xsl:text>
                 <xsl:value-of select="$siNature/name[@type='genus']"/>
             </xsl:if>
             <xsl:if test="$siNature/name[@type='family']">
                 <xsl:text> | Family: </xsl:text>
                 <xsl:value-of select="$siNature/name[@type='family']"/>
             </xsl:if>
             <xsl:if test="$siNature/name[@type='species']">
                 <xsl:text> | Species: </xsl:text>
                 <xsl:value-of select="$siNature/name[@type='species']"/>
             </xsl:if>
             <xsl:text>. </xsl:text>
                 <xsl:for-each select="$siNature/note">
                     <br/>
                     <xsl:apply-templates select="."/>
                       <xsl:if test="@resp">  
                           <xsl:text>—</xsl:text>
                     <xsl:sequence select="dm:respHandler(@resp)"/>
                       </xsl:if>

                 </xsl:for-each> 
         </span>  
        </xsl:if>
    </span>
</xsl:template>

<xsl:template match="date">
        <span class="date" title="{string-join(@*, '-')}">
            <xsl:apply-templates/>
        </span>
    </xsl:template>

  <xsl:template match="emph">
      <em><xsl:apply-templates/></em> 
  </xsl:template>
    
    <xsl:template match="gap | del[not(matches(., '\S'))]">
        <!--ebb: 2021-08-14: This template should match an empty del element as well as a gap element. -->
        <span class="damage"><xsl:text>[</xsl:text><xsl:value-of select="name()"/><xsl:text>: </xsl:text>
            <xsl:if test="@quantity">
                <xsl:value-of select="@quantity"/><xsl:text> </xsl:text><xsl:value-of select="@unit"/>
                <xsl:if test="number(@quantity) gt 1 and not(matches(@unit, 's$'))"><xsl:text>s</xsl:text></xsl:if>
            </xsl:if>
            <xsl:if test="@quantity and @reason"><xsl:text>, </xsl:text></xsl:if>
            <xsl:if test="@reason"><xsl:text>reason: </xsl:text><xsl:value-of select="@reason"/></xsl:if>
            <xsl:text>.]</xsl:text>
        </span>
    </xsl:template>
    
    <xsl:template match="damage">
        <span class="damage"><xsl:text>[Damage: </xsl:text>
            <xsl:if test="@quantity">
                <xsl:value-of select="@quantity"/><xsl:text> </xsl:text><xsl:value-of select="@unit"/><xsl:text>, </xsl:text></xsl:if>
            <xsl:text>agent: </xsl:text><xsl:value-of select="@reason | @agent"/><xsl:text>.]</xsl:text>
        </span>
    </xsl:template>
    
    <xsl:template match="supplied">
        <span class="supplied"><xsl:text>[</xsl:text><xsl:apply-templates/><xsl:text>]</xsl:text></span>
    </xsl:template>
    
    <xsl:template match="del[matches(., '\S')]">
      <span class="del"><xsl:text>&#xa0;</xsl:text><xsl:value-of select="."/></span>
         
        <!--OLD? ebb: Note problem here: If the del span self-closes because of a gap and we could not read the deleted words for whatever reason, the span self closes in the html, BUT the browser (Chrome at least) interprets this as crossing out to the end of the document! 
        Brittle solution is, this time, that I removed the self-closed span elements from the html output. 
        I need to say something, if the span is empty because of a gap, to signal that there *is* a deletion here that we could not read.
        -->
        <!--2021-08-14 ebb: Answering this by adding preducate to test for non-space characters in the text node of the del element. And revising the predicate on del in the gap + "empty del" template before this. -->
    </xsl:template>
    
    <xsl:template match="add">
       <xsl:choose> <xsl:when test="metamark"><xsl:apply-templates select="metamark"/><span class="add"><xsl:apply-templates select="metamark/following-sibling::*|text()"/></span></xsl:when>
       <xsl:otherwise>
           <xsl:apply-templates/>
       </xsl:otherwise>
       
       </xsl:choose>
        
    </xsl:template>
    
    <xsl:template match="hi[@rend='superscript']">
        <span class="above-line"><xsl:apply-templates/></span>
    </xsl:template>
    
    <xsl:template match="metamark[@rend='caret']">
        <span class="caret"><xsl:text>&#94;</xsl:text></span>
    </xsl:template>
    
    <xsl:template match="metamark[@rend='waves'] | metamark[@rend='jerk'] | metamark[@rend='wave']">
        <span class="jerk"><xsl:text>&#x3030;</xsl:text></span>
    </xsl:template>
    
    <xsl:template match="choice">
        <span class="sic"><xsl:apply-templates select="sic"/></span>
        <span class="reg"><xsl:apply-templates select="reg"/></span>
       
    </xsl:template>
    
    <xsl:template match="q | quote">
        <xsl:variable name="quote" select="'&quot;'"/>
        <xsl:choose>
            <xsl:when test="matches(., $quote)">
                <xsl:apply-templates/>
            </xsl:when>
            <xsl:otherwise> <q><xsl:apply-templates/></q>
            </xsl:otherwise>
            
        </xsl:choose>
    </xsl:template>
    <xsl:template match="text()[contains(., '--')]">
        <xsl:analyze-string select="." regex="--">
            <xsl:matching-substring>—</xsl:matching-substring>
            <xsl:non-matching-substring><xsl:value-of select="."/></xsl:non-matching-substring>
        </xsl:analyze-string>
    </xsl:template>
    <xsl:template match="div[@type='section']/head">
        <h3 class="poemHeading"><xsl:apply-templates/></h3>
    </xsl:template>
    
    <xsl:template match="head/title">
        <span class="title"><xsl:apply-templates/></span>
    </xsl:template>
   <!-- 2021-08-13 ebb: These templates should match ref and ptr elements in the site index and render them as hyperlinks in the output HTML. -->
   <xsl:template match="ref">
       <a href="{@target}"><xsl:apply-templates/></a>
   </xsl:template>
   <xsl:template match="ptr">
       <a href="{@target}"><xsl:value-of select="@target"/></a>
   </xsl:template>
   
</xsl:stylesheet>

