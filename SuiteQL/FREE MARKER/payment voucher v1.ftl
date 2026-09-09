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
            <table class="header" style="width: 100%;"><tr>
	<td rowspan="3" style="height: 50px;"><#if companyInformation.logoUrl?length != 0><img src="${companyInformation.logoUrl}" style="float: left; margin: 7px" /> </#if><br /><br /><br /><br /><br /><br />${record.custbody_alf_subsidiary_legal_name}&nbsp;<br /><br />${record.custbody_alf_subsidiary_address}</td>

	<td align="right"><span style="font-size:22px;"><b>Payment Voucher</b></span></td>
	</tr>
    <tr>
	<td align="right"><span class="number"><b>Date: </b>${record.trandate}</span></td>
	</tr>
	<tr>
	<td align="right"><span class="number"><b> Check #: </b>${record.tranid}</span></td>
	</tr>
    </table>
    <table>
    <tr>
	<td align="left">${subsidiary.addrtext}</td>
	</tr>
    <tr>
	<td align="left"><b>Email: </b>${subsidiary.custrecord_rnr_finance_email}</td>
	</tr>
    </table>
    <table style="margin-top: 30px;">
    <tr>
	<td align="left"><b>Paid To: </b></td>
	</tr>
    <tr>
	<td align="left">${record.address}</td>
	</tr>
    </table>
        </macro>
    </macrolist>
    <style type="text/css">* {
		<#if .locale == "zh_CN">
			font-family: NotoSans, NotoSansCJKsc, sans-serif;
		<#elseif .locale == "zh_TW">
			font-family: NotoSans, NotoSansCJKtc, sans-serif;
		<#elseif .locale == "ja_JP">
			font-family: NotoSans, NotoSansCJKjp, sans-serif;
		<#elseif .locale == "ko_KR">
			font-family: NotoSans, NotoSansCJKkr, sans-serif;
		<#elseif .locale == "th_TH">
			font-family: NotoSans, NotoSansThai, sans-serif;
		<#else>
			font-family: NotoSans, sans-serif;
		</#if>
		}
		table {
			font-size: 9pt;
			table-layout: fixed;
		}
        th {
            font-weight: bold;
            font-size: 8pt;
            vertical-align: middle;
            padding: 5px 6px 3px;
            background-color: #e3e3e3;
            color: #333333;
        }
        td {
            padding: 4px 6px;
        }
		td p { align:left }
        b {
            font-weight: bold;
            color: #333333;
        }
        table.header td {
            padding: 0px;
            font-size: 10pt;
        }
        table.footer td {
            padding: 0px;
            font-size: 8pt;
        }
        table.itemtable th {
            padding-bottom: 10px;
            padding-top: 10px;
        }
        table.body td {
            padding-top: 2px;
        }
        table.total {
            page-break-inside: avoid;
        }
        tr.totalrow {
            background-color: #e3e3e3;
            line-height: 200%;
        }
        td.totalboxtop {
            font-size: 12pt;
            background-color: #e3e3e3;
        }
        td.addressheader {
            font-size: 8pt;
            padding-top: 6px;
            padding-bottom: 2px;
        }
        td.address {
            padding-top: 0px;
        }
        td.totalboxmid {
            font-size: 28pt;
            padding-top: 20px;
            background-color: #e3e3e3;
        }
        td.totalboxbot {
            background-color: #e3e3e3;
            font-weight: bold;
        }
        span.title {
            font-size: 28pt;
        }
        span.number {
            font-size: 10pt;
        }
        span.itemname {
            font-weight: bold;
            line-height: 150%;
        }
        hr {
            width: 100%;
            color: #d3d3d3;
            background-color: #d3d3d3;
            height: 1px;
        }
</style>
</head>
<body header="nlheader" header-height="20%" footer="nlfooter" footer-height="75pt" padding="0.5in 0.5in" size="Letter">
    &nbsp;

<#if record.apply?has_content>

<table class="itemtable" style="width: 100%; margin-top: 100px;"><!-- start items --><#list record.apply as apply><#if apply_index==0>
<thead>
	<tr>
	<th align="center">Date</th>
	<th style="width: 200px;">Description</th>
	<th align="right">Orig. Amount</th>
    <th align="right">Amount Due</th>
	<th align="right">Discount</th>
    <th align="right">Applied Amount</th>
	</tr>
</thead>
</#if><tr>
	<td align="center">${apply.applydate}</td>
	<td align="left">${apply.refnum}</td>
	<td align="right">${apply.total}</td>
    <td align="right">${apply.due}</td>
	<td align="right">${apply.disc}</td>
    <td align="right">${apply.amount}</td>
	</tr>
	</#list><!-- end items --></table>

<hr /></#if>
<table class="total" style="width: 100%; margin-top: 10px;">
	<tr class="totalrow">
	<td background-color="#ffffff" colspan="4">&nbsp;</td>
	<td align="right"><b>${record.total@label}</b></td>
	<td align="right">${record.total}</td>
	</tr></table>
&nbsp;
</body>
</pdf>