<?php
  include_once 'ApplicationHeader.php'; 
  if(!$oCustomer->isLoggedIn())
  {
	header("Location: login.php");
  }
  $aCustomerInfo = $oSession->getSession('sesCustomerInfo');
  $aRequest = $_REQUEST;
 
  $oAssetDepartment = &Singleton::getInstance('Department');
  $oAssetDepartment->setDb($oDb);
  

  if($aRequest['id']!='')
  {
	 $item_id =$oUtil->decode($aRequest['id']);
  }
  else
  {
     $item_id = $aRequest['AssetDeliveryId'];
  }
  

$aCompanys = $oMaster->getPrintCompanyAddress(COMPANY,'id');
$aPrint = $oMaster->getDeliveryPrint($item_id);
/*echo '<pre>';
  print_r($aPrint);
   echo '</pre>';
 exit();*/
  $oAssetVendor = &Singleton::getInstance('Vendor');
  $oAssetVendor->setDb($oDb);
  
?>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->
<!--[if !IE]><!--> <html lang="en"> <!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
   <meta charset="utf-8" />
   <title>EAMS| STORE DELIVERY VIEW </title>
   <meta content="width=device-width, initial-scale=1.0" name="viewport" />
   <meta content="" name="description" />
   <meta content="" name="author" />
   <meta http-equiv="Cache-control" content="No-Cache">
<script type="text/javascript">
<!--
    function printPartOfPage(elementId) {
        var printContent = document.getElementById(elementId);
        var windowUrl = 'DELIVERY REPORT';
        var uniqueName = new Date();
        var windowName = 'Print' + uniqueName.getTime();
        var printWindow = window.open(windowUrl, windowName, 'left=0,top=0,width=0,height=0');
        printWindow.document.write(printContent.innerHTML);
        printWindow.document.close();
        printWindow.focus();
        printWindow.print();
        printWindow.close();
    }
    // -->
    </script>
    <style>
    body { font-size:12px;
	font-family:"Courier New", Courier, monospace;
	}
    </style>

</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<body >
	
<DIV style="Z-INDEX: 1; POSITION: absolute; HEIGHT: 10px; VISIBILITY: visible; TOP: 10px; LEFT: 0px; RIGHT:100px" align="right" >
<TABLE border=0 cellSpacing=0 cellPadding=0 width="100%">
  <TBODY>
   <TR align="right">
    <TD width="100%"><a onClick="JavaScript:printPartOfPage('print_content');" style="cursor:pointer;"><img src="assets/img/printer.png" title="printer" height="50" width="50"></a> </TD>
    <TD></TD></TR></TBODY></TABLE>
 </DIV>
  
  <div id="print_content">
<TABLE cellSpacing="0" cellPadding="0" width="100%" align="center" style="font-family:'Courier New', Courier, monospace;">
  <TBODY>
  <TR class="srow">
    <TD align="right">&nbsp;</TD></TR>
  <TR class="srow">
    <TD align="center"><FONT size="2"><B> 
    <?php if($aPrint['delivery_type'] == 'ISD')
	{?>
    INTERNAL STORE DELIVERY
    <?php }else {?>EXTERNAL STORE DELIVERY<?php } ?></B></FONT></TD></TR></TBODY></TABLE>
<TABLE border="0" cellSpacing="0" borderColor="black" cellPadding="0" width="100%" 
align="center" style="font-family:'Courier New', Courier, monospace;">
  <TBODY>
  <TR bgColor="white">
    <TD bgColor="white">
      <TABLE border="0" cellSpacing="0"  cellPadding="0" width="100%" bgColor="white" align="center">
        <TBODY>
        <TR>
          <TD width="55%" valign="top">
            <TABLE border="0" cellSpacing="0" cellPadding="0" width="100%" 
align="left" style="font-family:'Courier New', Courier, monospace;">
              <TBODY>
              <TR class="srow">
                <TD  align="left"><FONT size="2"><b><?php echo $aCompanys['company_name'];?></b></FONT></TD></TR>
                <TR class="srow">
                 <TD  align="left"><FONT size="2"><?php echo $aCompanys['addr1'];?></FONT></TD></TR>
                 <TR class="srow">
                  <TD  align="left"><FONT size="2"><?php echo $aCompanys['addr2'];?></FONT></TD></TR>
                  <TR class="srow">
                  <?php if($aCompanys['addr3']!='') { ?>
                   <TD  align="left"><FONT size="2"><?php echo $aCompanys['addr3'];?></FONT></TD></TR>
                   <TR class="srow">
                   <?php } ?>
                    <TD  align="left"><FONT size="2"><?php echo  $aCompanys['city_name'].'-'.$aCompanys['zipcode'];?></FONT></TD></TR>
              </TBODY>
              </TABLE>
           
          </TD>
          <TD width="45%" valign="top">
            <TABLE border="0" cellSpacing="0" cellPadding="0" width="100%" 
align="right" style="font-family:'Courier New', Courier, monospace;">
              <TBODY>
                <TR class="srow">
                <TD  align="left"><FONT size="2">TIN NO</FONT></TD>
                <TD><FONT size="2">:  <?php echo $aCompany['id_tin'];?></FONT></TD></TR>
              <TR class="srow">
                <TD  align="left"><FONT size="2">CST NO</FONT></TD>
                <TD><FONT size="2">:  <?php $aCompanys1 = explode("/", $aCompany['id_cst_date']); echo $aCompanys1[0]; ?> Dt .<?php  echo $aCompanys1[1]; ?> </FONT></TD></TR>
              <TR class="srow">
                <TD align="left"><FONT 
 size="2">PHONE</FONT></TD>
                <TD><FONT size="2">: <?php echo $aCompany['phone'];?></FONT></TD></TR>
                <TR class="srow">
                <TD  align="left"><FONT 
size="2">EMAIL</FONT></TD>
                <TD >: <FONT size="2"><?php echo $aCompany['email'];?></FONT> 
              </TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE>
              <HR style="border:dashed  black; border-width:2px 0 0 0;" >

     <TABLE cellSpacing="0" cellPadding="0" width="100%"  align="center" border="0" style="font-family:'Courier New', Courier, monospace;">
  <TBODY>
  <TR bgColor="white">
     <TD width="55%" style="padding-left:10px;">
     
	 <span><b>FROM :</b></span>
    
	 <TABLE border="0" cellSpacing="0" cellPadding="0" width="100%" 
align="left" style="font-family:'Courier New', Courier, monospace;">
              <TBODY>
              <TR class="srow">
                <TD  align="left"><FONT size="2"><b><?php echo $aPrint['from_address_format']['name'];?></b></FONT></TD></TR>
                <TR class="srow">
                <?php if($aPrint['to_address_format']['contact_name']!='') { ?>
                 <TD  align="left"><FONT size="2"><?php echo $aPrint['from_address_format']['contact_name'];?></FONT></TD></TR>
                 <?php } ?>
                    <TR class="srow">
                  <TD  align="left"><FONT size="2"><?php echo $aPrint['from_address_format']['addr1'];?></FONT></TD></TR>
                  <TR class="srow">
                  <?php if($aPrint['to_address_format']['addr2']!='') { ?>
                  <TD  align="left"><FONT size="2"><?php echo $aPrint['from_address_format']['addr2'];?></FONT></TD></TR>
                   <?php } ?>
                  <TR class="srow">
                  <?php if($aPrint['to_address_format']['addr3']!='') { ?>
                   <TD  align="left"><FONT size="2"><?php echo $aPrint['from_address_format']['addr3'];?></FONT></TD></TR>
                   <TR class="srow">
                   <?php } ?>
                    <TD  align="left"><FONT size="2"><?php echo  $aPrint['from_address_format']['city_name'].'-'.$aPrint['from_address_format']['zipcode'];?></FONT></TD></TR>
              </TBODY>
              </TABLE>
              </TD>
       <TD width="45%" >
	   <span ><b>TO : </b></span>
	  <TABLE border="0" cellSpacing="0" cellPadding="0" width="100%" 
align="left" style="font-family:'Courier New', Courier, monospace;">
              <TBODY>
              <TR class="srow">
                <TD  align="left"><FONT size="2"><b><?php echo $aPrint['to_address_format']['name'];?></b></FONT></TD></TR>
                <TR class="srow">
                <?php if($aPrint['to_address_format']['contact_name']!='') { ?>
                 <TD  align="left"><FONT size="2"><?php echo $aPrint['to_address_format']['contact_name'];?></FONT></TD></TR>
                     <?php } ?>
                     <TR class="srow">
                  <TD  align="left"><FONT size="2"><?php echo $aPrint['to_address_format']['addr1'];?></FONT></TD></TR>
                  <TR class="srow">
                  <?php if($aPrint['to_address_format']['addr2']!='') { ?>
                  <TD  align="left"><FONT size="2"><?php echo $aPrint['to_address_format']['addr2'];?></FONT></TD></TR>
                   <?php } ?>
                   <TR class="srow">
                  <?php if($aPrint['to_address_format']['addr3']!='') { ?>
                   <TD  align="left"><FONT size="2"><?php echo $aPrint['to_address_format']['addr3'];?></FONT></TD></TR>
                   <?php } ?>
                   <TR class="srow">
                    <TD  align="left"><FONT size="2"><?php echo  $aPrint['to_address_format']['city_name'].'-'.$aPrint['to_address_format']['zipcode'];?></FONT></TD></TR>
              </TBODY>
              </TABLE>
    
    </TD>
      </TR></TBODY></TABLE>          
          <HR style="border:dashed  black; border-width:2px 0 0 0;" >       


<TABLE cellSpacing="0" cellPadding="0" width="100%"  align="center" border="0" style="font-family:'Courier New', Courier, monospace;">
  <TBODY>
  <TR>
  <TD width="100%" style="padding-left:20px;">
            <TABLE border="0" cellSpacing="0" cellPadding="0" width="100%" 
align="right">
              <TBODY>
                <TR class="srow">
                <TD  align="left"><FONT size="2"><b>Issue No </b> 
               </FONT></TD>
                <TD><FONT size="2">:  <?php echo $aPrint['issue_no'];?></FONT></TD>
                 <TD  align="left" style="padding-left:30px;"><FONT size="2"> <b>Issue Date </b> 
                  </FONT></TD>
                <TD><FONT size="2">:  <?php echo date('d/m/Y',strtotime($aPrint['issue_date']));?></FONT></TD>
                </TR>
            
             </TBODY></TABLE></TD></TR>
  </TBODY></TABLE>          
          <HR style="border:dashed  black; border-width:2px 0 0 0;" >   
          
          
         <TABLE cellSpacing="0" cellPadding="0" width="100%"  align="center" border="0" style="font-family:'Courier New', Courier, monospace;">
  <TBODY>
  <TR align="center" bgColor="white">
    <TD width="2%" align="left"><B>S.NO</B></TD>
    <TD width="35%" align="left"><B>PARTICULARS</B></TD>
    <TD width="5%" align="left"><B>QUANTITY </B></TD>
     <TD width="5%" align="right"><B>UOM</B></TD>
   </TR>
   <TR>
   <TD colspan="4">
    <HR style="border:dashed  black; border-width:2px 0 0 0;" >  
   </TD>
    
   </TR>
   <?php
   $i=1;
    foreach($aPrint['DeliveryItem'] as $aDeliveryItem)
   {
	   $net_total +=$aDeliveryItem['issue_quantitiy']; 
	   ?>
   <TR>
   <TD align="left" style="text-align:center;"><?php echo $i;?></TD>
   <TD align="left"><?php echo $aDeliveryItem['itemgroup1_name'].'-'.$aDeliveryItem['itemgroup2_name'].'-'.$aDeliveryItem['item_name'];?></TD>
   <TD align="left" style="text-align:center;"><?php echo $aDeliveryItem['issue_quantitiy'];?></TD>
   <TD align="right" ><?php echo $aDeliveryItem['uom_name'];?></TD>
   </TR>
   <?php 
   $i ++;
   } ?>
    <TR>
   <TD colspan="4">
    <HR style="border:dashed  black; border-width:2px 0 0 0;" >  
   </TD>
    
   </TR>
   
     <TR>
   <TD align="left"></TD>
   <TD align="left">TOTAL</TD>
   <TD align="left" style="text-align:center;"><b><?php echo $net_total;?></b></TD>
   <TD align="right"></TD>
    
   </TR>
     <TR>
   <TD colspan="4">
    <HR style="border:dashed  black; border-width:2px 0 0 0;" >  
   </TD>
    
   </TR>
    <TR>
   <TD align="left">REMARKS:</TD>
   <TD colspan="3" align="left">&nbsp;<?php echo $aPrint['remark'];?></TD>
  
    
   </TR>
   </TBODY>
   </TABLE>
        
 <BR><BR>  <BR><BR>      

<BR><BR>
<TABLE border="0" cellSpacing="0" cellPadding="0" width="100%" 
align="center" style="font-family:'Courier New', Courier, monospace;">
  <TBODY>
  
  <TR class="srow" >
     <TD align='left'><FONT  size="2"><B>RECEIVER'S SIGNATURE</B></FONT></TD>
    <TD  align='left'><FONT  size="2"><B>VERIFIED BY</B></FONT></TD>
   <TD  align='right'><FONT  size="2"><B>PREPARED 
    BY</B></FONT></TD>
  <TD  align='right'><FONT  size="2"><B>AUTHORISED  SIGNATURE</B></FONT></TD>
  </tr>
  
  <TR class="srow">
    <TD colSpan="4">
     <HR style="border:dashed  black; border-width:2px 0 0 0;" >   
    </TD></TR></TBODY></TABLE>
    
    
    <TABLE cellSpacing="0" cellPadding="0" width="100%" align="center" style="font-family:'Courier New', Courier, monospace;">
  <TBODY>
  <TR class="srow">
    <TD align="right">&nbsp;</TD></TR>
  <TR class="srow">
    <TD align="center"><FONT size="2"><B>GATE PASS</B></FONT></TD></TR></TBODY></TABLE>
        <HR style="border:dashed  black; border-width:2px 0 0 0;" >  
        
        <TABLE cellSpacing="0" cellPadding="0" width="100%"  align="center" border="0" style="font-family:'Courier New', Courier, monospace;">
  <TBODY>

           
                <TR class="srow">
                <TD width="10%"  align="left"><FONT size="2"><b>From </b> 
               </FONT></TD>
                <TD width="44%"><FONT size="2">:  <?php echo $aPrint['from_address_format']['name'];?></FONT></TD>
                 <TD width="6%"  align="left" style="padding-left:30px;"><FONT size="2"> <b>To </b> 
                  </FONT></TD>
                <TD width="40%"><FONT size="2">:  <?php echo $aPrint['to_address_format']['name'];?></FONT></TD>
                </TR>
                 <TR class="srow">
                <TD  align="left"><FONT size="2"><b>Out.No/Dt. </b> 
               </FONT></TD>
                <TD><FONT size="2">:  <?php echo $aPrint['issue_no'].'-'.date('d/m/Y',strtotime($aPrint['issue_date']));?></FONT></TD>
                 <TD  align="left" style="padding-left:30px;"><FONT size="2"> <b>QTY </b> 
                  </FONT></TD>
                <TD><FONT size="2">:  <?php echo $net_total;?> </FONT></TD>
                </TR>
                 <TR class="srow">
                <TD  align="left"><FONT size="2"><b>Vehicle </b> 
               </FONT></TD>
                <TD><FONT size="2">:  </FONT></TD>
                 <TD  align="left"><FONT size="2"><b> </b> 
               </FONT></TD>
                <TD><FONT size="2"> </FONT></TD>
                </TR>
               
                <TR class="srow">
                <TD  align="left"><FONT size="2"><b>Descr. </b> 
               </FONT></TD>
                <TD colspan="3"><FONT size="2">:
                 <?php 
				 foreach($aPrint['GateItem'] as $aGateItem)
                 {
					 
					 $Item.=$aGateItem['itemgroup1_name'].'-'.$aGateItem['itemgroup2_name'].'-'.$aGateItem['item_name'].',';
				 }
				?>
                <?php echo $Item;?> For <?php echo $aCompanys['company_name'];?>
              
                
                  </FONT>  </TD>
                
                </TR>
            
            
  </TBODY></TABLE> 
  
  <BR>
<TABLE border="0" cellSpacing="0" cellPadding="0" width="100%" 
align="center" style="font-family:'Courier New', Courier, monospace;">
  <TBODY>
  
  <TR class="srow" >
     <TD align='left'><FONT  size="2"><B>RECEIVER'S SIGNATURE</B></FONT></TD>
    <TD  align='left'><FONT  size="2"><B>VERIFIED BY</B></FONT></TD>
    <TD  align='right'><FONT  size="2"><B>AUTHORISED  SIGNATORY</B></FONT></TD>
  </tr>
  
  <TR class="srow">
    <TD colSpan="4">
     <HR style="border:dashed  black; border-width:2px 0 0 0;" >   
    </TD></TR></TBODY></TABLE>
     </div>
    
</body>
<!-- END BODY -->
</html>