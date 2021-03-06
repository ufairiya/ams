<?php
  include_once 'ApplicationHeader.php'; 
  if(!$oCustomer->isLoggedIn())
  {
	header("Location: login.php");
  }
  $aCustomerInfo = $oSession->getSession('sesCustomerInfo');
 
  $aRequest = $_REQUEST;
  
 
  if(isset($aRequest['Update']))
  {
    if($oMaster->updateContact($aRequest,'update'))
	{
	  $msg = "New Contact Updated.";
	 echo '<script type="text/javascript">window.location.href="Contact.php?msg=updatesucess";</script>';
	}
	else $msg = "Sorry";
  } //update
  if(isset($aRequest['send']))
  {
    if($oMaster->addContact($aRequest))
	{
	   $msg = "New Contact Added.";
	  echo '<script type="text/javascript">window.location.href="Contact.php?msg=success";</script>';
	}
	else $msg = "Sorry could not add..";
  } 
  if($aRequest['action'] == 'edit')
  {
	$item_id = $aRequest['fContactId'];
	$edit_result = $oMaster->getContactInfo($item_id,'id');
	 
  } //edit
?>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->
<!--[if !IE]><!--> <html lang="en"> <!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
   <meta charset="utf-8" />
   <title>EAMS| Contact</title>
   <meta content="width=device-width, initial-scale=1.0" name="viewport" />
   <meta content="" name="description" />
   <meta content="" name="author" />
   <meta http-equiv="Cache-control" content="No-Cache">
  <?php include('Stylesheets.php');?>
  </head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<body class="fixed-top">
	<!-- BEGIN HEADER -->
	<?php include_once 'Header.php'; ?>
	<!-- END HEADER -->
   <!-- BEGIN CONTAINER -->
   <div class="page-container row-fluid">
		<!-- BEGIN SIDEBAR -->
        <?php include_once 'LeftMenu.php'; ?>
		<!-- END SIDEBAR -->
      <!-- BEGIN PAGE -->  
      <div class="page-content">
         <!-- BEGIN SAMPLE PORTLET CONFIGURATION MODAL FORM-->
         <div id="portlet-config" class="modal hide">
            <div class="modal-header">
               <button data-dismiss="modal" class="close" type="button"></button>
               <h3>portlet Settings</h3>
            </div>
            <div class="modal-body">
               <p>Here will be a configuration form</p>
            </div>
         </div>
         <!-- END SAMPLE PORTLET CONFIGURATION MODAL FORM-->
         <!-- BEGIN PAGE CONTAINER-->
         <div class="container-fluid">
            <!-- BEGIN PAGE HEADER-->   
            <div class="row-fluid">
               <div class="span12">
                  <!-- BEGIN STYLE CUSTOMIZER -->
                 
                  <!-- END STYLE CUSTOMIZER -->  
                  <h3 class="page-title">
                     Contact
                     <small>Contact master</small>
                  </h3>
                  <ul class="breadcrumb">
                     <li>
                        <i class="icon-home"></i>
                        <a href="index.php">Home</a> 
                        <span class="icon-angle-right"></span>
                     </li>
                     <li>
                        <a href="#">Masters</a>
                        <span class="icon-angle-right"></span>
                     </li>
                    
                      <li>
                        <a href="Contact.php">Contact</a>
                        <span class="icon-angle-right"></span>
                     </li>
                      <?php if($aRequest['action'] == 'Add')
							{ ?>
                     <li><a href="#">Contact Add</a></li>
                        <?php } else {?>
                       <li><a href="#">Contact Edit</a></li>
                        <?php } ?>
                  </ul>
               </div>
            </div>
            
                              <?php
							     if(isset($msg))
								 {
							   ?>
							    <div class="alert alert-success">
									<button class="close" data-dismiss="alert"></button>
									<?php echo $msg; unset($msg); ?> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <a href="Contact.php" class="btn red mini active">Back to List</a>
								</div>
                                
								<?php
								  }
								?> 
                                <div class="alert alert-success" id="error_msg" style="display:none">
									<button class="close" data-dismiss="alert"></button>
									<div id= delete_info></div>
								</div>
                                
            <!-- END PAGE HEADER-->
            <!-- BEGIN PAGE CONTENT-->
        
            			
            <div class="row-fluid">
               <div class="span12">
               
               <!-- BEGIN SAMPLE FORM PORTLET-->   
                  <div class="portlet box blue">
                     <div class="portlet-title">
                      <?php if($aRequest['action'] == 'Add')
							{ ?>
                        <h4><i class="icon-reorder"></i>Add Contact</h4>
                         <?php } else {?>
                          <h4><i class="icon-reorder"></i>Edit Contact</h4>
                        <?php } ?>
                        <div class="tools">
                           <a href="javascript:;" class="collapse"></a>
                           <a href="#portlet-config" data-toggle="modal" class="config"></a>
                           <a href="javascript:;" class="reload"></a>
                           <a href="javascript:;" class="remove"></a>
                        </div>
                     </div>
                     <div class="portlet-body form">
                        <!-- BEGIN FORM-->
                       
                                 <form action="<?php echo $_SERVER['PHP_SELF']; ?>" class="form-horizontal" id="form_contact_addnew" method="post" enctype="multipart/form-data">
									<div class="alert alert-error hide">
									  <button class="close" data-dismiss="alert"></button>
									  You have some form errors. Please check below.
								   </div>
                       						                                     
                                    <div class="control-group">
                                       <label class="control-label">Contact Name<span class="required">*</span></label>
                                       <div class="controls">
                                          <input type="text" placeholder="" class="m-wrap large" name="fContactName" data-required="1" value="<?php echo (!empty($edit_result['contact_name'])? $edit_result['contact_name']:$aRequest['fContactName']); ?>"/>                                         <span class="help-inline">Enter Contact name</span>
                                       </div>
                                    </div>
									
									
																	
									 <div class="control-group">
                                       <label class="control-label">Addr Line1<span class="required">*</span></label>
                                       <div class="controls">
                                          <input type="text" placeholder="" class="m-wrap large" name="fAddr1" data-required="1" value="<?php echo (!empty($edit_result['addr1'])? $edit_result['addr1']:$aRequest['fAddr1']) ;?>"/>
                                          <span class="help-inline">Enter Address Line</span>
                                       </div>
                                    </div>
									
									
									 <div class="control-group">
                                       <label class="control-label">Addr Line2<span class="required">*</span></label>
                                       <div class="controls">
                                          <input type="text" placeholder="" class="m-wrap large" name="fAddr2" data-required="1" value="<?php echo (!empty($edit_result['addr2'])? $edit_result['addr2']:$aRequest['fAddr2']);?>"/>
                                          <span class="help-inline">Enter Address Line</span>
                                       </div>
                                    </div>
									  <div class="control-group">
                                       <label class="control-label">Addr Line3</label>
                                       <div class="controls">
                                          <input type="text" placeholder="" tabindex="4" class="m-wrap large" name="fAddr3" data-required="1" value="<?php echo (!empty($edit_result['addr3'])? $edit_result['addr3']:$aRequest['fAddr3']);?>"/>
                                          <span class="help-inline">Enter Vendor Address3</span>
                                       </div>
                                    </div>
															
									
									<div class="control-group">
                                       <label class="control-label">City</label>
                                       <div class="controls">
									 
                                          <select class="large m-wrap" tabindex="1" name="fCityId" id="fCityId">
										     <option value="0">Choose the City</option>
											 <?php
											  $aCityList = $oMaster->getCityList();
											  foreach($aCityList as $aCity)
											  {
			  
											 ?>
                                             <option value="<?php echo $aCity['id_city']; ?>" <?php if((!empty($edit_result['id_city'])? $edit_result['id_city']:$aRequest['fCityId']) == $aCity['id_city']) { echo 'selected=selected' ;}?>><?php echo $aCity['city_name']; ?></option>
                                             <?php
											  }
											 ?>
                                          </select>
										    <span><a href="#" class="contact" title="Add New City"><i class="icon-plus-sign" style="color:#009900;"></i></a></span>
                                       </div>
                                    </div>
									
									<div class="control-group">
                                       <label class="control-label">State</label>
                                       <div class="controls">
                                          <select class="large m-wrap" tabindex="1" name="fStateId" id="fStateId">
										  <option value="0">Choose the State</option> 
											 <?php
											  $aStateList = $oMaster->getStateList();
											  foreach($aStateList as $aState)
											  {
			  
											 ?>
                                             <option value="<?php echo $aState['id_state']; ?>" <?php if((!empty($edit_result['id_state'])? $edit_result['id_state']:$aRequest['fStateId']) == $aState['id_state']) { echo 'selected=selected' ;}?>><?php echo $aState['state_name']; ?></option>
                                             <?php
											  }
											 ?>
                                          </select>
										   <span><a href="#" class="state" title="Add New State"><i class="icon-plus-sign" style="color:#009900;"></i></a></span>
                                       </div>
                                    </div>
									
									 <div class="control-group">
                                       <label class="control-label">Country</label>
                                       <div class="controls">
                                          <select class="large m-wrap" tabindex="1" name="fCountryId" id="fCountryId">
										   <option value="0">Choose the Country</option>
											 <?php
											  $aCountryList = $oMaster->getCountryList();
											  foreach($aCountryList as $aCountry)
											  {
			  
											 ?>
                                             <option value="<?php echo $aCountry['id_country']; ?>" <?php if((!empty($edit_result['id_country'])? $edit_result['id_country']:$aRequest['fCountryId']) == $aCountry['id_country']) { echo 'selected=selected' ;}?>><?php echo $aCountry['country_name']; ?></option>
                                             <?php
											  }
											 ?>
                                          </select>
										   <span><a href="#" class="country" title="Add New Country"><i class="icon-plus-sign" style="color:#009900;"></i></a></span>
                                       </div>
                                    </div>
									
									 <div class="control-group">
                                       <label class="control-label">Pincode<span class="required">*</span></label>
                                       <div class="controls">
                                          <input type="text" placeholder="" class="m-wrap large" name="fZipCode" data-required="1" value="<?php echo (!empty($edit_result['zipcode'])? $edit_result['zipcode']:$aRequest['fZipCode']);?>"/>
                                          <span class="help-inline">Enter Pincode</span>
                                       </div>
                                    </div>
									
									 <div class="control-group">
                                       <label class="control-label">Telphone<span class="required">*</span></label>
                                       <div class="controls">
                                          <input type="text" placeholder="" class="m-wrap large" name="fPhone" data-required="1" value="<?php echo (!empty($edit_result['phone'])? $edit_result['phone']:$aRequest['fPhone']);?>"/>
                                          <span class="help-inline">Enter Phone number</span>
                                       </div>
                                    </div>
									
									 <div class="control-group">
                                       <label class="control-label">Fax</label>
                                       <div class="controls">
                                          <input type="text" placeholder="" class="m-wrap large" name="fFax" data-required="1" value="<?php echo (!empty($edit_result['fax'])? $edit_result['fax']:$aRequest['fFax']);?>"/>
                                          <span class="help-inline">Enter Fax Number</span>
                                       </div>
                                    </div>
									
									 <div class="control-group">
                                       <label class="control-label">Email</label>
                                       <div class="controls">
                                          <input type="text" placeholder="" class="m-wrap large" name="fEmail" data-required="1" value="<?php echo (!empty($edit_result['email'])? $edit_result['email']:$aRequest['fEmail']);?>"/>
                                          <span class="help-inline">Enter Email Id</span>
                                       </div>
                                    </div>
																		
									
									 <div class="control-group">
                                       <label class="control-label">Status</label>
                                       <div class="controls">
                                          <label class="radio line">
                                          <input type="radio" name="fStatus" value="1" <?php if((!empty($edit_result['status'])? $edit_result['status']:$aRequest['fStatus']) === '1') { echo 'checked=checked' ;}?> />
                                          Active
                                          </label>
                                          <label class="radio line">
                                          <input type="radio" name="fStatus" value="0" <?php if((!empty($edit_result['status'])? $edit_result['status']:$aRequest['fStatus']) == '0') { echo 'checked=checked' ;}?> />
                                          In-Active
                                          </label>  
										  <div id="form_2_membership_error"></div> 
                                       </div>
                                    </div>
                                 
									
                                    <div class="form-actions">
                                   <?php if($aRequest['action'] == 'Add')
								   {
								   ?>
                                   <button type="submit" class="btn blue" name="send"><i class="icon-ok"></i>Add Contact</button>   
                                     <input type="hidden" name="fVendorId" value="<?php echo $oSession->getSession('sesVendorId');?>"/>                       
								   <?php
								   } else {
								   ?>
                                    <button type="submit" class="btn blue" name="Update"><i class="icon-ok"></i>Update Contact</button> 
                                      <input type="hidden" name="fContactId" value="<?php echo $aRequest['fContactId'];?>"/>
                                   <?php
								   } 
								   ?>
								   <button type="button" class="btn">Cancel</button>
                                    </div>
                                 </form>
                               
                        <!-- END FORM-->           
                     </div>
                  </div>
                  <!-- END SAMPLE FORM PORTLET-->
                
               </div>
            </div>
            <!-- END PAGE CONTENT-->         
         </div>
         <!-- END PAGE CONTAINER-->
      </div>
      <!-- END PAGE -->  
   </div>
   <!-- END CONTAINER -->
	<?php include_once 'Footer1.php'; ?>
</body>
<!-- END BODY -->
</html>