<?xml version="1.0"?><!DOCTYPE pdf PUBLIC "-//big.faceless.org//report" "report-1.1.dtd">
<pdf>
<head>
    <link name="NotoSans" type="font" subtype="truetype" src="${nsfont.NotoSans_Regular}" src-bold="${nsfont.NotoSans_Bold}" src-italic="${nsfont.NotoSans_Italic}" src-bolditalic="${nsfont.NotoSans_BoldItalic}" bytes="2" />
	<#if .locale == "zh_CN">
		<link name="NotoSansCJKsc" type="font" subtype="opentype" src="${nsfont.NotoSansCJKsc_Regular}" src-bold="${nsfont.NotoSansCJKsc_Bold}" bytes="2" />
	<#elseif .locale == "zh_TW">
		<link name="NotoSansCJKtc" type="font" subtype="opentype" src="${nsfont.NotoSansCJKtc_Regular}" src-bold="${nsfont.NotoSansCJKtc_Bold}" bytes="2" />
	<#elseif .locale == "ja_JP">
		<link name="NotoSansCJKjp" type="font" subtype="opentype" src="${nsfont.NotoSansCJKjp_Regular}" src-bold="${nsfont.NotoSansCJKjp_Bold}" bytes="2" />
	<#elseif .locale == "ko_KR">
		<link name="NotoSansCJKkr" type="font" subtype="opentype" src="${nsfont.NotoSansCJKkr_Regular}" src-bold="${nsfont.NotoSansCJKkr_Bold}" bytes="2" />
	<#elseif .locale == "th_TH">
		<link name="NotoSansThai" type="font" subtype="opentype" src="${nsfont.NotoSansThai_Regular}" src-bold="${nsfont.NotoSansThai_Bold}" bytes="2" />
	</#if>
    <macrolist>
        <macro id="nlheader">
            <p style="align: right;">
                <#if companyInformation.logoUrl?length != 0>
               <@filecabinet nstype="image" style="float: right;Padding-left:10px;" src="${companyInformation.logoUrl}" />
            </#if>
            </p>
        </macro>
    </macrolist>
    <style>
        body {
            font-family: Arial, sans-serif;
            font-size: 12px;
        }
        .invoice-container {
            width: 100%;
            padding: 20px;
        }
        .header-table, .info-table, .footer-table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        .header-table td, .info-table td, .footer-table td {
            padding: 8px;
            text-align: left;
        }
        .items-table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        .items-table th, .items-table td {
            padding: 8px;
            text-align: left;
        }
        .items-table th {
           
        }
        .template-header {
            font-size: 16px;
            font-weight: bold;
            text-align: center;
            margin-bottom: 20px;
        }
    </style>

    


</head>
<body header="nlheader" header-height="8%" footer="nlfooter" footer-height="5%" padding="0.5in 0.5in 0.5in 0.5in" size="Letter">
   <!-- <div class="invoice-container"> -->


        <!-- Header -->
       

        <!-- Address Section -->
        <table class="info-table" style="margin-top: 5px;">
            <tr>
                
                <td  align="left" style="text-align: left;  font-size: 9px;">
                  <#if !record.billaddress?has_content>
                    Rayner Surgical GmbH - Rudower Chaussee 9 - D-12489 Berlin
                  </#if>    
                    <br/> <br/> <#if record.billaddress?contains(record.billcity + "  " + record.billzip)>
                    ${record.billaddress?replace(record.billcity + "  " + record.billzip, record.billzip + "  " + record.billcity)}
                  <#else>
                    ${record.billaddress}  
                  </#if>
                </td>

              <td> </td>
              <td></td>
              <td></td>
              
              <td align="right" style="text-align: right; font-size: 10px;padding-left: 60px">
                <strong>Rayner Surgical GmbH</strong><br/><br/>
                &nbsp;&nbsp; &nbsp;  Rudower Chaussee 9<br/>
                &nbsp;&nbsp; &nbsp;  D-12489 Berlin<br/>
                &nbsp;&nbsp; &nbsp;  <br/>
                &nbsp;&nbsp;Tel.+49 30 629 07 83-0<br/>
                Fax.+49 30 629 07 83-29<br/>
                <br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;www.rayner.com
                <br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;info.de@rayner.com
            </td>

                
            </tr>
          <tr>


            <td align="left" >              
            </td>

            <td> </td>
            <td></td>
            <td></td>
            <td align="right" style="text-align: right; font-size: 10px;">  
               
            </td>
           
            
          </tr>


        </table>    



        <table style="width: 40%;margin-top: 5px;">
            <tr>
                <td><strong >Lieferadresse:</strong></td>
                <td style="Padding-left:10px;">
                <#if record.shipaddress?contains(record.shipcity + "  " + record.shipzip)>
                 ${record.shipaddress?replace(record.shipcity + "  " + record.shipzip, record.shipzip + "  " + record.shipcity)}
                <#else>
                 ${record.shipaddress}  
                </#if>
                </td>

            </tr>
        </table>

        <table style="width: 100%;">

            
     <tr>
        <td> <strong>  <h1> Rechnung  </h1></strong></td>
     </tr>



     <tr>
        <td>Belegdatum</td>
        <td>: ${record.trandate?replace('/', '.')}</td>
        <td >Kunden-Nr </td>
        <td >:&nbsp;${record.entity?split(" ")[0]}</td>

     </tr>
     

     <tr>
        <td>Belegnummer</td>
        <td>: ${record.tranid}</td>
        <td >Sachbearbeiter </td>
        <td>:&nbsp;<#if record.custbodycreated_by_pwc?has_content>
                        <#if record.custbodycreated_by_pwc == "-System-">
                            Created from Portal
                        <#else>
                            ${record.custbodycreated_by_pwc?split(" ")[1]}${record.custbodycreated_by_pwc?split(" ")[2]}
                        </#if>
                </#if></td>

     </tr>
     <tr>
        <td>Bestellnummer</td>
        <#if record.otherrefnum?has_content>
        <td>: ${record.otherrefnum}</td>
        <#else>
        <td>: PO Fax</td>
        </#if>



        <td>Vertreter </td>

        <td>: <#if record.salesrep?has_content>${record.salesrep?split(" ")[1]}${record.salesrep?split(" ")[2]} 
            </#if>

        </td>
     </tr>
     <tr>
        <td>Bestelldatum</td>
        <td>: <#if record.createdfrom.trandate?has_content>${record.createdfrom.trandate?replace('/', '.')} <#else>${record.custbodypo_date_dach_pwc?replace('/', '.')}</#if></td>
        <td >VAT </td>
        <td >: ${record.entity.vatregnumber}</td>

     </tr>

     <tr>
        <td>Lieferdatum</td>
        <td>: ${record.trandate?replace('/', '.')}</td>
        <td style="margin-left: 5px;"> </td>
        <td style="margin-left: 5px;"></td>

     </tr>
     <tr>
        <td colspan="3">${record.custbody24}</td>
     </tr>
     

     <tr>
        <td> </td>
     </tr>
     
     <!--<tr><td>Belegdatum&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  :${record.trandate}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Kunden-Nr.:${record.trandate}<br/>Belegnummer&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:${record.entity}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Lieferung:${record.shipmethod}<br/>Bestellnummer:FAX&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;bearbeiter:${record.salesrep}</td></tr>
    -->
        </table>
    
        <#assign itemCount = 0>
        <#list record.item as item>
          <#assign itemCount = itemCount + 1>
        </#list>
        
        <#if record.item?has_content>
        <#if itemCount < 2>

        <table style="width: 100%; border-top: 1px solid #000;" class="items-table">
                   <#else>
            <table style="width: 100%; border-top: 1px solid #000;border-bottom: 1px solid #000;" class="items-table">
                </#if>

            <#assign totalAmount = 0>  <!-- Initialize the total amount variable -->
    
            <#list record.item as item>
                <#if item_index==0>
                <tr style="border-bottom: 1px solid #000;">
                    <th><strong>Anz.</strong></th>
                    <th><strong>ME</strong></th>
                    <th><strong>Artikelnr.</strong></th>
                    <th><strong>Bezeichnung</strong></th>
                    <th><strong>Mwst.</strong></th>
                    <th><strong>EP</strong></th>
                    <th align="right"><strong>GP</strong></th>
                </tr>
                </#if>
                <#if item_index lt 6>
    
                <tr>
                    <td>${item.quantity}</td>
                    <td>${item.units?replace('Ea', 'Stk')}</td>
                    <td>${item.item}</td>
                    <td>${item.description}<br/>${item.custcol_invdetail} </td>
                    <td>${item.taxrate1}</td>
                    <td>${item.rate?string["#,##0.00"]?replace(",", "_")?replace(".", ",")?replace("_", ".")}</td>
                    <td align="right">${item.amount?string["#,##0.00"]?replace(",", "_")?replace(".", ",")?replace("_", ".")}</td>
    
                </tr>
    
                <#assign totalAmount = totalAmount + item.amount>  <!-- Add the item.amount to the totalAmount -->
                </#if>
            </#list>

            <#if itemCount gte 2>

            <tr style="border-bottom: 1px solid black;border-top: 1px solid black;">
                <td></td>
                <td></td>
                <td></td>
                <td><strong>Zwischensumme</strong></td>
                <td></td>
                <td></td>
                <td align="right">${totalAmount?string["#,##0.00"]?replace(",", "_")?replace(".", ",")?replace("_", ".")}</td>  <!-- Use the accumulated totalAmount -->
            </tr>
            </#if>
        </table>
    </#if>


    <#assign itemCount = 0>
    <#list record.item as item>
      <#assign itemCount = itemCount + 1>
    </#list>
    <#if itemCount < 2>
<!--
    <table style="width: 100%; font-family: Arial, sans-serif; font-size: 10pt; border-collapse: collapse; margin-top: 0px;">
        <tr>
            <td style="font-weight: bold;">Rechnung</td>
            <td style="text-align: right;">Nr. ${record.tranid} / ${record.createdfrom.trandate?replace('/', '.')} / ${record.entity?split(" ")[1]}</td>
            <td align="right" style="text-align: right;">Seite 2</td>
        </tr>
    </table>
-->

    <!-- Items Table -->
   
      
    <#assign lineValues = {}>

    <#list record.item as item>
      <#assign rate = item.taxrate1?string>
      <#assign taxAmt = item.tax1amt>
      <#assign amt = item.amount>
    
      <#if lineValues[rate]??>
        <#assign prev = lineValues[rate]>
        <#assign lineValues = lineValues + {
          rate : {
            "taxamount": prev.taxamount + taxAmt,
            "amount": prev.amount + amt
          }
        }>
      <#else>
        <#assign lineValues = lineValues + {
          rate : {
            "taxamount": taxAmt,
            "amount": amt
          }
        }>
      </#if>
    </#list>
    

    <!-- Summary Section -->
    <table style="width: 100%; font-family: Arial, sans-serif; font-size: 10pt; border-collapse: collapse; margin-top: 0px; break-before: always;margin-top:5px;border-top: 1px solid black">
        <tr > 
            <td style="text-align: right;">Netto-Betrag</td>

            <td align="right">${record.subtotal?string["#,##0.00"]?replace(",", "@")?replace(".", ",")?replace("@", ".")}</td>
        </tr>
        <#list lineValues?keys as taxRate>
        <#assign entry = lineValues[taxRate]>
        <tr>
            <td> 
                
               +${taxRate} Mwst. von ${entry.amount?string["#,##0.00"]?replace(",", "_")?replace(".", ",")?replace("_", ".")}
                
              </td>

            <td align="right">
                    ${record.currency.symbol} &nbsp;${entry.taxamount?string["#,##0.00"]?replace(",", "_")?replace(".", ",")?replace("_", ".")}                    
            </td>
        </tr>
        </#list>
        <tr style="border-top: 2px solid black; border-bottom: 2px solid black;">
            <td style="font-weight: bold;">Gesamtbetrag</td>
            <td align="right" style="font-weight: bold;">${record.currency.symbol}&nbsp;${record.total?string["#,##0.00"]?replace(",", "@")?replace(".", ",")?replace("@", ".")}</td>
        </tr>
    </table>
    <#assign trandate = record.trandate?date>
    <#assign terms = record.terms>
    
    <#-- Initialize variables -->
    <#assign additionalDays = 0>
    <#assign discountPercentage = "">
    <#assign newDate = trandate>
    
    <#-- Proceed only if terms contain "Skont" -->
    <#if terms?contains("Skont")>
        <#assign termsParts = terms?split(",")>  
        <#if termsParts?size gt 1>  
            <#list termsParts[1]?split(" ") as word>  
                <#-- Extract days -->
                <#if word?matches("^[0-9]+$")>  
                    <#assign additionalDays = word?number>  
                </#if>  
    
                <#-- Extract percentage -->
                <#if word?matches("^[0-9]{1,2}%$")>  
                    <#assign discountPercentage = word>  
                </#if>  
            </#list>  
        </#if>
    
        <#-- Add days only if Skont was found -->
        <#assign epochTime = trandate?long + (additionalDays * 24 * 60 * 60 * 1000)>
        <#assign newDate = epochTime?number_to_date>
        
    </#if>
    
    <!-- Payment Terms -->
    <table style="width: 100%; font-family: Arial, sans-serif; font-size: 10pt; margin-top: 5px;">
        <tr style="line-height:70%;">
            <td rowspan="3">Zahlungsbedingung:</td>
            <td>${record.terms}</td>
        </tr>

        <#if record.terms?contains("Skont")>
        <tr style="line-height:70%">
            <td>Gesamtbetrag ohne Abzug fällig zum ${record.duedate?replace('/', '.')} bis zum ${newDate?string("dd.MM.yyyy")} ${discountPercentage} Skont</td>
        </tr>
        <#else>
        <tr style="line-height:70%">
            <td>Gesamtbetrag ohne Abzug fällig zum ${record.duedate?replace('/', '.')} </td>
        </tr>
        </#if>
          
        <tr style="line-height:100%;border-bottom: 1px;">
            <td>Die Ware bleibt bis zur vollständigen Bezahlung unser Eigentum!<#if record.billingaddress.country != "Switzerland" && record.billingaddress.country != "United Kingdom"&& record.billingaddress.country != "Germany" && record.billingaddress.country != "Schweiz" && record.billingaddress.country != "Vereinigtes Königreich" && record.billingaddress.country != "Deutschland"><br/>
                Es handelt sich hierbei um eine steuerfreie innergemeinschaftliche Lieferung gemäß § 4 Nr. 1b UStG</#if></td>
        </tr>
       
    </table>


    <table>
<tr></tr>

    </table>
   
    <!-- Legal Notice -->
    <table style="width: 100%; font-family: Arial, sans-serif; font-size: 9pt; margin-top: 0px;">
        <tr >
            <td>Es gelten die umseitigen allgemeinen Verkaufsbedingungen der Firma Rayner Surgical GmbH, die hiermit verbindlich anerkannt werden!<br/>
                Der Europäische Importeur und Bevollmächtigte von Rayner ist die Rayner Surgical GmbH, Rudower Chaussee 9, D-12489 Berlin<br/>
                (Importeur SRN: DE-IM-000005063; Bevollmächtigter SRN: DE-AR-000015767)

            </td>
        </tr>
    </table>
    


        <!-- Footer -->
        <table style="font-size: 10px;width: 100%; margin-top: 10px;" >
            <tr>
                <#if record.billingaddress.country == "Germany" || record.billingaddress.country == "Austria" || record.billingaddress.country == "Deutschland" || record.billingaddress.country == "Österreich">

                <td style="word-wrap: break-word;"> Unsere Bankverbindung:<br/>Berliner Sparkasse<br/>IBAN: DE40 1005 0000 0399 2201 00<br/>SWIFT-BIC: BELADEBEXXX
                </td>
                </#if>
                <#if record.billingaddress.country == "Switzerland" || record.billingaddress.country == "Schweiz">


                <td style="word-wrap: break-word;">
                    Unsere Bankverbindung:<br/>
                    Raiffeisen Moléson<br/>
                    IBAN: CH50 8080 8002 8419 0792 0<br/>
                    SWIFT-BIC: RAIFCH22<br/>
                </td>
                </#if>


                <td style="word-wrap: break-word;">
                    Geschäftsführer: David Geoffrey Allan,<br/>
                    Alan John Hemmant, Hendrik Rönsch<br/>
                    Prokuristin: Manuela Meth<br/>
                </td>
                <td style="word-wrap: break-word;">
                    Handelsregister HRB 175825 <br/>
                    VAT No.: DE 813 747 383<br/>
                    Steuernummer: 37/486/50126<br/>
                    CHE 319.061.399<br/>
                </td>
            </tr>
            <tr ><td align="middle" style="text-align: middle;  font-size: 7px;" colspan="4">Rayner Surgical GmbH, Berlin, succursale de Genève Registered office: GENINT SA, rue Jean-Calvin 12, 1204 Geneva, Switzerland, UID: CHE-314.347.500</td></tr>
        </table>
        <#else>

        <p  align="middle" style="text-align: middle;  font-size: 7px;margin-top: 40px;">Rayner Surgical GmbH, Berlin, succursale de Genève Registered office: GENINT SA, rue Jean-Calvin 12, 1204 Geneva, Switzerland, UID: CHE-314.347.500</p>
      <!-- <table style="font-size: 10px;width: 100%; margin-top: 10px;" >
            <tr>

                <td style="word-wrap: break-word;"> Unsere Bankverbindung:<br/>Berliner Sparkasse<br/>IBAN: DE40 1005 0000 0399 2201 00<br/>SWIFT-BIC: BELADEBEXXX
                </td>
                <#if record.billingaddress.country == "Switzerland">


                <td style="word-wrap: break-word;">
                    Unsere Bankverbindung:<br/>
                    Raiffeisen Moléson<br/>
                    IBAN: CH50 8080 8002 8419 0792 0<br/>
                    SWIFT-BIC: RAIFCH22<br/>
                </td>
                </#if>


                <td style="word-wrap: break-word;">
                    Geschäftsführer: David Geoffrey Allan,<br/>
                    Alan John Hemmant, Hendrik Rönsch<br/>
                    Prokuristin: Manuela Meth<br/>
                </td>
                <td style="word-wrap: break-word;">
                    Handelsregister HRB 175825 <br/>
                    VAT No.: DE 813 747 383<br/>
                    Steuernummer: 37/486/50126<br/>
                    CHE 319.061.399<br/>
                </td>
            </tr>
            <tr ><td align="middle" style="text-align: middle;  font-size: 7px;" colspan="4">Rayner Surgical GmbH, Berlin, succursale de Genève Registered office: GENINT SA, rue Jean-Calvin 12, 1204 Geneva, Switzerland, UID: CHE-314.347.500</td></tr>
        </table>

    -->
        <pbr />


        
        <!--page 2-->
        <table style="width: 100%; font-family: Arial, sans-serif; font-size: 10pt; border-collapse: collapse; margin-top: 30px;">
            <tr style="border-bottom: 1px solid black;">
                <td style="font-weight: bold;">Rechnung</td>
                <td style="text-align: right;">Nr. ${record.tranid} / ${record.trandate?replace('/', '.')} / ${record.entity?split(" ")[1]}</td>
                <td align="right" style="text-align: right;">Seite 2</td>
            </tr>
        </table>


        <!-- Items Table -->
        <table style="width: 100%;" class="items-table">
            <tr style="border-bottom: 1px solid #000;">
                <th><strong>Anz.</strong></th>
                <th><strong>ME</strong></th>
                <th><strong>ArtikelNr.</strong></th>
                <th><strong>Bezeichnung</strong></th>
                <th><strong>Mwst.</strong></th>
                <th><strong>EP</strong></th>
                <th align="right" ><strong>GP</strong></th>
            </tr>
            <#list record.item as item>
            <#if item_index gte 6>
            <tr>
                <td>${item.quantity}</td>
                <td>${item.units}</td>
                <td>${item.item}</td>
                <td>${item.description}<br/>${item.custcol_invdetail} </td>
                <td>${item.taxrate1}</td>
                <td>${item.rate?string["#,##0.00"]?replace(",", "_")?replace(".", ",")?replace("_", ".")}</td>
                <td align="right" >${item.amount?string["#,##0.00"]?replace(",", "_")?replace(".", ",")?replace("_", ".")}</td>

            </tr>
            </#if>
            </#list>
        </table>
       
        <#assign lineValues = {}>

        <#list record.item as item>
          <#assign rate = item.taxrate1?string>
          <#assign taxAmt = item.tax1amt>
          <#assign amt = item.amount>
        
          <#if lineValues[rate]??>
            <#assign prev = lineValues[rate]>
            <#assign lineValues = lineValues + {
              rate : {
                "taxamount": prev.taxamount + taxAmt,
                "amount": prev.amount + amt
              }
            }>
          <#else>
            <#assign lineValues = lineValues + {
              rate : {
                "taxamount": taxAmt,
                "amount": amt
              }
            }>
          </#if>
        </#list>
      
        <!-- Summary Section -->
        <table style="width: 100%; font-family: Arial, sans-serif; font-size: 10pt; border-collapse: collapse; margin-top: 0px; break-before: always;margin-top:5px;border-top: 1px solid black">
            <tr > 
                <td style="text-align: right;">Netto-Betrag</td>
    
                <td align="right">${record.subtotal?string["#,##0.00"]?replace(",", "@")?replace(".", ",")?replace("@", ".")}</td>
            </tr>
            <#list lineValues?keys as taxRate>
            <#assign entry = lineValues[taxRate]>
            <tr>
                <td> 
                    
                   +${taxRate} Mwst. von ${entry.amount?string["#,##0.00"]?replace(",", "@")?replace(".", ",")?replace("@", ".")}
                    
                  </td>
    
                <td align="right">
                        ${record.currency.symbol} &nbsp;${entry.taxamount?string["#,##0.00"]?replace(",", "@")?replace(".", ",")?replace("@", ".")}              
                </td>
            </tr>
            </#list>
            <tr style="border-top: 2px solid black; border-bottom: 2px solid black;">
                <td style="font-weight: bold;">Gesamtbetrag</td>
                <td align="right" style="font-weight: bold;">${record.currency.symbol}&nbsp;${record.total?string["#,##0.00"]?replace(",", "@")?replace(".", ",")?replace("@", ".")}</td>
            </tr>
        </table>
        <#assign terms = record.terms>

        <#-- Initialize variables outside -->
        <#assign additionalDays = 0>
        <#assign discountPercentage = "">
        <#assign newDate = "">
        
        <#-- Only process if 'Skont' is in the terms -->
        <#if terms?contains("Skont")>
            <#assign trandate = record.trandate?date>
        
            <#assign termsParts = terms?split(",")>  
            <#if termsParts?size gt 1>  
                <#list termsParts[1]?split(" ") as word>  
                    <#if word?matches("^[0-9]+$")>  
                        <#assign additionalDays = word?number>  
                    </#if>  
                    <#if word?matches("^[0-9]{1,2}%$")>  
                        <#assign discountPercentage = word>  
                    </#if>  
                </#list>  
            </#if>
        
            <#-- If we have days to add, calculate newDate -->
            <#if additionalDays != 0>
                <#assign epochTime = trandate?long + (additionalDays * 24 * 60 * 60 * 1000)>  
                <#assign newDate = epochTime?number_to_date>
            </#if>
        </#if>
        
        
        
        <!-- Payment Terms -->
        <table style="width: 100%; font-family: Arial, sans-serif; font-size: 10pt; margin-top: 10px;">
            <tr style="line-height:70%;">
                <td rowspan="3">Zahlungsbedingung:</td>
                <td>${record.terms}</td>
            </tr>
            <#if record.terms?contains("Skont")>
            <tr style="line-height:70%;">
                <td>Gesamtbetrag ohne Abzug fällig zum ${record.duedate?replace('/', '.')} bis zum  ${newDate?string("dd.MM.yyyy")} ${discountPercentage} Skont</td>
            </tr>
            <#else>
            <tr style="line-height:70%;">
                <td>Gesamtbetrag ohne Abzug fällig zum ${record.duedate?replace('/', '.')} </td>
            </tr>
            </#if>
            <tr style="line-height:100%;border-bottom: 1px;">
<td>Die Ware bleibt bis zur vollständigen Bezahlung unser Eigentum!<#if record.billingaddress.country != "Switzerland" && record.billingaddress.country != "United Kingdom"&& record.billingaddress.country != "Germany" && record.billingaddress.country != "Schweiz" && record.billingaddress.country != "Vereinigtes Königreich" && record.billingaddress.country != "Deutschland"><br/>
                Es handelt sich hierbei um eine steuerfreie innergemeinschaftliche Lieferung gemäß § 4 Nr. 1b UStG</#if></td>            </tr>
        </table>


        <table>
<tr></tr>

        </table>
       
        <!-- Legal Notice -->
        <table style="width: 100%; font-family: Arial, sans-serif; font-size: 9pt; margin-top: 0px;">
            <tr >
                <td>Es gelten die umseitigen allgemeinen Verkaufsbedingungen der Firma Rayner Surgical GmbH, die hiermit verbindlich anerkannt werden!<br/>
                    Der Europäische Importeur und Bevollmächtigte von Rayner ist die Rayner Surgical GmbH, Rudower Chaussee 9, D-12489 Berlin<br/>
                    (Importeur SRN: DE-IM-000005063; Bevollmächtigter SRN: DE-AR-000015767)

                </td>
            </tr>

            <tr>
                
            </tr>
        </table>
          <table style="font-size: 10px;width: 100%; margin-top: 10px;" >
            <tr>
                <#if record.billingaddress.country == "Germany" || record.billingaddress.country == "Austria" || record.billingaddress.country == "Deutschland" || record.billingaddress.country == "Österreich">

                <td style="word-wrap: break-word;"> Unsere Bankverbindung:<br/>Berliner Sparkasse<br/>IBAN: DE40 1005 0000 0399 2201 00<br/>SWIFT-BIC: BELADEBEXXX
                </td>
                </#if>
                <#if record.billingaddress.country == "Switzerland" || record.billingaddress.country == "Schweiz">


                <td style="word-wrap: break-word;">
                    Unsere Bankverbindung:<br/>
                    Raiffeisen Moléson<br/>
                    IBAN: CH50 8080 8002 8419 0792 0<br/>
                    SWIFT-BIC: RAIFCH22<br/>
                </td>
                </#if>


                <td style="word-wrap: break-word;">
                    Geschäftsführer: David Geoffrey Allan,<br/>
                    Alan John Hemmant, Hendrik Rönsch<br/>
                    Prokuristin: Manuela Meth<br/>
                </td>
                <td style="word-wrap: break-word;">
                    Handelsregister HRB 175825 <br/>
                    VAT No.: DE 813 747 383<br/>
                    Steuernummer: 37/486/50126<br/>
                    CHE 319.061.399<br/>
                </td>
            </tr>
        </table>
        
        </#if>

        <#assign showTaxNote = false>

        <#list record.item as item>
          <#if item.taxcode == "VAT:ER-DE" || item.taxcode == "VAT:ES-DE">
            <#assign showTaxNote = true>
          </#if>
        </#list>
        
        <#if showTaxNote>
        </#if>

   <!-- </div>-->
</body>
</pdf>