<?xml version="1.0"?><!DOCTYPE pdf PUBLIC "-//big.faceless.org//report" "report-1.1.dtd">
<pdf>
  <#function isTrue x><#return (x?is_boolean && x) || (x?is_string && x == "T")></#function><#function notZero x><#return x?has_content && x != 0></#function><#function min coll><#local minimum = coll[0]><#list coll as c><#if c < minimum><#local minimum = c></#if></#list><#return minimum></#function><#function roundNum num decimalPlaces><#if num?is_number><#if (decimalPlaces > 0 )><#assign num2 = num /><#assign decPlaces = 1 /><#assign decPlacesDivide = 1 /><#list 1..decimalPlaces as count><#assign decPlaces = decPlaces * 10/><#assign decPlacesDivide = decPlacesDivide * 0.1/></#list></#if><#assign roundedNum = (((num2*decPlaces)?round) * decPlacesDivide ) /><#return roundedNum><#else><#return num ></#if></#function><#function num x><#if x == 0><#return ''></#if><#local result = nsformat_rate(x)?replace("^.*?((\\d.*\\d)|(\\d)).*$","$1","r")><#local result = result?remove_ending('.00')?remove_ending(',00')><#return result></#function><#function amt x options={}><#if x?string == ""><#return x><#elseif x?string?contains("%")><#return nsformat_currency(x * 100)?string?replace('[^\\.,٬٫0-9\\-\\(\\)\\u00A0]','','r') + "%"></#if><#if options.round!true><#local x = roundNum(x, 2)></#if><#return nsformat_currency(x)?string?replace('[^\\.,٬٫0-9\\-\\(\\)\\u00A0]','','r')></#function>
 <#function keepAfterHash str><#return str?keep_after("#")></#function>
 
 
 <#function calculateVATsums list taxrate>
 <#local amount = 0>
 <#local taxamount = 0>
 <#list list as item>
 
 <#local itemtaxamount = item.taxamount>
 <#if !itemtaxamount?has_content>
 <#local itemtaxamount = item.tax1amt></#if>
 <#local amount = amount + item.amount>
 <#local taxamount = taxamount + itemtaxamount></#list>
 
 <#return {
"taxrate": taxrate?string,
"taxbasis": amount,
"taxamount": taxamount
}>
</#function>

<#function computeVATsummary list>
<#local result=[]>
<#local processed_tax_rates=[]>
<#--Invoice discount-->
<#if notZero(record.discounttotal)>

<#list list as item>

<#if item.taxrate?has_content >

<#local itemtaxrate = item.taxrate>
<#if !itemtaxrate?has_content>
<#local itemtaxrate = item.taxrate1></#if>
<#if itemtaxrate?has_content>
<#local discount_ratio = item.amount / record.subtotal>
<#local discount_for_item = {
"taxrate": itemtaxrate,
"amount": discount_ratio * record.discounttotal,
"taxamount": discount_ratio * itemtaxrate * record.discounttotal
}>
</#if>
<#local list = list + [discount_for_item]></#if>
</#list>


</#if>

<#--Shipping-->
<#local shippingcost = record.shippingcost>
<#if notZero(record.handlingcost)>
<#local shippingcost = shippingcost - record.handlingcost>
</#if>

<#if notZero(shippingcost) && record.shippingtax1rate?has_content>
<#local shipping = {
"taxrate": nsformat_percent(record.shippingtax1rate)?string,
"amount": shippingcost,
"taxamount": (record.shippingtax1rate?number / 100) * shippingcost
}>
<#local list = list + [shipping]>
</#if>

<#--Handling-->
<#if notZero(record.handlingcost) && record.handlingtax1rate?has_content && record.handlingtax1rate != 'A'>
<#local handling = {
"taxrate": nsformat_percent(record.handlingtax1rate)?string,
"amount": record.handlingcost,
"taxamount": (record.handlingtax1rate?number / 100) * record.handlingcost
}>
<#local list = list + [handling]>
</#if>
<#list list as item>
<#local itemtaxrate = item.taxrate>
<#if !itemtaxrate?has_content>
<#local itemtaxrate = item.taxrate1>
</#if>

<#if itemtaxrate?has_content && !processed_tax_rates?seq_contains(itemtaxrate?string)>
<#local items = []>

<#list list as item2>
<#local item2taxrate = item2.taxrate>
<#if !item2taxrate?has_content>
<#local item2taxrate = item2.taxrate1>
</#if>
<#if item2taxrate?string == itemtaxrate?string>
<#local items = items + [item2]>
</#if>
</#list>


<#local result = result + [calculateVATsums(items, itemtaxrate)]>
<#local processed_tax_rates = processed_tax_rates + [itemtaxrate?string]></#if></#list>
<#return result>

</#function>
<head>

	<link name="NotoSans" type="font" subtype="truetype" src="${nsfont.NotoSans_Regular}" src-bold="${nsfont.NotoSans_Bold}" src-italic="${nsfont.NotoSans_Italic}" src-bolditalic="${nsfont.NotoSans_BoldItalic}" bytes="2" />
	<#if .locale == "zh_CN"><link name="NotoSansCJKsc" type="font" subtype="opentype" src="${nsfont.NotoSansCJKsc_Regular}" src-bold="${nsfont.NotoSansCJKsc_Bold}" bytes="2" />
	<#elseif .locale == "zh_TW"><link name="NotoSansCJKtc" type="font" subtype="opentype" src="${nsfont.NotoSansCJKtc_Regular}" src-bold="${nsfont.NotoSansCJKtc_Bold}" bytes="2" />
	<#elseif .locale == "ja_JP"><link name="NotoSansCJKjp" type="font" subtype="opentype" src="${nsfont.NotoSansCJKjp_Regular}" src-bold="${nsfont.NotoSansCJKjp_Bold}" bytes="2" />
	<#elseif .locale == "ko_KR"><link name="NotoSansCJKkr" type="font" subtype="opentype" src="${nsfont.NotoSansCJKkr_Regular}" src-bold="${nsfont.NotoSansCJKkr_Bold}" bytes="2" />
	<#elseif .locale == "th_TH"><link name="NotoSansThai" type="font" subtype="opentype" src="${nsfont.NotoSansThai_Regular}" src-bold="${nsfont.NotoSansThai_Bold}" bytes="2" />
	</#if>

    <macrolist>
      <macro id="nlheader">
            <table class="header" style="width: 100%;">
              <tr>
                <td width="55%">
                  <#if companyInformation.logoUrl?length != 0><img src="${companyInformation.logoUrl}" style="float: left; margin: 0px" /></#if>
                </td>
                <td align="right" style="font-size:22px; vertical-align: bottom;">Nota de Crédito</td>
              </tr>
              <tr style="margin-top:5px">
                <td>${subsidiary.mainaddress_text}<br/><b>NIF: </b>${subsidiary.federalidnumber}</td>
                <td align="right" style="font-size:22px; vertical-align: top;">#${record.tranid}</td>
              </tr>
              <tr>
                <td>
  <table width="100%">
    <tr>
      <td width="35%" style="font-size:8pt; padding:2px 4px 2px 0px; white-space:nowrap;">
        <b>
          <#if subsidiary.country == 'Portugal'>
            Número EROI:
          <#else>
            Número EROI:
          </#if>
        </b>
      </td>
      <td width="65%" style="font-size:8pt; padding:2px 4px 2px 0px;">
        ${subsidiary.custrecord_rsl_eroi_num}
      </td>
    </tr>
    <tr>
      <td style="font-size:8pt; padding:2px 4px 2px 0px; white-space:nowrap;">
        <b>
          <#if subsidiary.country == 'Portugal'>
            Telefone:
          <#else>
            Teléfono:
          </#if>
        </b>
      </td>
      <td style="font-size:8pt; padding:2px 4px 2px 0px;">
        ${subsidiary.custrecord_rsl_telephone}
      </td>
    </tr>
    <#if subsidiary.country != 'Portugal'>
    <tr>
      <td style="font-size:8pt; padding:2px 4px 2px 0px; white-space:nowrap;">
        <b>Fax:</b>
      </td>
      <td style="font-size:8pt; padding:2px 4px 2px 0px;">
        ${subsidiary.fax}
      </td>
    </tr>
    </#if>
    <tr>
      <td style="font-size:8pt; padding:2px 4px 2px 0px;">
        <b>
          <#if subsidiary.country == 'Portugal'>
            E-mail de atendimento<br/>ao cliente:
          <#else>
            Correo de atención<br/>al cliente:
          </#if>
        </b>
      </td>
      <td style="font-size:8pt; padding:2px 4px 2px 0px;">
        ${subsidiary.custrecord_rsl_cs_email_pdf}
      </td>
    </tr>
    <tr>
      <td style="font-size:8pt; padding:2px 4px 2px 0px; white-space:nowrap;">
        <b>
          <#if subsidiary.country == 'Portugal'>
            Website:
          <#else>
            Sitio web:
          </#if>
        </b>
      </td>
      <td style="font-size:8pt; padding:2px 4px 2px 0px;">
        ${record.custbody_rnr_website}
      </td>
    </tr>
  </table>
</td>

<td>
  <table width="100%">
    <tr>
      <td width="33%" align="left" style="font-size:8pt; padding:2px 4px 2px 0px; white-space:nowrap;">
        <b>
          <#if subsidiary.country == 'Portugal'>
            Data:
          <#else>
            Fecha:
          </#if>
        </b>
      </td>
      <td width="67%" align="left" style="font-size:8pt; padding:2px 4px 2px 0px;">
        ${record.trandate}
      </td>
    </tr>
    <tr>
      <td align="left" style="font-size:8pt; padding:2px 4px 2px 0px; white-space:nowrap;">
        <b>
          <#if subsidiary.country == 'Portugal'>
            Cliente
          </#if>
        </b>
      </td>
      <td align="left" style="font-size:8pt; padding:2px 4px 2px 0px;">
        ${record.entity}
      </td>
    </tr>
    <tr>
      <td align="left" style="font-size:8pt; padding:2px 4px 2px 0px;">
        <b>
          <#if subsidiary.country == 'Portugal'>
            NIF Cliente:
          <#else>
            NIF Cliente:
          </#if>
        </b>
      </td>
      <td align="left" style="font-size:8pt; padding:2px 4px 2px 0px;">
        ${record.custbody_rnr_vat_reg_number}
      </td>
    </tr>
    <tr>
      <td align="left" style="font-size:8pt; padding:2px 4px 2px 0px; white-space:nowrap;">
        <b>
          <#if subsidiary.country == 'Portugal'>
            Moeda:
          <#else>
            Moneda:
          </#if>
        </b>
      </td>
      <td align="left" style="font-size:8pt; padding:2px 4px 2px 0px;">
        ${record.currency}
      </td>
    </tr>
    <tr>
      <td align="left" style="font-size:8pt; padding:2px 4px 2px 0px; white-space:nowrap;">
        <b>
          <#if subsidiary.country == 'Portugal'>
            Subsidiária:
          <#else>
            Subsidiaria:
          </#if>
        </b>
      </td>
      <td align="left" style="font-size:8pt; padding:2px 4px 2px 0px;">
        ${record.subsidiary}
      </td>
    </tr>
  </table>
</td>
              </tr>
          </table>
        </macro>
      <macro id="nlfooter">
  <table class="footer" style="width: 100%;">
    <tr>
      <td align="center">&nbsp;</td>
    </tr>

    <tr>
      <td align="center">
        <b>Sede legal: <#list subsidiary.returnaddress_text?split(r"<br />", "r") as sa>${sa} </#list></b>
      </td>
    </tr>

    <tr>
      <td align="center">
        <#if subsidiary.country == 'Portugal'>
          A Propriedade da mercadoria descrita acima não passará ao cliente até que a Rayner tenha recebido o pagamento total.
        <#else>
          La propiedad de la mercancía descrita anteriormente no pasará al cliente hasta que Rayner haya recibido el pago completo.
        </#if>
      </td>
    </tr>

    <tr>
      <td align="center">
        <#if subsidiary.country == 'Portugal'>
          Os riscos da mercadoria são passados para o cliente na entrega da Rayner para o transportador.
        <#else>
          Los riesgos de la mercancía se transfieren al cliente en la entrega de Rayner al transportista.
        </#if>
      </td>
    </tr>

    <tr>
      <td align="center">
        <#if subsidiary.country == 'Portugal'>
          Os preços e as especificações estão sujeitas a alterações a qualquer momento sem aviso prévio.
        <#else>
          Los precios y las especificaciones están sujetos a cambios en cualquier momento sin previo aviso.
        </#if>
      </td>
    </tr>

    <tr>
      <td align="center">
        <#if subsidiary.country == 'Portugal'>
          Nossas condições gerais de contratação estão disponíveis mediante solicitação em nosso site
          <a href="https://www.rayner.com">www.rayner.com</a>
        <#else>
          Nuestras condiciones generales de contratación están disponibles bajo petición en nuestro sitio web
          <a href="https://www.rayner.com">www.rayner.com</a>
        </#if>
      </td>
    </tr>

    <tr>
      <td align="center"><b>Sede social:</b> ${subsidiary.addr1} ${subsidiary.zip} ${subsidiary.city}</td>
    </tr>
    <tr>
      <td>
        <table style="width: 100%;">
          <tr>
            <td align="center" style="width: 91%;"><b>NIF:</b> ${subsidiary.federalidnumber}</td>
            <td align="right" style="width: 9%;"><pagenumber/> of <totalpages/></td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
</macro>
    </macrolist>

    <style type="text/css">
      * {
		<#if .locale == "zh_CN">font-family: NotoSans, NotoSansCJKsc, sans-serif;
		<#elseif .locale == "zh_TW">font-family: NotoSans, NotoSansCJKtc, sans-serif;
		<#elseif .locale == "ja_JP">font-family: NotoSans, NotoSansCJKjp, sans-serif;
		<#elseif .locale == "ko_KR">font-family: NotoSans, NotoSansCJKkr, sans-serif;
		<#elseif .locale == "th_TH">font-family: NotoSans, NotoSansThai, sans-serif;
		<#else>font-family: NotoSans, sans-serif;
		</#if>
      }
      table { font-size: 9pt; table-layout: fixed; }
      th { font-weight: bold; font-size: 8pt; vertical-align: middle; padding: 5px 6px 3px; background-color: #e3e3e3; color: #333333; }
      td { padding: 4px 6px; }
      td p { align:left }
      b { font-weight: bold; color: #333333; }
      table.header td { padding: 0; font-size: 10pt; }
      table.footer td { padding: 0; font-size: 8pt; }
      table.itemtable th { padding-bottom: 10px; padding-top: 10px; }
      table.body td { padding-top: 2px; }
      td.addressheader { font-size: 8pt; font-weight: bold; padding-top: 6px; padding-bottom: 6px; }
      td.address { padding-top: 0; }
      td.top { padding: 2px 2px 2px 2px; text-align: left; }
      span.title { font-size: 28pt; }
      span.number { font-size: 16pt; }
      span.itemname { font-weight: bold; line-height: 150%; }
      div.returnform { width: 100%; height: 200pt; page-break-inside: avoid; page-break-after: avoid; }
      hr { border-top: 1px dashed #d3d3d3; width: 100%; color: #ffffff; background-color: #ffffff; height: 1px; }
    </style>
</head>

<body header="nlheader" header-height="22%" footer="nlfooter" footer-height="5%" padding="0.5in 0.5in 0.5in 0.5in" size="A4">

  <table style="width:100%; table-layout:fixed;">
  <tr>
    <td class="addressheader" width="55%">
      <b>
        <#if subsidiary.country == 'Portugal'>
          Creditar a
        <#else>
          Abonar a
        </#if>
      </b>
    </td>

    <td class="addressheader" width="45%">
      &nbsp;
    </td>
  </tr>

  <tr>
    <td class="address" width="55%" valign="top">
      ${record.billaddress}
    </td>

    <td width="45%" valign="top" style="padding-top:0px; padding-left:12px;">

      <#if record.custbody_nexpt_ciuspt_compromisso?has_content
            || record.custbody_nexpt_ciuspt_envio?has_content>

        <table style="width:100%; table-layout:auto;" border="0">

          <#if record.custbody_nexpt_ciuspt_compromisso?has_content>
            <tr>
              <td style="padding:0px; font-size:8pt; white-space:nowrap;">
                <b>Número de compromisso:</b>
                ${record.custbody_nexpt_ciuspt_compromisso}
              </td>
            </tr>
          </#if>

          <#if record.custbody_nexpt_ciuspt_envio?has_content>
            <tr>
              <td style="padding:0px; font-size:8pt; white-space:nowrap;">
                <b>Referência do envio:</b>
                ${record.custbody_nexpt_ciuspt_envio}
              </td>
            </tr>
          </#if>

        </table>

      </#if>

    </td>
  </tr>
</table>

  <table class="body" style="width: 100%; margin-top: 10px;">
    <tr>
      <th>PO Cliente</th>
      <#if subsidiary.country == 'Portugal'><th>Aplicado a</th></#if>
    </tr>
	<tr>
      <td>${record.otherrefnum}</td>
      <#if subsidiary.country == 'Portugal'><td>${record.custbody_ptl_print_sourceid} <b>||</b> ${record.createdfrom.tranid}</td></#if>
    </tr>
  </table>

  <#assign linecount = 0>
<#assign totalqty = 0>
<#assign shipping = 0>

<#if record.item?has_content>
  <table class="itemtable" style="width:100%; margin-top:10px; table-layout:fixed;">
    <#list record.item as item>
      <#if item.item == "2nd Day Air"><#assign shipping = item.amount></#if>
      <#if item.item == "Airborne"><#assign shipping = item.amount></#if>
      <#if item.item == "FedEx"><#assign shipping = item.amount></#if>
      <#if item.item == "FedEx Express"><#assign shipping = item.amount></#if>
      <#if item.item == "FedEx Express 2 Day (by 4:30 pm)"><#assign shipping = item.amount></#if>
      <#if item.item == "FedEx Express International Priority-Cor (Next day)"><#assign shipping = item.amount></#if>
      <#if item.item == "FedEx Express Priority Overnight (by 10:30 am)"><#assign shipping = item.amount></#if>
      <#if item.item == "FedEx Express Priority Overnight – Sat"><#assign shipping = item.amount></#if>
      <#if item.item == "FedEx Express Standard Overnight (by 3:00 pm)"><#assign shipping = item.amount></#if>
      <#if item.item == "FedEx Ground"><#assign shipping = item.amount></#if>
      <#if item.item == "Ground"><#assign shipping = item.amount></#if>
      <#if item.item == "Next Day Air"><#assign shipping = item.amount></#if>
      <#if item.item == "Next Day Air - Early AM"><#assign shipping = item.amount></#if>
      <#if item.item == "Shipping items - test UKK"><#assign shipping = item.amount></#if>
      <#if item.item == "UPS"><#assign shipping = item.amount></#if>
      <#if item.item == "UPS International"><#assign shipping = item.amount></#if>

      <#if item_index == 0>
        <thead>
          <tr>
            <th width="8%" align="right" style="white-space:nowrap;">
              <#if subsidiary.country == 'Portugal'>Qtd<#else>Cant.</#if>
            </th>
            <th width="45%" align="left">
              <#if subsidiary.country == 'Portugal'>Artigo / Descrição<#else>Artículo / Descripción</#if>
            </th>
            <th width="10%" align="left" style="white-space:nowrap;">
              <#if subsidiary.country == 'Portugal'>Un<#else>UM</#if>
            </th>
            <th width="12%" align="right" style="white-space:nowrap;">
              <#if subsidiary.country == 'Portugal'>Preço<#else>Precio</#if>
            </th>
            <th width="10%" align="right" style="white-space:nowrap;">
              <#if subsidiary.country == 'Portugal'>IVA<#else>IVA</#if>
            </th>
            <th width="15%" align="right" style="white-space:nowrap;">
              <#if subsidiary.country == 'Portugal'>Valor<#else>Importe</#if>
            </th>
            <#if subsidiary.country == 'Portugal'>
            <th width="15%" align="right" style="white-space:nowrap;">Número CDM</th>
            </#if>
          </tr>
        </thead>
      </#if>

      <tr>
        <#assign linecount += 1>

        <#if item.quantity?is_nan>
          <#assign totalqty = totalqty>
        <#else>
          <#assign totalqty += item.quantity>
        </#if>

        <td align="right" valign="top" style="white-space:nowrap;">${item.quantity}</td>

  <td align="left" valign="top">
    <b>${item.item}</b>
    <#if item.description?has_content><br/>${item.description}</#if>
  </td>

  <td align="left" valign="top" style="white-space:nowrap;">${item.units}</td>

  <#if item.item?starts_with("Price Correction")>
    <td align="right" valign="top">&nbsp;</td>
  <#else>
    <td align="right" valign="top" style="white-space:nowrap;">${nsformat_currency((item.quantity?has_content && item.quantity != 0)?then(item.amount / item.quantity, 0))}</td>
  </#if>

  <td align="right" valign="top" style="white-space:nowrap;">${item.taxrate1}</td>
  <td align="right" valign="top" style="white-space:nowrap;">${item.amount}</td>
  <#if subsidiary.country == 'Portugal'><td align="right" valign="top" style="white-space:nowrap;">${item.custcol_cdm_number_portugal}</td></#if>
</tr>
    </#list>
  </table>

  <hr />

  <table class="total" style="width:100%; margin-top:10px; table-layout:fixed;">
    <tr>
      <td width="24%" align="left" style="white-space:nowrap;">
        <b><#if subsidiary.country == 'Portugal'>Número de linhas<#else>Número de líneas</#if>:</b>
      </td>
      <td width="8%" align="left" style="white-space:nowrap;">${linecount}</td>

      <td width="28%" align="left" style="white-space:nowrap;">
        <b>
          <#if subsidiary.country == 'Portugal'>
            Qtd Total Creditada
          <#else>
            Cantidad Total Abonada
          </#if>:
        </b>
      </td>
      <td width="10%" align="left" style="white-space:nowrap;">${totalqty}</td>

      <td width="15%" align="right" style="white-space:nowrap;">
        <b><#if subsidiary.country == 'Portugal'>Frete<#else>Transporte</#if></b>
      </td>
      <#assign currencysymbol = record.total?substring(0, 1)>
      <td width="15%" align="right" style="white-space:nowrap;">${currencysymbol}${shipping}</td>
    </tr>

    <tr>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td align="right" style="white-space:nowrap;">
        <b><#if subsidiary.country == 'Portugal'>IVA<#else>IVA</#if></b>
      </td>
      <td align="right" style="white-space:nowrap;">${record.taxtotal}</td>
    </tr>

    <tr class="totalrow">
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td align="right" style="white-space:nowrap;"><b>Total</b></td>
      <td align="right" style="white-space:nowrap;">${record.total}</td>
    </tr>

    <tr>
      <td colspan="6">&nbsp;</td>
    </tr>

    <tr>
      <td align="left" style="white-space:nowrap;">
        <b><#if subsidiary.country == 'Portugal'>Descrição<#else>Descripción</#if>:</b>
      </td>
      <td colspan="5" align="left">${record.memo}</td>
    </tr>
  </table>
</#if>

<#if record.item?has_content>
  <table width="100%" style="table-layout:fixed;">
    <tr>
      <th align="left" width="50%" style="white-space:nowrap;">
        <#if subsidiary.country == 'Portugal'>Artigo<#else>Artículo</#if>
      </th>
      <th align="left" width="50%" style="white-space:nowrap;">
        <#if subsidiary.country == 'Portugal'>
          Número de lote ou número de série
        <#else>
          Número de lote o número de serie
        </#if>
      </th>
    </tr>

    <#list record.item as i>
      <#if i.inventorydetail?has_content>
        <#assign lot = i.inventorydetail?keep_before(",")>
        <#if lot?has_content>
          <#list i.inventorydetail?split("<br />") as inv>
            <tr>
              <td align="left" valign="top">${i.item}</td>
              <td align="left" valign="top">${inv?keep_before(",")}</td>
            </tr>
          </#list>
        </#if>
      </#if>
    </#list>
  </table>
</#if>
    
<table style="width:100%;margin-top:10px" border="0">
  <tr>

    <!-- ================= LEFT SIDE ================= -->
    <td style="width:60%; vertical-align:top;">

      <!-- ===== LEGAL / CERTIFICATE INFO ===== -->
      <table style="width:100%; margin-top:5px;">
        <tr>
          <td colspan="3" style="font-size:10pt;">
            <p style="font-size:10pt;">${record.custbody_alf_tax_compliance_text}</p>
          </td>
        </tr>

        <#if subsidiary.country == 'Portugal'>
          <tr>
            <td colspan="3" style="font-size:10pt;">
              Os serviços faturados foram colocados à disposição na data do documento
            </td>
          </tr>
        </#if>

        <tr>
          <td colspan="3" style="border-bottom:2pt solid black; font-size:10pt;">
            ${record.custbody_ptl_print_certificate}
          </td>
        </tr>
      </table>

      <!-- ===== VAT SUMMARY ===== -->
      <table style="width:100%; margin-top:10px; table-layout:fixed;">
        <tr>
          <td style="font-size:10pt; color:black;" colspan="3">
            <b>
              <#if subsidiary.country == 'Portugal'>
                Resumo do IVA
              <#else>
                Resumen del IVA
              </#if>
            </b>
          </td>
        </tr>

        <tr>
          <td style="border-bottom:1px dotted #808080; border-top:1px dotted #808080; font-size:10pt; white-space:nowrap;">
            <#if subsidiary.country == 'Portugal'>
              Taxa
            <#else>
              Tasa
            </#if>
          </td>
          <td style="border-bottom:1px dotted #808080; border-top:1px dotted #808080; font-size:10pt; white-space:nowrap;">
            <#if subsidiary.country == 'Portugal'>
              Incidência
            <#else>
              Incidencia
            </#if>
          </td>
          <td style="border-bottom:1px dotted #808080; border-top:1px dotted #808080; font-size:10pt; white-space:nowrap;">
            <#if subsidiary.country == 'Portugal'>
              Valor
            <#else>
              Valor
            </#if>
          </td>
        </tr>

        <#assign exchrate = record.exchangerate>

        <#if record.taxsummary?has_content>
          <#assign taxdatalist = record.taxsummary>
        <#else>
          <#assign taxdatalist = computeVATsummary(record.item)>
        </#if>

        <#assign taxdatalist_numbered = []>
        <#list taxdatalist as tax>
          <#assign taxdatalist_numbered += [
            tax + {
              "taxratenumber" : tax.taxrate?replace('[^\\.,٬0-9]','','r')?number
            }
          ]>
        </#list>

        <#list taxdatalist_numbered?sort_by("taxratenumber")?reverse as tax>
          <tr>
            <td style="font-size:10pt;">${tax.taxrate}</td>
            <td style="font-size:10pt;">
              ${nsformat_currency(
                nsformat_number(tax.taxbasis) * nsformat_number(record.exchangerate),
                'EUR'
              )}
            </td>
            <td style="font-size:10pt;">
              ${nsformat_currency(
                nsformat_number(tax.taxamount) * nsformat_number(record.exchangerate),
                'EUR'
              )}
            </td>
          </tr>
        </#list>

        <!-- ===== WITHHOLDING TAX ===== -->
        <#assign witaxCodes = {}>
        <#assign whamount = 0>

        <#list record.item as item>
          <#if item.custcol_4601_witaxapplies>
            <#assign witaxKey = item.custcol_4601_witaxcode + "_" + item.custcol_4601_witaxrate>

            <#if witaxCodes[witaxKey]??>
              <#assign currentData = witaxCodes[witaxKey]>
              <#assign witaxCodes = witaxCodes + {
                witaxKey : {
                  "code"       : item.custcol_4601_witaxcode,
                  "rate"       : item.custcol_4601_witaxrate,
                  "baseAmount" : currentData.baseAmount + (item.custcol_4601_witaxbaseamount * -1),
                  "taxAmount"  : currentData.taxAmount + item.custcol_4601_witaxamount
                }
              }>
            <#else>
              <#assign witaxCodes = witaxCodes + {
                witaxKey : {
                  "code"       : item.custcol_4601_witaxcode,
                  "rate"       : item.custcol_4601_witaxrate,
                  "baseAmount" : (item.custcol_4601_witaxbaseamount * -1),
                  "taxAmount"  : item.custcol_4601_witaxamount
                }
              }>
            </#if>

            <#assign whamount = whamount + item.custcol_4601_witaxamount>
          </#if>
        </#list>

        <#list witaxCodes?keys as key>
          <tr>
            <td style="font-size:10pt;">${witaxCodes[key].code}</td>
            <td style="font-size:10pt;">
              ${nsformat_currency(witaxCodes[key].baseAmount, 'EUR')}
            </td>
            <td style="font-size:10pt;">
              ${nsformat_currency(witaxCodes[key].taxAmount, 'EUR')}
            </td>
          </tr>
        </#list>
      </table>

    </td>

    <!-- ================= RIGHT SIDE ================= -->
    <td style="width:40%; vertical-align:top; padding-left:10px; text-align:right;">

      <table style="width:100%;" border="0">
        <tr>
          <td style="height:75px;"></td>
        </tr>

        <tr>
          <td style="font-size:8pt; text-align:right; padding-bottom:6px;">
            <#if record.custbody_ptl_print_atcud?? && record.custbody_ptl_print_atcud?length != 0>
              ATCUD - ${record.custbody_ptl_print_atcud}
            </#if>
          </td>
        </tr>

        <tr>
          <td style="text-align:right;">
            <#if record.custbody_ptl_print_qrcode?has_content
                  && record.custbody_ptl_print_qrcode?string != "">
              <img src="${record.custbody_ptl_print_qrcode}" style="width:30mm; height:30mm;" />
            </#if>
          </td>
        </tr>
      </table>

    </td>
  </tr>
</table>
</body>
</pdf>