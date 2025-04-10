// 
// codeunit 70100 eprocurement
// {

//     trigger OnRun()
//     begin
//         FnResetPassword('francismutua664@gmail.com');

//     end;

//     var
//         Contact: Record Contact;
//         QuotationsEvaluation: Record "Quotations Evaluation";
//         objFiscalYear: Record "Financial Year Code";
//         Bidders: Record Bidders;
//         objPortalUsers: Record portalusers;
//         objProcReqs: Record "Procurement Request";
//         objBlogPost: Record Blog_Vendors;
//         objBlogReply: Record BlogVendors_Replies;
//         FILESPATH: label '\\41.89.63.253\Downloads30\';
//         objVendor: Record Vendor;
//         objPRLines: Record "Procurement Request Lines";
//         objSuppSelection: Record "Supplier Selection1";
//         objDocAttachedTbl: Record "Document Attachment";
//         objVendorBank: Record "Vendor Bank Account";
//         objDirectors: Record "Vendor Business Owner";
//         objLitigHistory: Record "Vendor Litigation History";
//         tbl_bidLitigationHistory: Record "Bid Litigation History";
//         objEmailsendCodeunit: Codeunit "Procurement Processing";
//         objNoSeriesManagement: Codeunit NoSeriesManagement;
//         objProcsetup: Record "Procurement Setup";
//         objVendorSpecGentry: Record "Vendor Special Group Entry";
//         objPastXp: Record "Vendor Past Experience";
//         objBidResponseBalanceSheet: Record "Bid Audited Balance Sheet";
//         objBalanceSheet: Record "Vendor Audited Balance Sheet";
//         objPastExperience: Record "Bid Past Experience";
//         objIncomeStatement: Record "Vendor Audited Income Statemen";
//         objPurhcaseLinesDetails: Record "Purchase Line";
//         objBidResponseIncomeStatement: Record "Bid Audited Income Statement";
//         objFiledUploads: Record "Vendor Filed Reg Document";
//         objBidResponseEquipments: Record "Bid Equipment Specification";
//         objProfstaff: Record "Vendor Professional Staff";
//         objStaffQualif: Record "Vendor Staff Qualification";
//         objStaffXP: Record "Vendor Staff Experience";
//         objRFIResponse: Record "RFI Response";
//         objIFPResponseLine: Record "IFP Response Line";
//         ProcurementSetup: Record "Procurement Setup";
//         NoMgt: Codeunit NoSeriesManagement;
//         objRFIrespFiledDocument: Record "RFI Response Filed Document";
//         objBidScoreCriteria: Record "Bid Score Criteria Group";
//         Purch: Record "Purchase Header";
//         Vendor: Record Vendor;
//         BidOwner: Record "Bid Business Owner";
//         VendBusinessOwner: Record "Vendor Business Owner";
//         BidPreferences: Record "Bid Preference & Reservation";
//         VendSpecialGroup: Record "Vendor Special Group Entry";
//         BidLitigation: Record "Bid Litigation History";
//         VendLitigation: Record "Vendor Litigation History";
//         BidPastExperience: Record "Bid Past Experience";
//         VendPastExperience: Record "Vendor Past Experience";
//         BidAuditedBal: Record "Bid Audited Balance Sheet";
//         VendAuditedBal: Record "Vendor Audited Balance Sheet";
//         BidIncomeStat: Record "Bid Audited Income Statement";
//         VendIncomeStat: Record "Vendor Audited Income Statemen";
//         BidVendBankAccount: Record "Bid Vendor Bank Account";
//         VendBankAccount: Record "Vendor Bank Account";
//         BidKeyStaff: Record "Bid Key Staff";
//         VendKeyStaff: Record "Vendor Professional Staff";
//         BidKeyStaffQual: Record "Bid Key Staff Qualification";
//         VendKeyStaffQual: Record "Vendor Staff Qualification";
//         BidStaffExperience: Record "Bid Key Staff Experience";
//         VendStaffExperience: Record "Vendor Staff Experience";
//         IFS: Record "Standard Purchase Code";
//         IFSLines: Record "Standard Purchase Line";
//         PurchLines: Record "Purchase Line";
//         objTenderSecurity: Record "Bid_Contract Security Register";
//         objVendorSpecialGroup: Record "Vendor Special Group Entry";
//         ExecutionPlanNumber: Code[50];
//         FILESPATH3: label 'E:\TESTINGREPORT\';
//         FILESPATH4: label 'C:\inetpub\wwwroot\Procurement\Downloads\';
//         ProjectMobilizationHeader: Record "Project Mobilization Header";
//         ApprovalsMgmt: Codeunit "Approvals Mgmt.";
//         FILEPATHT: label 'C:\inetpub\wwwroot\Judiciary\';
//         Rec: Variant;
//         // RMSManagement: Codeunit "RMS Management";
//         FILESPATH5: label 'C:\inetpub\wwwroot\eprocurement\Downloads\';
//         dur: DateFormula;
//         FilePathUploads: label 'C:\inetpub\wwwroot\Judiciaryrms\Uploads\';
//         DMSManagement: Codeunit "DMS Management";
//         DMSDocuments: Record "DMS Documents";
//         ProcurementProcessing: Codeunit "Procurement Processing";
//         RecordIDNumber: RecordID;
//         RoadManagementSetup: Record "Road Management Setup";
//         NoSeriesManagement: Codeunit NoSeriesManagement;
//         CompInfo: Record "Company Information";

//     procedure FnRegisterVendor(vendorName: Code[100]; supplierCategory: Code[20]; country: Code[10]; postAddress: Text; postCode: Code[20]; phoneNumber: Code[20]; emailAddress: Text; kraPin: Code[20]; taxCompliance: Code[100]; password: Text; confirmPassword: Text) status: Text
//     begin
//         status := 'danger*Your account could not be created. Please try again later';
//         if not (password = confirmPassword) then begin
//             status := 'danger*Password does not match confirm password. Please enter again';
//         end else
//             if StrLen(password) < 4 then begin
//                 status := 'danger*Password is too short. Minimum four(4) characters. Please enter again!';
//             end
//             else begin
//                 Contact.Reset;
//                 Contact.SetRange("E-Mail", emailAddress);
//                 Contact.SetRange("Applicant Type", Contact."Applicant Type"::"E-Procurment");
//                 if Contact.FindSet then begin
//                     status := 'danger*Another vendor with the given email address exists!';
//                 end else begin
//                     Contact.Init;
//                     Contact.Name := vendorName;
//                     Contact."Country/Region Code" := country;
//                     Contact.Address := postAddress;
//                     Contact."Post Code" := postCode;
//                     Contact.Validate("Post Code");
//                     Contact."Phone No." := phoneNumber;
//                     Contact."E-Mail" := emailAddress;
//                     Contact."KRA PIN" := kraPin;
//                     // Amos -- Added this to help account creation for different purposes within the Contact Table
//                     Contact."Applicant Type" := Contact."Applicant Type"::"E-Procurment";
//                     Contact."Tax Compliance Certificate No" := taxCompliance;
//                     Contact."Entity Type" := Contact."entity type"::Organization;
//                     Contact.password := password;
//                     if Contact.Insert(true) then begin
//                         FnCreateApplicantAccountRequest(Contact."E-Mail");
//                         FnSendEmaiNotificationOnApplicantRegRequestAcknowledge(Contact);
//                         FnSendEmaiNotificationOnApplicantAccountActivation(Contact);
//                         //success insert into contact
//                         /* objPortalUsers.RESET;
//                          objPortalUsers.SETRANGE("customer No", Contact."No.");
//                          IF objPortalUsers.FINDSET THEN
//                            BEGIN
//                               status:='danger*The username already exist!';
//                              END ELSE BEGIN
//                                objPortalUsers.INIT;
//                                objPortalUsers."customer No":=Contact."No.";
//                                objPortalUsers.Password:= Contact.password;
//                                objPortalUsers.Email:=Contact."E-Mail";
//                                objPortalUsers.IDNoorRegNo:=Contact."ID Number";
//                                IF objPortalUsers.INSERT(TRUE) THEN
//                                  //success insert into portal users
//                                  BEGIN
//                                    status:='success*Your vendor account was successfully created. Please log in to complete your profile!';
//                                  END
//                                    ELSE BEGIN
//                                       status:='danger*Error!, unknown error occured while saving, contact main office';
//                                    END
//                               END
//                            END
//                        ELSE BEGIN
//                          status:='danger*Error!, unknown error occured, contact main office';
//                        END
//                  END;
//              END;
//              EXIT(status);*/
//                         status := 'success*Your vendor account was successfully. Please log in to complete your profile!';
//                     end else begin
//                         status := 'danger*Error!, contact main office.Kindly Contact System Administrator';
//                     end;
//                 end;
//             end;
//         exit(status);

//     end;

//     procedure resetPass(emailAddress: Text) status: Text
//     var
//         emailvalidations: Record emailvalidations;
//         password: Integer;
//         error: Boolean;
//         emailvalidations2: Record emailvalidations;
//         message: Text;
//     begin
//         status := 'Reset Password Unsuccessful*We could not reset your password. Please try again later*error';
//         error := false;
//         Contact.Reset;
//         Contact.SetRange("E-Mail", emailAddress);
//         if Contact.FindSet then begin
//             emailvalidations.Reset;
//             emailvalidations.SetRange(user, Contact."No.");
//             emailvalidations.SetRange(used, false);
//             if emailvalidations.FindSet then begin
//                 emailvalidations.used := true;
//                 emailvalidations.Modify(true);
//                 Commit;
//             end;
//             while not error do begin
//                 password := Random(9999999);
//                 if password > 999999 then
//                     error := true;
//             end;
//             if error then begin
//                 emailvalidations2.Init;
//                 emailvalidations2.user := Contact."No.";
//                 emailvalidations2.generatedAt := CurrentDatetime;
//                 emailvalidations2.key := Format(password);
//                 emailvalidations2.Email := Contact."E-Mail";
//                 emailvalidations2.used := false;
//                 if emailvalidations2.Insert(true) then begin
//                     message := 'Dear <strong>' + Contact.Name + '</strong>, <br/> We have received your password reset request. <br/> <a href="http://localhost:56572/Activate?userCode=' + emailvalidations2.user + '&&key=' + emailvalidations2.key;
//                     message += '"> Please click here to complete your request.</a> <br/> <br/> This link will expire in 30 minutes';
//                     sendEmail(Contact."E-Mail", 'Password Reset Request', message);
//                     status := 'Reset Password Successful*Your request to reset your password was successful. Please follow the instructions sent to your email*success';
//                 end else begin
//                     status := 'Reset Password Unsuccessful*We could not reset your password. Please try again later*error';
//                 end;

//             end;
//         end else begin
//             status := 'Reset Password Unsuccessful*A user with the given email address does not exist. Please try again later*error';
//         end;
//         exit(status);
//     end;

//     procedure FnApplyPreQualification(contactNo: Code[20]; supplierCategory: Code[50]) status: Text
//     var
//         PrequalifiedSuppliers1: Record "Prequalified Suppliers1";
//     begin
//         Contact.Reset;
//         Contact.SetRange("No.", contactNo);
//         if Contact.FindSet then begin
//             PrequalifiedSuppliers1.Reset;
//             PrequalifiedSuppliers1.SetRange("Contact No", contactNo);
//             PrequalifiedSuppliers1.SetRange(Category, supplierCategory);
//             if PrequalifiedSuppliers1.FindSet then begin
//                 status := 'danger*Your have already applied for prequalification in this category!';
//             end else begin
//                 PrequalifiedSuppliers1.Init;
//                 PrequalifiedSuppliers1."Contact No" := contactNo;
//                 PrequalifiedSuppliers1.Validate("Contact No");
//                 PrequalifiedSuppliers1.Category := supplierCategory;
//                 PrequalifiedSuppliers1.Validate(Category);

//                 if PrequalifiedSuppliers1.Insert(true) then begin
//                     status := 'success*Your registration for prequalification has been received!';
//                 end else begin
//                     status := 'danger*Your application for PreQualification was unsuccessful. Please try again later!';
//                 end;
//             end;
//         end else begin
//             status := 'danger*Account Error, Kindly contact Nacosti Office for Assistance!';
//         end;
//         exit(status);
//     end;

//     procedure FnApplyPreQualificationsDetails(contactNo: Code[20]; supplierCategory: Code[50]) status: Text
//     var
//         PrequalifiedSuppliers1: Record "Prequalified Suppliers1";
//     begin
//         Contact.Reset;
//         Contact.SetRange("No.", contactNo);
//         if Contact.FindSet then begin
//             PrequalifiedSuppliers1.Reset;
//             PrequalifiedSuppliers1.SetRange("Contact No", contactNo);
//             PrequalifiedSuppliers1.SetRange(Category, supplierCategory);
//             if PrequalifiedSuppliers1.FindSet then begin
//                 status := 'danger*Your have already applied for prequalification in this category!';
//             end else begin
//                 PrequalifiedSuppliers1.Init;
//                 PrequalifiedSuppliers1."Contact No" := contactNo;
//                 PrequalifiedSuppliers1.Validate("Contact No");
//                 PrequalifiedSuppliers1.Category := supplierCategory;
//                 PrequalifiedSuppliers1.Validate(Category);

//                 if PrequalifiedSuppliers1.Insert(true) then begin
//                     status := 'success*Your registration for prequalification has been received!';
//                 end else begin
//                     status := 'danger*Your application for PreQualification was unsuccessful. Please try again later!';
//                 end;
//             end;
//         end else begin
//             status := 'danger*Account Error, Kindly contact Nacosti Office for Assistance!';
//         end;
//         exit(status);
//     end;

//     procedure getCurrentYear(): Code[50]
//     var
//         PurchasesPayablesSetup: Record "Purchases & Payables Setup";
//     begin
//         if PurchasesPayablesSetup.Get() then
//             exit(PurchasesPayablesSetup."Current Year");
//     end;

//     procedure fnApplyRFQ(contactNo: Code[50]; quantity: Decimal; amount: Decimal; rfqNo: Code[50]; email: Text; vendorNo: Code[50]) status: Text
//     var
//         TenderBids: Record "Tender Bids";
//     begin
//         TenderBids.Reset;
//         TenderBids.SetRange("Bidder Email", email);
//         TenderBids.SetRange("Requisition No", rfqNo);
//         if TenderBids.FindSet then begin
//             status := 'danger*You have already applied in the chosen RFQ!';
//         end else begin
//             TenderBids.Init;
//             TenderBids.contactNo := contactNo;
//             TenderBids.Validate(contactNo);
//             TenderBids."Requisition No" := rfqNo;
//             TenderBids.Validate("Requisition No");
//             TenderBids.Quantity := quantity;
//             TenderBids."Unit Price" := amount;
//             TenderBids.Validate("Unit Price");
//             TenderBids."Vendor No" := vendorNo;
//             if TenderBids.Insert(true) then begin
//                 status := 'success*Your submission for RFQ has been received!';
//             end else begin
//                 status := 'danger*Snaap! Unknown error occured, contact NACOSTI Office!';
//             end;
//         end;
//         exit(status);
//     end;

//     procedure applyRFQOLD(contactNo: Code[50]; password: Text; quantity: Decimal; amount: Decimal; rfqNo: Code[50]) status: Text
//     begin
//         status := 'RFQ Application Unsuccessful*Your application for RFQ was not successful*error';
//         Contact.Reset;
//         Contact.SetRange("No.", contactNo);
//         Contact.SetRange(password, password);
//         if not Contact.FindSet then begin
//             status := 'RFQ Application Unsuccessful*An account with the given credentials does not exist*error';
//         end else begin
//             QuotationsEvaluation.Reset;
//             QuotationsEvaluation.SetRange("Contact No", contactNo);
//             QuotationsEvaluation.SetRange("Ref No.", rfqNo);
//             if QuotationsEvaluation.FindSet then begin
//                 status := 'Duplicate RFQ*You have already applied in the chosen RFQ*error';
//             end else begin
//                 QuotationsEvaluation.Init;
//                 QuotationsEvaluation."Contact No" := contactNo;
//                 QuotationsEvaluation.Validate("Contact No");
//                 QuotationsEvaluation."Ref No." := rfqNo;
//                 QuotationsEvaluation.Validate("Ref No.");
//                 QuotationsEvaluation."Minimum Order Amount" := amount;
//                 QuotationsEvaluation."Minimum Order Quantity" := quantity;
//                 if QuotationsEvaluation.Insert(true) then begin
//                     status := 'RFQ Application Received*Your application for RFQ has been received*success';
//                 end else begin
//                     status := 'RFQ Application Unsuccessful*Your application for RFQ was not successful*error';
//                 end;
//             end;
//         end;
//         exit(status);
//     end;

//     procedure sendEmail(recipient: Text; title: Text; message: Text): Boolean
//     var
//         objMail: Codeunit Mail;
//         SMTPMailSetup: Record "Email Account";
//     begin
//         SMTPMailSetup.Get;
//         //  objMail.CreateMessage(SMTPMailSetup."Email Sender Name",SMTPMailSetup."Email Address", recipient, title, message, true);
//         // objMail.Send();
//     end;

//     procedure FnAddVendorSpecialGroupDetails(vendorNo: Code[100]; agpocertno: Code[10]; registeredspecialgroup: Code[10]; productservicecategory: Text; certeffectivedate: Date; certexpirydate: Date) status: Text
//     begin

//         objVendorSpecialGroup.Reset;
//         objVendorSpecialGroup.SetRange("Certifcate No", agpocertno);
//         if objVendorSpecialGroup.FindSet then begin
//             objVendorSpecialGroup."Certifcate No" := agpocertno;
//             objVendorSpecialGroup."Vendor Category" := registeredspecialgroup;
//             objVendorSpecialGroup."Vendor No" := vendorNo;
//             objVendorSpecialGroup."Registered Special Group" := registeredspecialgroup;
//             objVendorSpecialGroup."Products/Service Category" := productservicecategory;
//             objVendorSpecialGroup."Certificate Expiry Date" := certexpirydate;
//             objVendorSpecialGroup."Effective Date" := certeffectivedate;
//             if objVendorSpecialGroup.Modify(true) then begin
//                 status := 'success*The Certificate Details was successfully updated';
//             end else begin
//                 status := 'danger*The Certificate Details was not successfully inserted';
//             end;
//         end else begin
//             objVendorSpecialGroup.Init;
//             objVendorSpecialGroup."Vendor Category" := registeredspecialgroup;
//             objVendorSpecialGroup."Certifcate No" := agpocertno;
//             objVendorSpecialGroup."Vendor No" := vendorNo;
//             objVendorSpecialGroup."Registered Special Group" := registeredspecialgroup;
//             objVendorSpecialGroup."Products/Service Category" := productservicecategory;
//             objVendorSpecialGroup."Certificate Expiry Date" := certexpirydate;
//             objVendorSpecialGroup."Effective Date" := certeffectivedate;
//             if objVendorSpecialGroup.Insert(true) then begin
//                 status := 'success*The Certificate Details was successfully Inseted';
//             end else begin
//                 status := 'danger*The Certificate Details was not successfully inserted';
//             end;
//             exit(status);
//         end;
//     end;

//     procedure activateAccount(userCode: Code[100]; "key": Text; password: Text; confirmpassword: Text) status: Text
//     var
//         emailvalidations: Record emailvalidations;
//         error: Boolean;
//         duration: Decimal;
//     begin
//         status := 'Reseting password Unsuccessful*Your request to reset your password failed. Please try again*error';
//         error := false;
//         if StrLen(password) < 4 then begin
//             error := true;
//             status := 'Reseting password Unsuccessful*Your chosen password is too short. It should be at least 4 characters*error';
//         end;
//         if not (password = confirmpassword) then begin
//             error := true;
//             status := 'Reseting password Unsuccessful*Password does not match confirm password*error';
//         end;


//         if not error then begin
//             emailvalidations.Reset;
//             emailvalidations.SetRange(user, userCode);
//             emailvalidations.SetRange(key, key);
//             //emailvalidations.SETRANGE(used, FALSE);
//             if emailvalidations.FindSet then begin
//                 if emailvalidations.used then begin
//                     status := 'Reseting password Unsuccessful*The given passkey has already been used. Please try resetting the password again*error';
//                 end else begin
//                     duration := CurrentDatetime - emailvalidations.generatedAt;
//                     duration := (duration / 60000);
//                     if (duration > 30) then begin
//                         status := 'Reseting password Unsuccessful*The given passkey has expired. Please try resetting the password again*error';
//                     end else begin
//                         Contact.Reset;
//                         Contact.SetRange("No.", userCode);
//                         if Contact.FindSet then begin
//                             Contact.password := password;
//                             if Contact.Modify(true) then begin
//                                 emailvalidations.used := true;
//                                 emailvalidations.Modify(true);
//                                 status := 'Reseting Password Successful*Your password was successfully updated. Please proceed to log in*success';

//                             end else begin
//                                 status := 'Reseting password Unsuccessful*Your password could not be updated. Please try again*error';
//                             end;
//                         end else begin
//                             status := 'Reseting password Unsuccessful*An account with the given credentials does not exist*error';
//                         end;
//                     end;
//                 end;
//             end else begin
//                 status := 'Reseting password Unsuccessful*A request with the given pass key does not exist. Please try resetting the password again*error';
//             end;
//         end;
//         exit(status);
//     end;

//     procedure FnAddDirectors(contactNo: Code[100]; directorFullname: Text) status: Text
//     begin
//         Contact.Reset;
//         Contact.SetRange("No.", contactNo);
//         if Contact.FindSet then begin
//             Contact."Director 1 Name" := directorFullname;
//             if Contact.Modify(true) then begin
//                 status := 'success*The director successfully updated';
//             end else begin
//                 status := 'danger*Unknown error occured, could not update!';
//             end;
//         end else begin
//             status := 'danger*User not available';
//         end;
//         exit(status);
//     end;

//     procedure FnApplyforTender(tenderNo: Code[50]; vendorNo: Code[50]; Email: Text[100]) status: Text
//     begin
//         Bidders.Reset;
//         Bidders.SetRange("Ref No.", tenderNo);
//         Bidders.SetRange("E-mail", Email);
//         if Bidders.FindSet then begin
//             status := 'danger*You have already applied for this tender!'
//         end else begin
//             Bidders.Init;
//             Bidders."Vendor No" := vendorNo;
//             Bidders.Validate("Vendor No");
//             Bidders."E-mail" := Email;
//             Bidders."Ref No." := tenderNo;
//             if Bidders.Insert(true) then begin
//                 status := 'success*Your bid placed successfully!'
//             end else begin
//                 status := 'danger*Snaap! Unknown error occured, contact NACOSTI Office'
//             end
//         end;
//         exit(status);
//     end;

//     procedure fnCountOpenTenders() myCount: Integer
//     begin
//         objProcReqs.Reset;
//         objProcReqs.SetRange("Process Type", objProcReqs."process type"::Tender);
//         objProcReqs.SetRange(Status, objProcReqs.Status::Open);
//         if objProcReqs.FindSet then begin
//             myCount := objProcReqs.Count;
//         end else begin
//             myCount := 0;
//         end
//     end;

//     procedure fnCountAppliedTenders(vendorNo: Code[30]) myCount: Integer
//     begin
//         Bidders.Reset;
//         Bidders.SetRange("Vendor No", vendorNo);
//         if Bidders.FindSet then begin
//             myCount := Bidders.Count;
//         end else begin
//             myCount := 0;
//         end
//     end;

//     procedure fnCountTendersAwarded(vendorNo: Code[30]) myCount: Integer
//     begin
//         Bidders.Reset;
//         Bidders.SetRange("Vendor No", vendorNo);
//         Bidders.SetRange(Successful, true);
//         if Bidders.FindSet then begin
//             myCount := Bidders.Count;
//         end else begin
//             myCount := 0;
//         end
//     end;

//     procedure FnApplyforOpenTender(tenderNo: Code[50]; amount: Decimal; contactNo: Code[50]; Email: Text[100]) status: Text
//     begin
//         //  Bidders.RESET;
//         //  Bidders.SETRANGE("Ref No.", tenderNo);
//         //  Bidders.SETRANGE("E-mail", Email);
//         //
//         // IF Bidders.FINDSET THEN BEGIN
//         //  status:= 'danger*You have already applied for this tender!'
//         //  END ELSE BEGIN
//         //     Bidders.INIT;
//         //     Bidders."Vendor No":= contactNo;
//         //     Bidders.VALIDATE("Contact No");
//         //     Bidders."E-mail":=Email;
//         //     Bidders."Ref No.":=tenderNo;
//         //     Bidders."Tender Amount":= amount;
//         //
//         //    IF Bidders.INSERT(TRUE) THEN
//         //      BEGIN
//         //         status:= 'success*Your bid placed successfully!'
//         //      END ELSE BEGIN
//         //          status:= 'danger*Snaap! Unknown error occured, contact NACOSTI Office'
//         //      END
//         //  END;
//         // EXIT(status);
//     end;

//     procedure FnInsertBlog(blogTitle: Text[250]; blogBody: Text[250]; dirNo: Code[20]; dirName: Text) insertStatus: Text
//     begin
//         objBlogPost.Reset;
//         objBlogPost.SetRange("Blog Title", blogTitle);
//         if objBlogPost.Find('+') then begin
//             insertStatus := 'danger*The forum Title already exists, kindly reply on it!';
//         end
//         else begin
//             objBlogPost.Init;
//             objBlogPost."Blog Title" := blogTitle;
//             objBlogPost."Blog Body" := blogBody;
//             objBlogPost."Created ByVendorNo" := dirNo;
//             objBlogPost."Created ByVendorName" := dirName;
//             objBlogPost."Date Created" := Today;
//             objBlogPost."Time Created" := Time;

//             if objBlogPost.Insert = true then begin
//                 insertStatus := 'success*Forum created successfully, kindly follow up on replies';
//             end else begin
//                 insertStatus := 'danger*Error occured, forum could not be created!';
//             end
//         end
//     end;

//     procedure FnInsertBlogReply(blogReply: Text[250]; dirNo: Code[20]; dirName: Text; blogId: Integer) insertStatus: Text
//     begin
//         objBlogReply.Init;
//         objBlogReply.BlogIdCode := blogId;
//         objBlogReply."Blog Reply" := blogReply;
//         objBlogReply."Replier VendorNo" := dirNo;
//         objBlogReply."Replier Name" := dirName;
//         objBlogReply."Date Replied" := Today;
//         objBlogReply."Time Replied" := Time;

//         if objBlogReply.Insert = true then begin
//             insertStatus := 'success*Your reply successfully send';
//         end else begin
//             insertStatus := 'danger*Error occured, reply could not be created!';
//         end
//     end;

//     procedure FnChangePassword(emailaddress: Text; currentPassword: Text; newPassword: Text; confirmNewPassword: Text) status: Text
//     var
//         DynasoftPortalUser: Record "Dynasoft Portal User";
//     begin

//         DynasoftPortalUser.Reset;
//         DynasoftPortalUser.SetRange("Authentication Email", emailaddress);
//         if DynasoftPortalUser.FindSet then begin
//             if DynasoftPortalUser."Password Value" = currentPassword then begin
//                 if newPassword = confirmNewPassword then begin
//                     DynasoftPortalUser."Password Value" := newPassword;
//                     DynasoftPortalUser."Change Password" := true;
//                     DynasoftPortalUser."Last Modified Date" := Today;
//                     if DynasoftPortalUser.Modify(true) then begin
//                         status := 'success*Your password was successfully changed';
//                     end else begin
//                         status := 'danger*Your password could not be reset';
//                     end;
//                 end else begin
//                     status := 'passwordmismatch*New password and Confirmed new password do not match';
//                 end;
//             end else begin
//                 status := 'worngcurrentpassword*Wrong current password.Kindly Ensure that the Current Password is Correct';
//             end;
//         end else begin
//             status := 'novendorfound*The specified Email Address does not exist';
//         end;
//     end;

//     procedure FnEditProfile(email: Text; fullname: Text; kraPin: Code[20]; taxtPin: Code[20]; phoneNo: Code[20]) status: Text
//     begin
//         Contact.Reset;
//         Contact.SetRange("E-Mail", email);
//         if Contact.FindSet then begin
//             Contact.Name := fullname;
//             Contact."KRA PIN" := kraPin;
//             Contact."Tax Compliance Certificate No" := taxtPin;
//             Contact."Phone No." := phoneNo;
//             if Contact.Modify then begin
//                 status := 'success*Profile modified successfully!'
//             end
//             else begin
//                 status := 'danger*Profile modification failed!'
//             end
//         end else begin
//             status := 'danger*user nor found';
//         end
//     end;

//     procedure FnResetPassword(emailaddress: Text) passChangestatus: Text
//     var
//         DynasoftPortalUser: Record "Dynasoft Portal User";
//         RandomDigit: Text;
//         Body: Text;
//     begin
//         DynasoftPortalUser.Reset;
//         DynasoftPortalUser.SetRange("Authentication Email", emailaddress);
//         if DynasoftPortalUser.FindSet then begin
//             RandomDigit := CreateGuid;
//             RandomDigit := DelChr(RandomDigit, '=', '{}-01');
//             RandomDigit := CopyStr(RandomDigit, 1, 8);
//             DynasoftPortalUser."Password Value" := RandomDigit;
//             DynasoftPortalUser."Last Modified Date" := Today;
//             DynasoftPortalUser."Change Password" := false;
//             if DynasoftPortalUser.Modify(true) then begin
//                 passChangestatus := 'success*Password Reset Successfully. Kindly check your email address';
//                 ResetSendEmail(emailaddress);
//             end else begin
//                 passChangestatus := 'danger*The Password was Not Modified';
//             end;
//         end else begin
//             passChangestatus := 'emailnotfound*Email Address is Missing';
//         end;
//     end;

//     procedure FnGenerateVendorstatement(vendorNo: Code[20]; startDate: Date; endDate: Date) status: Text
//     begin
//         objVendor.Reset;
//         objVendor.SetRange(objVendor."No.", vendorNo);
//         if objVendor.FindSet then begin
//             // objVendor.SETFILTER(objVendor."Date Filter", FORMAT(FORMAT(startDate)  +'..'+ FORMAT(endDate)));

//             // if FILE.Exists(FILESPATH + '\Statements\' + Format(vendorNo) + '.pdf') then begin
//             //     FILE.Erase(FILESPATH + '\Statements\' + Format(vendorNo) + '.pdf');
//             //     Report.SaveAsPdf(304, FILESPATH + '\Statements\' + Format(vendorNo) + '.pdf');
//             //     status := 'success*Downloads30\Statements\' + Format(vendorNo) + '.pdf';
//             // end
//             // else begin
//             status := 'danger*Error generating vendor Report!';
//             Error(status);
//             // end
//         end
//         else begin
//             status := 'danger*Vendor number not found!';
//         end;
//     end;

//     procedure FnGenerateRfQDocument(vendorNo: Code[20]; rfQNo: Code[50]) status: Text
//     begin
//         objVendor.Reset;
//         objVendor.SetRange(objVendor."No.", vendorNo);
//         if objVendor.FindSet then begin
//             // objVendor.SETFILTER(objVendor."Date Filter", FORMAT(FORMAT(startDate)  +'..'+ FORMAT(endDate)));

//             // if FILE.Exists(FILESPATH + '\RFQs\' + Format(vendorNo) + '.pdf') then begin
//             //     FILE.Erase(FILESPATH + '\RFQs\' + Format(vendorNo) + '.pdf');
//             //     Report.SaveAsPdf(70002, FILESPATH + '\RFQs\' + Format(vendorNo) + '.pdf');
//             //     status := 'success*Downloads30\RFQs\' + Format(vendorNo) + '.pdf';
//             // end
//             // else begin
//             status := 'danger*Error generating vendor Report!';
//             Error(status);
//             // end
//         end
//         else begin
//             status := 'danger*Vendor number not found!';
//         end;
//     end;

//     procedure fnAddPurchaseReqLine(reqNo: Code[30]; itemNo: Code[30]; quantity: Decimal; unitPrice: Decimal; vendorNo: Code[30]; lineNo: Integer; type: Option) insertStatus: Text
//     begin
//         objPRLines.Reset;
//         objPRLines.SetRange("Vendor No", vendorNo);
//         objPRLines.SetRange(No, itemNo);
//         if objPRLines.FindSet then begin
//             insertStatus := 'danger*You have already applied for that Item';
//         end
//         else begin
//             objPRLines.Init;
//             objPRLines."Requisition No" := reqNo;
//             //  IF objPRLines.FINDLAST THEN
//             //    objPRLines."Line No":=objPRLines."Line No"+1000;
//             objPRLines.Validate("Requisition No");
//             objPRLines.No := itemNo;
//             objPRLines.Validate(No);
//             objPRLines.Quantity := quantity;
//             objPRLines."Unit Price" := unitPrice;
//             objPRLines.Validate("Unit Price");
//             objPRLines."Vendor No" := vendorNo;
//             objPRLines."Order Date" := Today;
//             objPRLines.Type := type;

//             if objPRLines.Insert(true) then begin
//                 insertStatus := 'success*Your Application successfully submitted!';
//             end else begin
//                 insertStatus := 'danger*Error occured while submitting your request!';
//             end
//         end
//     end;

//     procedure FnReqforRegistration(registeredBusinessName: Code[100]; phoneNumber: Code[100]; emailAddress: Text; taxRegkraPin: Code[100]; contactName: Code[100]) status: Text
//     var
//         nextNo: Code[20];
//         procProcess: codeunit "Procurement Processing";
//     begin
//         Contact.Reset;
//         Contact.SetRange("E-Mail", emailAddress);
//         Contact.SetRange(Type, Contact.Type::Company);
//         Contact.SetRange("Applicant Type", Contact."Applicant Type"::"E-Procurment");
//         if Contact.FindSet then begin
//             status := 'danger*Another vendor with the given email address exists!';
//         end else begin
//             objProcsetup.Get;
//             Contact.Init;
//             nextNo := objNoSeriesManagement.GetNextNo(objProcsetup."Request For Registration Nos", Today, true);
//             Contact."No." := nextNo;
//             Contact."Company No." := Contact."No.";
//             Contact.Validate("No.");
//             Contact."Portal Request" := true;
//             Contact.Name := registeredBusinessName;
//             Contact."Name 2" := contactName;
//             Contact."Phone No." := phoneNumber;
//             Contact."E-Mail" := emailAddress;
//             Contact."VAT Registration No." := taxRegkraPin;
//             Contact."Applicant Type" := Contact."Applicant Type"::"E-Procurment";
//             Contact."Last Date Modified" := Today;
//             Contact."Last Time Modified" := Time;
//             Contact.Type := Contact.Type::Company;


//             if Contact.Insert(true) then begin
//                 //send  email notify to procurement department
//                 // Amos --> User Login credentials will be availed once the person has been created as a vendor by the procurement department.               
//                 fnSendApplicantEmail(Contact."E-Mail");
//                 fnSendEmailToProcurement(Contact."E-Mail");
//                 procProcess.CreateVendorPortal(nextNo);
//                 status := 'success*Your vendor account was successfully created. Please check your email address for more information.';

//             end else begin
//                 status := 'danger*Error!,unknown error occured while saving, contact main office';
//             end
//         end;

//         exit(status);
//     end;
//     // Applicant acknowledgement email
//     procedure fnSendApplicantEmail(emailaddress: Text)
//     var
//         Contact: Record Contact;
//         SMTPMailSetup: Record "Email Account";
//         SMTPMail: Codeunit "Email Message";
//         Smail: Codeunit EMail;
//         Body: Text;
//         SMTP: Codeunit Mail;
//         Receipients: List of [Text];
//         Subject: Text[250];
//     begin
//         Contact.Reset;
//         Contact.SetRange("E-Mail", emailaddress);
//         Contact.SetRange(Type, Contact.Type::Company);
//         Contact.SetRange("Applicant Type", Contact."Applicant Type"::"E-Procurment");
//         CompInfo.get();
//         if Contact.FindSet then begin
//             Subject := 'Account Creation Acknowledgement ';
//             Body := 'Dear, ' + Contact."Name 2" + ', this email is to acknowledge your request for registration as a supplier. The ' + CompInfo.Name + 'procurement team will review your request and get back to you as soon as possible.';
//             Body := Body + ' ' + 'Kind Regards, ' + CompInfo.Name + '' + '<br><br>';
//             Body := Body + '[This email is automated. Kindly do not reply to it]<br><br>';
//             SMTPMail.Create(Contact."E-Mail", Subject, Body, true);
//             Smail.Send(SMTPMail, Enum::"Email Scenario"::Default);
//         end;
//     end;
//     // Email the procurement team
//     procedure fnSendEmailToProcurement(emailaddress: Text)
//     var
//         Contact: Record Contact;
//         SMTPMailSetup: Record "Email Account";
//         SMTPMail: Codeunit "Email Message";
//         Smail: Codeunit EMail;
//         Body: Text;
//         SMTP: Codeunit Mail;
//         Receipients: List of [Text];
//         Subject: Text[250];
//         procurementSetup: Record "Procurement Setup";
//     begin
//         Contact.Reset;
//         Contact.SetRange("E-Mail", emailaddress);
//         Contact.SetRange(Type, Contact.Type::Company);
//         Contact.SetRange("Applicant Type", Contact."Applicant Type"::"E-Procurment");
//         procurementSetup.Get();
//         if procurementSetup."Default Proc Email Contact" = '' then
//             Error('Please Contact the IT Admin to specify the Procurement Manager E-mail address under Purchases&Payable Setup page!!');
//         if Contact.FindSet then begin
//             CompInfo.get();
//             Subject := 'Vendor e-Registration Request Reference No:' + Contact."No.";
//             Body := 'Dear Procurement Officer, this is to notify you that there has been a request for Registration via e-procurement for your action</BR> Registration Request Reference No:' + Contact."No." + '<BR></BR>' + 'Company Name:' + Contact.Name + '<BR></BR>' +
//         'Tax Registration (PIN) No:' + Contact."VAT Registration No." + '<BR></BR>' + 'Primary Email:' + Contact."E-Mail" + '<BR></BR>' + 'Mobile Phone No:' + Contact."Phone No." + '<BR></BR>';
//             Body := Body + ' ' + 'Kind Regards, ' + CompInfo.Name + '<br><br>';
//             Body := Body + '[This email is automated. Kindly do not reply to it]<br><br>';
//             SMTPMail.Create(procurementSetup."Default Proc Email Contact", Subject, Body, true);
//             Smail.Send(SMTPMail, Enum::"Email Scenario"::Default);
//         end;
//     end;

//     procedure fnBLOBRfQDocument(Vendorname: Code[50]; RFQNo: Code[50]; var BigText: BigText)
//     var
//         Filename: Text[100];
//         // Convert: dotnet Convert;
//         // Path: dotnet Path;
//         // _File: dotnet File;
//         //  FileAccess: dotnet FileAccess;

//         // FileMode: dotnet FileMode;
//         // MemoryStream: dotnet MemoryStream;
//         // FileStream: dotnet FileStream;
//         Outputstream: OutStream;
//     begin
//         objSuppSelection.Reset;
//         objSuppSelection.SetRange("Supplier Name", Vendorname);

//         //Filename := Path.GetTempPath() + Path.GetRandomFileName();

//         if objSuppSelection.FindSet()
//           then begin
//             objProcReqs.SetFilter(No, RFQNo);

//             // Report.SaveAsPdf(70002, Filename, objSuppSelection);
//             // FileMode := 4;
//             // //   FileAccess := 1;

//             // // FileStream := _File.Open(Filename, FileMode, FileAccess);

//             // MemoryStream := MemoryStream.MemoryStream();

//             // MemoryStream.SetLength(FileStream.Length);
//             // FileStream.Read(MemoryStream.GetBuffer(), 0, FileStream.Length);

//             // BigText.AddText((Convert.ToBase64String(MemoryStream.GetBuffer())));

//             // MemoryStream.Close();
//             // MemoryStream.Dispose();
//             // FileStream.Close();
//             // FileStream.Dispose();
//             // _File.Delete(Filename);

//         end
//         else begin
//             Error('Error generating report');
//         end;
//     end;

//     procedure fnDownloadRfQPTDoc()
//     begin
//     end;

//     procedure fnSupplierRegistration(businessType: Text; vendorType: Option; ownershipType: Option; dateofIncorporation: Date; dateofOps: Date; languageCode: Code[20]; vendorNo: Code[20]; certofIncopNo: Code[20]; agpocertno: Code[10]; registeredspecialgroup: Code[10]; productservicecategory: Text; certeffectivedate: Date; certexpirydate: Date; haveagpo: Boolean; locationAddress: Text) insertstatus: Text
//     begin
//         objVendor.Reset;
//         objVendor.SetRange("No.", vendorNo);
//         if objVendor.FindSet then begin

//             // objVendor.SetRange("Registrn Submitted onPortal", true);
//             // if objVendor.FindSet then begin
//             //     insertstatus := 'danger*You have already submitted your application, consider editing it!';
//             // end
//             //  else begin
//             objVendor."Business Type" := businessType;
//             objVendor."Supplier Type" := vendorType;
//             // objVendor."Dealer Type":=dealerType;
//             objVendor."Registration/Incorporation No." := certofIncopNo;
//             objVendor."Ownership Type" := ownershipType;
//             objVendor."Reg/Incorporation Date" := dateofIncorporation;
//             objVendor."Operations Start Date" := dateofOps;
//             objVendor."Language Code" := languageCode;
//             objVendor."HaveAgpo?" := haveagpo;
//             // objVendor."Industry Group":=industryGroup;
//             //  objVendor."Vision Statement":=vision;
//             //  objVendor."Mission Statement":=mision;
//             //  objVendor.Address:=poAddress;
//             objVendor."Address 2" := locationAddress;
//             //  objVendor."Post Code":=postacode;
//             //  objVendor.City:=postaCity;
//             //  objVendor."Country/Region Code":=countryofOrigin;
//             //  objVendor."Website Url":=webUrl;
//             //  objVendor.Tel:=telephoneNo;
//             //  objVendor."Building/House No":=buildingNo;
//             //  objVendor.Floor:=floorNo;
//             //  objVendor."Plot No":=plotNo;
//             //  objVendor.Street:=streetorRoad;
//             //  objVendor."Fax No.":=faxNo;
//             //  objVendor."Company Size":=companysize;
//             //  objVendor."Nominal Capital LCY":=nominalCap;
//             //  objVendor."Max Value of Business":=maxbizvalue;
//             //  objVendor."Phone No.":=mobileNo;
//             //  objVendor."Nature of Business":=natureofBiz;
//             objVendor."Profile Complete" := true;
//             objVendor."Registrn Submitted onPortal" := true;
//             if objVendor.Modify(true) then begin

//                 if (objVendor."HaveAgpo?" = true) then begin
//                     objVendorSpecialGroup.Reset;
//                     objVendorSpecialGroup.SetRange("Certifcate No", agpocertno);
//                     if objVendorSpecialGroup.FindSet then begin
//                         objVendorSpecialGroup."Certifcate No" := agpocertno;
//                         objVendorSpecialGroup."Vendor Category" := registeredspecialgroup;
//                         objVendorSpecialGroup."Vendor No" := vendorNo;
//                         objVendorSpecialGroup."Registered Special Group" := registeredspecialgroup;
//                         objVendorSpecialGroup."Products/Service Category" := productservicecategory;
//                         objVendorSpecialGroup."Certificate Expiry Date" := certexpirydate;
//                         objVendorSpecialGroup."Effective Date" := certeffectivedate;
//                         if objVendorSpecialGroup.Modify(true) then begin
//                             insertstatus := 'success*Your information submitted successfully!';
//                         end else begin
//                             insertstatus := 'danger*System Unknown Error Occured!';
//                         end;
//                     end else begin
//                         objVendorSpecialGroup.Init;
//                         objVendorSpecialGroup."Vendor Category" := registeredspecialgroup;
//                         objVendorSpecialGroup."Certifcate No" := agpocertno;
//                         objVendorSpecialGroup."Vendor No" := vendorNo;
//                         objVendorSpecialGroup."Registered Special Group" := registeredspecialgroup;
//                         objVendorSpecialGroup."Products/Service Category" := productservicecategory;
//                         objVendorSpecialGroup."Certificate Expiry Date" := certexpirydate;
//                         objVendorSpecialGroup."Effective Date" := certeffectivedate;
//                         if objVendorSpecialGroup.Insert(true) then begin
//                             insertstatus := 'success*Your information submitted successfully!';
//                         end else begin
//                             insertstatus := 'danger*System Unknown Error Occured!';
//                         end;
//                     end;
//                 end else begin
//                     insertstatus := 'success*Your information submitted successfully!';
//                 end;
//             end else begin
//                 insertstatus := 'danger*System Unknown Error Occured!';
//             end
//             //  end
//         end
//         else begin
//             insertstatus := 'danger*Vendor does not exist!';
//         end
//     end;

//     procedure fnSupplierGeneralDetailsRegistration(businessname: Text; vatregistration: Text; ownershipType: Option; vendortype: Option; businesstype: Text; certificatenumber: Code[60]; dateofIncorporation: Date; dateofoperation: Date; languageCode: Code[90]; vision: Text; mision: Text; vendorNo: Code[90]) insertstatus: Text
//     begin
//         objVendor.Reset;
//         objVendor.SetRange("No.", vendorNo);
//         if objVendor.FindSet then begin
//             objVendor.SetRange("Registrn Submitted onPortal", true);
//             if objVendor.FindSet then begin
//                 insertstatus := 'danger*You have already submitted your application, consider editing it!';
//             end
//             else begin
//                 objVendor.Name := businessname;
//                 objVendor."VAT Registration No." := vatregistration;
//                 objVendor."Ownership Type" := ownershipType;
//                 objVendor."Vendor Type" := vendortype;
//                 ;
//                 objVendor."Business Type" := businesstype;
//                 objVendor."Certificate of Registration" := certificatenumber;
//                 objVendor."Reg/Incorporation Date" := dateofIncorporation;
//                 objVendor."Operations Start Date" := dateofoperation;
//                 objVendor."Language Code" := languageCode;
//                 objVendor."Vision Statement" := vision;
//                 objVendor."Mission Statement" := mision;
//                 if objVendor.Modify() then begin
//                     insertstatus := 'success*Your information submitted successfully!';
//                 end else begin
//                     insertstatus := 'danger*System Unknown Error Occured!';
//                 end
//             end
//         end
//         else begin
//             insertstatus := 'danger*Vendor does not exist!';
//         end
//     end;

//     [NonDebuggable]
//     procedure fnInsertBank(vendorNo: Code[20]; bankCode: Code[20]; bankName: Code[100]; currencyCode: Code[20]; bankAccountNo: Code[20]) bankinserted: Text
//     begin
//         objVendorBank.Reset;
//         objVendorBank.SetRange("Vendor No.", vendorNo);
//         objVendorBank.SetRange(Code, bankCode);
//         if objVendorBank.FindSet then begin
//             objVendorBank.Code := bankCode;
//             objVendorBank.Name := bankName;
//             objVendorBank."Bank Account No." := bankAccountNo;

//             if objVendorBank.Modify() then begin
//                 bankinserted := 'success*You bank account details edited successfully!'
//             end else begin
//                 bankinserted := 'danger*Unknown Error editing!'
//             end
//         end
//         else begin
//             objVendorBank.Init;
//             objVendorBank."Vendor No." := vendorNo;
//             objVendorBank.Code := bankCode;
//             objVendorBank.Name := bankName;
//             objVendorBank."Bank Account No." := bankAccountNo;
//             if objVendorBank.Insert() then begin
//                 bankinserted := 'success*You bank Account details saved successfully!'
//             end else begin
//                 bankinserted := 'danger*Unknown Error occured!'
//             end
//         end
//     end;

//     [NonDebuggable]
//     procedure fnInsertBankDetails(vendorNo: Code[30]; bankCode: Code[30]; bankName: Code[100]; currencyCode: Code[30]; bankAccountNo: Code[30]; bankbranchno: Code[30]; phonenumber: Text; country: Code[30]; postcode: Code[50]) bankinserted: Text
//     begin
//         // objVendorBank.Reset;
//         // objVendorBank.SetRange("Vendor No.", vendorNo);
//         // objVendorBank.SetRange(Code, bankCode);
//         // if objVendorBank.FindSet then begin
//         //     objVendorBank."Bank Code" := bankCode;
//         //     objVendorBank.Code := bankCode;
//         //     objVendorBank.VALIDATE("Bank Code");
//         //     // objVendorBank.Name := bankName;
//         //     objVendorBank."Bank Account No." := bankAccountNo;
//         //     objVendorBank."Currency Code" := currencyCode;
//         //     objVendorBank."Phone No." := phonenumber;
//         //     objVendorBank."Bank Branch No." := bankbranchno;
//         //     objVendorBank.VALIDATE("Bank Branch No.");
//         //     objVendorBank."Post Code" := postcode;
//         //     if objVendorBank.Modify(true) then begin
//         //         bankinserted := 'success*You bank account details edited successfully!'
//         //     end else begin
//         //         bankinserted := 'danger*Unknown Error editing!'
//         //     end
//         // end
//         // //else begin
//         objVendorBank.Init;
//         objVendorBank."Vendor No." := vendorNo;
//         objVendorBank."Bank Code" := bankCode;
//         objVendorBank.Code := bankCode;
//         objVendorBank.VALIDATE("Bank Code");
//         // objVendorBank.Name := bankName;
//         objVendorBank."Bank Account No." := bankAccountNo;
//         objVendorBank."Currency Code" := currencyCode;
//         objVendorBank."Phone No." := phonenumber;
//         objVendorBank."Bank Branch No." := bankbranchno;
//         // objVendorBank.VALIDATE("Bank Branch No.");
//         objVendorBank."Post Code" := postcode;
//         if objVendorBank.Insert(true) then begin
//             bankinserted := 'success*You bank Account details saved successfully!'
//         end else begin
//             bankinserted := 'danger*Sorry, You have already an existing bank account.'
//         end
//         //  end
//     end;

//     [NonDebuggable]
//     procedure fnDeleteBank(vendorNo: Code[20]; bankCode: Code[20]) status: Text
//     var
//         VendorBankAccount: Record "Vendor Bank Account";
//     begin
//         /*status :='Could not delete bank';
//         VendorBankAccount.RESET;
//         VendorBankAccount.SETRANGE("Vendor No.",vendorNo);
//         VendorBankAccount.SETRANGE(Code, bankCode);
//         IF objVendorBank.FINDSET THEN BEGIN
//             IF objVendorBank.DELETE(TRUE) THEN BEGIN
//               status:='success*You bank Account details have been successfully deleted!'
//               END ELSE BEGIN
//               status:='danger*You bank Account details could not be deleted!'
//               END
//           END;*/
//         VendorBankAccount.Reset;
//         VendorBankAccount.SetRange("Vendor No.", vendorNo);
//         VendorBankAccount.SetRange(Code, bankCode);
//         if VendorBankAccount.FindSet then begin
//             if VendorBankAccount.Delete(true) then begin
//                 status := 'success*You bank Account details have been successfully deleted!'
//             end else begin
//                 status := 'danger*You bank Account details could not be deleted!.Kindly Try Again Later'
//             end
//         end;

//     end;

//     procedure fnInsertDirector(vendorNo: Code[20]; phoneNo: Code[20]; ownershippercentage: Decimal; country: Code[20]; email: Text; address: Code[20]; directorFullname: Text[100]; idNumber: Code[30]; citizenType: Option) dirinserted: Text
//     begin
//         objDirectors.Reset;
//         objDirectors.SetRange("Vendor No.", vendorNo);
//         objDirectors.SetRange("Nationality ID", idNumber);

//         if objDirectors.FindSet then begin
//             //modify
//             objDirectors.Name := directorFullname;
//             objDirectors."Phone No." := phoneNo;
//             objDirectors."E-Mail" := email;
//             objDirectors."Entity Ownership %" := ownershippercentage;
//             objDirectors."Country/Region Code" := country;
//             objDirectors.Address := address;
//             objDirectors."Citizenship Type" := citizenType;

//             if objDirectors.Modify then begin
//                 dirinserted := 'success*Director edited successfully!';
//             end
//             else begin
//                 dirinserted := 'danger*Unknown error while editing!';
//             end
//         end else begin
//             //insert
//             objDirectors.Init;
//             objDirectors."Vendor No." := vendorNo;
//             objDirectors.Name := directorFullname;
//             objDirectors."Phone No." := phoneNo;
//             objDirectors."E-Mail" := email;
//             objDirectors."Nationality ID" := idNumber;
//             objDirectors."Entity Ownership %" := ownershippercentage;
//             objDirectors."Country/Region Code" := country;
//             objDirectors.Address := address;
//             objDirectors."Citizenship Type" := citizenType;
//             if objDirectors.Insert then begin
//                 dirinserted := 'success*Director added successfully!';
//             end
//             else begin
//                 dirinserted := 'danger*Unknown error while adding!';
//             end
//         end
//     end;

//     procedure fnInsertDirectorDetails(vendorNo: Code[20]; directorname: Text; idnumber: Code[20]; citizenship: Integer; ownershippercent: Decimal; phonenumber: Text[100]; address: Code[30]; email: Text; nationalityId: Text; type: Option; registrationNumber: Text; kraPin: Text; entityType: Code[10]; supplierType: Integer) dirinserted: Text
//     begin
//         objDirectors.Reset;
//         objDirectors.SetRange("Vendor No.", vendorNo);
//         objDirectors.SetRange("Nationality ID", idnumber);
//         if objDirectors.FindSet then begin
//             //modify

//             if type = 0 then begin

//                 objDirectors.Name := directorname;
//                 objDirectors."Phone No." := phonenumber;
//                 objDirectors."E-Mail" := email;
//                 objDirectors."Entity Ownership %" := ownershippercent;
//                 //objDirectors."Country/Region Code":=country;
//                 objDirectors.Address := address;
//                 objDirectors."Citizenship Type" := citizenship;
//                 objDirectors."Nationality ID" := nationalityId;
//                 objDirectors.Type := type;
//                 objDirectors."Registration No" := registrationNumber;
//                 objDirectors."KRA PIN" := kraPin;
//                 //objDirectors."Entity Type":=entityType;
//                 //objDirectors."Supplier Type":=supplierType;
//             end
//             else
//                 if type = 1 then begin

//                     objDirectors.Name := directorname;
//                     objDirectors."Phone No." := phonenumber;
//                     objDirectors."E-Mail" := email;
//                     objDirectors."Entity Ownership %" := ownershippercent;
//                     //objDirectors."Country/Region Code":=country;
//                     objDirectors.Address := address;
//                     //objDirectors."Citizenship Type":=citizenship;
//                     //objDirectors."Nationality ID":=nationalityId;
//                     objDirectors.Type := type;
//                     objDirectors."Registration No" := registrationNumber;
//                     objDirectors."KRA PIN" := kraPin;
//                     objDirectors."Entity Type" := entityType;
//                     objDirectors."Supplier Type" := supplierType;
//                 end;
//             if objDirectors.Modify(true) then begin
//                 dirinserted := 'success*Director edited successfully!';
//             end
//             else begin
//                 dirinserted := 'danger*Unknown error while editing!';
//             end
//         end else begin
//             //insert
//             objDirectors.Init;
//             objDirectors."Vendor No." := vendorNo;
//             objDirectors.Name := directorname;
//             objDirectors."Phone No." := phonenumber;
//             objDirectors."E-Mail" := email;
//             objDirectors."Nationality ID" := idnumber;
//             objDirectors."Entity Ownership %" := ownershippercent;
//             //objDirectors."Country/Region Code":=country;
//             objDirectors.Address := address;
//             objDirectors."Citizenship Type" := citizenship;
//             objDirectors."Nationality ID" := nationalityId;
//             objDirectors.Type := type;
//             objDirectors."Registration No" := registrationNumber;
//             objDirectors."KRA PIN" := kraPin;
//             objDirectors."Entity Type" := entityType;
//             objDirectors."Supplier Type" := supplierType;
//             if objDirectors.Insert(true) then begin
//                 dirinserted := 'success*Director added successfully!';
//             end
//             else begin
//                 dirinserted := 'danger*Unknown error while adding!';
//             end
//         end
//     end;

//     [NonDebuggable]
//     procedure fnDeleteBeneficiary(vendorNo: Code[20]; beneficiaryCode: Integer) status: Text
//     var
//         VendorBeneficiary: Record "Vendor Beneficiaries";
//     begin

//         VendorBeneficiary.Reset;
//         VendorBeneficiary.SetRange("Vendor No.", vendorNo);
//         VendorBeneficiary.SetRange("Entry No.", beneficiaryCode);
//         if VendorBeneficiary.FindSet then begin
//             if VendorBeneficiary.Delete(true) then begin
//                 status := 'success*Your Beneficiary details have been successfully deleted!'
//             end else begin
//                 status := 'danger*Your Beneficiary details could not be deleted!.Kindly Try Again Later'
//             end
//         end;
//     end;

//     [NonDebuggable]
//     procedure fnDeleteShareholder(vendorNo: Code[20]; shareholdercode: Integer) status: Text
//     var
//         VendorBusinessOwner: Record "Vendor Business Owner";
//     begin

//         VendorBusinessOwner.Reset;
//         VendorBusinessOwner.SetRange("Vendor No.", vendorNo);
//         VendorBusinessOwner.SetRange("Entry No.", shareholdercode);
//         if VendorBusinessOwner.FindSet then begin
//             if VendorBusinessOwner.Delete(true) then begin
//                 status := 'success*You Shareholder details have been successfully deleted!'
//             end else begin
//                 status := 'danger*You Shareholder details could not be deleted!.Kindly Try Again Later'
//             end
//         end;
//     end;

//     procedure fnInsertBidResponseSecurityDetails(vendorNo: Code[50]; bidnumber: Code[50]; ifsnumber: Code[50]; formofbidesecurity: Code[50]; issuertype: Integer; securitytype: Integer; gaurantorname: Code[50]; issueroffices: Text; description: Text; securityamount: Decimal; bidsecurityeffectivedate: Date; bidsecurityexpirydate: Date) dirinserted: Text
//     begin
//         objTenderSecurity.Init;
//         objTenderSecurity."Vendor No." := vendorNo;
//         objTenderSecurity."No." := bidnumber;
//         objTenderSecurity."IFS No" := ifsnumber;
//         objTenderSecurity."Form of Security" := ifsnumber;
//         objTenderSecurity."Security Amount (LCY)" := securityamount;
//         objTenderSecurity."Issuer Institution Type" := issuertype;
//         objTenderSecurity."Issuer Registered Offices" := issueroffices;
//         objTenderSecurity."Issuer/Guarantor Name" := gaurantorname;
//         objTenderSecurity."Bid Security Effective Date" := bidsecurityeffectivedate;
//         objTenderSecurity."Bid Security Validity Expiry" := bidsecurityexpirydate;
//         objTenderSecurity.Description := description;
//         if objTenderSecurity.Insert then begin
//             dirinserted := 'success*Director added successfully!';
//         end
//         else begin
//             dirinserted := 'danger*Unknown error while adding!';
//         end;
//     end;

//     procedure fnInsertLitigationH(vendorNo: Code[15]; disputeDescription: Text; categoryofDispute: Option; year: Code[10]; theotherDisputeparty: Text; disputeAmount: Decimal; awardType: Option) insertstatus: Text
//     begin
//         objLitigHistory.Init;
//         // objLitigHistory."Vendor No." := vendorNo;
//         // objLitigHistory."Dispute Matter" := disputeDescription;
//         // objLitigHistory."Category of Matter" := categoryofDispute;
//         // objLitigHistory.Year := year;
//         // objLitigHistory."Other Dispute Party" := theotherDisputeparty;
//         // objLitigHistory."Dispute Amount LCY" := disputeAmount;
//         // objLitigHistory."Award Type" := awardType;
//         if objLitigHistory.Insert then begin
//             insertstatus := 'success*Your litigation history entry saved successfully!';
//         end
//         else begin
//             insertstatus := 'danger*Unknown Error occured while saving!';
//         end
//     end;

//     procedure fnInsertLitigationHistoryDetails(vendorNo: Code[15]; disputeDescription: Text; categoryofDispute: Option; year: Code[10]; theotherDisputeparty: Text; disputeAmount: Decimal; awardType: Option) insertstatus: Text
//     begin
//         tbl_bidLitigationHistory.Init;
//         tbl_bidLitigationHistory."Vendor No." := vendorNo;
//         tbl_bidLitigationHistory."Dispute Matter" := disputeDescription;
//         tbl_bidLitigationHistory."Category of Matter" := categoryofDispute;
//         tbl_bidLitigationHistory.Year := year;
//         tbl_bidLitigationHistory."Other Dispute Party" := theotherDisputeparty;
//         tbl_bidLitigationHistory."Dispute Amount LCY" := disputeAmount;
//         tbl_bidLitigationHistory."Award Type" := awardType;
//         if tbl_bidLitigationHistory.Insert then begin
//             insertstatus := 'success*Your litigation history entry saved successfully!';
//         end
//         else begin
//             insertstatus := 'danger*Unknown Error occured while saving!';
//         end
//     end;

//     [NonDebuggable]
//     procedure fnDeleteLitigationHistoryDetails(vendorNo: Code[20]; litigationCode: Integer) status: Text
//     var
//         VendorLitigationHistory: Record "Vendor Litigation History";
//     begin
//         VendorLitigationHistory.Reset;
//         //  VendorLitigationHistory.SetRange("Vendor No.", vendorNo);
//         VendorLitigationHistory.SetRange("Entry No.", litigationCode);
//         if VendorLitigationHistory.FindSet then begin
//             if VendorLitigationHistory.Delete(true) then begin
//                 status := 'success*Your Litigation History details have been successfully deleted!'
//             end else begin
//                 status := 'danger*Your Litigation History details could not be deleted!'
//             end
//         end;
//     end;

//     procedure fnInsertSpecialGrp(vendoNo: Code[10]; specialGrpcatg: Code[20]; certficateNo: Code[20]; certeffectiveDate: Date; certXpiryDate: Date; prodservCategory: Text) inserstatus: Text
//     begin
//         objVendorSpecGentry.Reset;
//         objVendorSpecGentry.SetRange("Vendor No", vendoNo);
//         objVendorSpecGentry.SetRange("Certifcate No", certficateNo);
//         if objVendorSpecGentry.FindSet then begin
//             inserstatus := 'danger*You have already submitted this Certificate';
//         end else begin
//             objVendorSpecGentry.Init;
//             objVendorSpecGentry."Vendor No" := vendoNo;
//             objVendorSpecGentry."Certifcate No" := certficateNo;
//             objVendorSpecGentry."Vendor Category" := specialGrpcatg;
//             objVendorSpecGentry."Products/Service Category" := certficateNo;
//             objVendorSpecGentry."Effective Date" := certeffectiveDate;
//             objVendorSpecGentry."Certificate Expiry Date" := certXpiryDate;
//             objVendorSpecGentry."Products/Service Category" := prodservCategory;
//             if objVendorSpecGentry.Insert then begin
//                 inserstatus := 'success*Your Special Group entry saved successfully!';
//             end else begin
//                 inserstatus := 'danger*Unknown error occured, could not save!';
//             end
//         end
//     end;

//     procedure fnInsertPurchaseLinesDetails(vendorNo: Code[10]; bidresponseNumber: Code[50]; itemlinenumber: Integer; itemnumber: Code[10]; costexlvat: Decimal; quantity: Decimal) insertstatus: Text
//     begin
//         objPurhcaseLinesDetails.SetRange("Buy-from Vendor No.", vendorNo);
//         objPurhcaseLinesDetails.SetRange("Document No.", bidresponseNumber);
//         objPurhcaseLinesDetails.SetRange("Line No.", itemlinenumber);
//         if objPurhcaseLinesDetails.FindSet then begin
//             objPurhcaseLinesDetails."VAT Prod. Posting Group" := 'EXEMPT';
//             objPurhcaseLinesDetails.Validate("Direct Unit Cost Inc. VAT", costexlvat);
//             if objPurhcaseLinesDetails.Modify(true) then begin
//                 insertstatus := 'success*Your Pricing Details was saved successfully!';
//             end else begin
//                 insertstatus := 'danger*Your Pricing Details was not successfully!';
//             end;
//         end;
//     end;

//     procedure fnInsertPurchaseLinesResponseDetails(vendorNo: Code[10]; bidresponseNumber: Code[50]; itemnumber: Code[10]; quantity: Decimal; costexlvat: Decimal) insertstatus: Text
//     begin
//         objPurhcaseLinesDetails.SetRange("Buy-from Vendor No.", vendorNo);
//         objPurhcaseLinesDetails.SetRange("Document No.", bidresponseNumber);
//         objPurhcaseLinesDetails.SetRange("No.", itemnumber);
//         if objPurhcaseLinesDetails.FindSet then begin
//             objPurhcaseLinesDetails."VAT Prod. Posting Group" := 'EXEMPT';
//             objPurhcaseLinesDetails.Validate("Direct Unit Cost Inc. VAT", costexlvat);
//             if objPurhcaseLinesDetails.Modify(true) then begin
//                 insertstatus := 'success*Your Pricing Details was saved successfully!';
//             end else begin
//                 insertstatus := 'danger*Your Pricing Details was not successfully!';
//             end;
//         end;
//     end;

//     procedure fnInsertPurchaseLinesResponseRFQDetails(vendorNo: Code[30]; bidresponseNumber: Code[50]; itemnumber: Code[10]; costexlvat: Decimal) insertstatus: Text
//     begin
//         objPurhcaseLinesDetails.SetRange("Buy-from Vendor No.", vendorNo);
//         objPurhcaseLinesDetails.SetRange("Document No.", bidresponseNumber);
//         objPurhcaseLinesDetails.SetRange("No.", itemnumber);
//         if objPurhcaseLinesDetails.FindSet then begin
//             objPurhcaseLinesDetails."VAT Prod. Posting Group" := 'EXEMPT';
//             objPurhcaseLinesDetails.Validate("Direct Unit Cost Inc. VAT", costexlvat);
//             if objPurhcaseLinesDetails.Modify(true) then begin
//                 insertstatus := 'success*Your Pricing Details was saved successfully!';
//             end else begin
//                 insertstatus := 'danger*Your Pricing Details was not successfully!';
//             end;
//         end;
//     end;

//     procedure fnInsertPastXep(vendorNo: Code[10]; clientName: Code[50]; address: Code[30]; assignmentProject: Text; projectScope: Text; projectStartDate: Date; projectEndDate: Date; projectValue: Decimal) insertstatus: Text
//     begin
//         objPastXp.Init;
//         objPastXp."Vendor No." := vendorNo;
//         objPastXp."Client Name" := clientName;
//         objPastXp.Address := address;
//         objPastXp."Assignment Name" := assignmentProject;
//         objPastXp."Project Scope Summary" := projectScope;
//         objPastXp."Assignment Start Date" := projectStartDate;
//         objPastXp."Assignment End Date" := projectEndDate;
//         objPastXp."Assignment Value LCY" := projectValue;

//         if objPastXp.Insert then begin
//             insertstatus := 'success*Your past experience entry saved successfully!';
//         end else begin
//             insertstatus := 'danger*Unknown error occured!';
//         end
//     end;

//     procedure fnInsertPastExperienceDetails(vendorNo: Code[10]; clientName: Code[50]; address: Code[30]; assignmentProject: Text; projectScope: Text; projectStartDate: Date; projectEndDate: Date; projectValue: Decimal; sharepointlink: Text; filename: Text) insertstatus: Text
//     begin
//         objPastXp.Reset;
//         objPastXp.SetRange(objPastXp."Vendor No.", vendorNo);
//         objPastXp.SetRange(objPastXp."Client Name", clientName);
//         if objPastXp.Find('-') then begin
//             // objPastXp.ty
//             objPastXp."Vendor No." := vendorNo;
//             objPastXp."Client Name" := clientName;
//             objPastXp.Address := address;
//             objPastXp."Assignment Name" := assignmentProject;
//             objPastXp."Project Scope Summary" := projectScope;
//             objPastXp."Assignment Start Date" := projectStartDate;
//             objPastXp."Assignment End Date" := projectEndDate;
//             objPastXp."Assignment Value LCY" := projectValue;
//             if objPastXp.Modify then begin
//                 fnInsertLinks(vendorNo, sharepointlink, filename);
//                 insertstatus := 'success*Your past experience entry saved successfully!';
//             end else begin
//                 insertstatus := 'danger*Unknown error occured!';
//             end

//         end else begin
//             objPastXp.Init;
//             objPastXp."Vendor No." := vendorNo;
//             objPastXp."Client Name" := clientName;
//             objPastXp.Address := address;
//             objPastXp."Assignment Name" := assignmentProject;
//             objPastXp."Project Scope Summary" := projectScope;
//             objPastXp."Assignment Start Date" := projectStartDate;
//             objPastXp."Assignment End Date" := projectEndDate;
//             objPastXp."Assignment Value LCY" := projectValue;
//             if objPastXp.Insert then begin
//                 fnInsertLinks(vendorNo, sharepointlink, filename);
//                 insertstatus := 'success*Your past experience entry saved successfully!';
//             end else begin
//                 insertstatus := 'danger*Unknown error occured!';
//             end

//         end;
//     end;

//     [NonDebuggable]
//     procedure fnDeletePastExperienceDetails(vendorNo: Code[20]; experienceCode: Integer) status: Text
//     var
//         VendorPastExperience: Record "Vendor Past Experience";
//     begin
//         VendorPastExperience.Reset;
//         VendorPastExperience.SetRange("Vendor No.", vendorNo);
//         VendorPastExperience.SetRange("Entry No.", experienceCode);
//         if VendorPastExperience.FindSet then begin
//             if VendorPastExperience.Delete(true) then begin
//                 status := 'success*Your Past Experience details have been successfully deleted!'
//             end else begin
//                 status := 'danger*Your Past Experience details could not be deleted!'
//             end
//         end;
//     end;

//     [NonDebuggable]
//     procedure fnDeleteStaffExperience(vendorNo: Code[20]; staffCode: Code[50]) status: Text
//     var
//         VendorProfessionalStaff: Record "Vendor Professional Staff";
//     begin

//         VendorProfessionalStaff.Reset;
//         VendorProfessionalStaff.SetRange("Vendor No.", vendorNo);
//         VendorProfessionalStaff.SetRange("Staff Number", staffCode);
//         if VendorProfessionalStaff.FindSet then begin
//             if VendorProfessionalStaff.Delete(true) then begin
//                 status := 'success*Your Past Experience details have been successfully deleted!'
//             end else begin
//                 status := 'danger*Your Past Experience details could not be deleted!'
//             end
//         end;
//     end;

//     [NonDebuggable]
//     procedure fnDeleteBidResponsePersonel(vendorNo: Code[20]; staffno: Integer) status: Text
//     var
//         VendorPastExperience: Record "Vendor Past Experience";
//     begin

//         BidKeyStaff.Reset;
//         BidKeyStaff.SetRange("Entry No.", staffno);
//         if BidKeyStaff.FindSet then begin
//             if BidKeyStaff.Delete(true) then begin
//                 status := 'success*Your Personel details have been successfully deleted!'
//             end else begin
//                 status := 'danger*Your Personel details could not be deleted!'
//             end
//         end;
//     end;

//     [NonDebuggable]
//     procedure fnDeleteBidResponseEquipmentDetails(vendorNo: Code[20]; serialno: Code[30]) status: Text
//     var
//         VendorPastExperience: Record "Vendor Past Experience";
//     begin
//         objBidResponseEquipments.Reset;
//         objBidResponseEquipments.SetRange("Equipment Serial", serialno);
//         if objBidResponseEquipments.FindSet then begin
//             if objBidResponseEquipments.Delete(true) then begin
//                 status := 'success*Your Equipment details have been successfully deleted!'
//             end else begin
//                 status := 'danger*Your Equipment details could not be deleted!'
//             end
//         end;
//     end;

//     procedure fnInsertBalanceSheet(yearCode: Code[10]; totalCurrentAssets: Decimal; totalFixedAssets: Decimal; totalCurrentLiability: Decimal; totalLongtermliabilty: Decimal; totalOwnersequity: Decimal; vendorNo: Code[20]) inserstatus: Text
//     begin
//         objBalanceSheet.Reset;
//         objBalanceSheet.SetRange("Vendor No.", vendorNo);
//         objBalanceSheet.SetRange("Audit Year Code Reference", yearCode);
//         if objBalanceSheet.FindSet then begin
//             objBalanceSheet.Reset;
//             objBalanceSheet."Vendor No." := vendorNo;
//             objBalanceSheet."Audit Year Code Reference" := yearCode;
//             objBalanceSheet."Current Assets (LCY)" := totalCurrentAssets;
//             objBalanceSheet."Fixed Assets (LCY)" := totalFixedAssets;
//             objBalanceSheet."Current Liabilities (LCY)" := totalCurrentLiability;
//             objBalanceSheet."Long-term Liabilities (LCY)" := totalLongtermliabilty;
//             objBalanceSheet."Owners Equity (LCY)" := totalOwnersequity;
//             if objBalanceSheet.Modify(true) then begin
//                 inserstatus := 'success*You have submitted this entry successfully!';
//             end;
//         end else begin
//             objBalanceSheet.Init;
//             objBalanceSheet."Vendor No." := vendorNo;
//             objBalanceSheet."Audit Year Code Reference" := yearCode;
//             objBalanceSheet."Current Assets (LCY)" := totalCurrentAssets;
//             objBalanceSheet."Fixed Assets (LCY)" := totalFixedAssets;
//             objBalanceSheet."Current Liabilities (LCY)" := totalCurrentLiability;
//             objBalanceSheet."Long-term Liabilities (LCY)" := totalLongtermliabilty;
//             objBalanceSheet."Owners Equity (LCY)" := totalOwnersequity;
//             if objBalanceSheet.Insert(true) then begin
//                 inserstatus := 'success*You have submitted this entry successfully!';
//             end else begin
//                 inserstatus := 'danger*Unknown Error Occured!';
//             end
//         end
//     end;

//     procedure fnBidResponseInsertBalanceSheet(bidresponseNumber: Code[50]; yearCode: Code[10]; totalCurrentAssets: Decimal; totalFixedAssets: Decimal; totalCurrentLiability: Decimal; totalLongtermliabilty: Decimal; totalOwnersequity: Decimal; vendorNo: Code[20]) inserstatus: Text
//     begin
//         objBidResponseBalanceSheet.Reset;
//         objBidResponseBalanceSheet.SetRange("Vendor No.", vendorNo);
//         objBidResponseBalanceSheet.SetRange("Audit Year Code Reference", yearCode);
//         objBidResponseBalanceSheet.SetRange("No.", bidresponseNumber);
//         if objBidResponseBalanceSheet.FindSet then begin
//             objBidResponseBalanceSheet.Reset;
//             objBidResponseBalanceSheet."No." := bidresponseNumber;
//             objBidResponseBalanceSheet."Vendor No." := vendorNo;
//             objBidResponseBalanceSheet."Audit Year Code Reference" := yearCode;
//             objBidResponseBalanceSheet."Current Assets (LCY)" := totalCurrentAssets;
//             objBidResponseBalanceSheet."Fixed Assets (LCY)" := totalFixedAssets;
//             objBidResponseBalanceSheet."Current Liabilities (LCY)" := totalCurrentLiability;
//             objBidResponseBalanceSheet."Long-term Liabilities (LCY)" := totalLongtermliabilty;
//             objBidResponseBalanceSheet."Owners Equity (LCY)" := totalOwnersequity;
//             if objBidResponseBalanceSheet.Modify(true) then begin
//                 inserstatus := 'success*You have submitted this entry successfully!';
//             end;
//         end else begin
//             objBidResponseBalanceSheet.Init;
//             objBidResponseBalanceSheet."No." := bidresponseNumber;
//             objBidResponseBalanceSheet."Vendor No." := vendorNo;
//             objBidResponseBalanceSheet."Audit Year Code Reference" := yearCode;
//             objBidResponseBalanceSheet."Current Assets (LCY)" := totalCurrentAssets;
//             objBidResponseBalanceSheet."Fixed Assets (LCY)" := totalFixedAssets;
//             objBidResponseBalanceSheet."Current Liabilities (LCY)" := totalCurrentLiability;
//             objBidResponseBalanceSheet."Long-term Liabilities (LCY)" := totalLongtermliabilty;
//             objBidResponseBalanceSheet."Owners Equity (LCY)" := totalOwnersequity;
//             if objBidResponseBalanceSheet.Insert then begin
//                 inserstatus := 'success*You have submitted this entry successfully!';
//             end else begin
//                 inserstatus := 'danger*Unknown Error Occured!';
//             end
//         end
//     end;

//     [NonDebuggable]
//     procedure fnDeleteBalanceSheetDetails(vendorNo: Code[20]; yearcode: Code[20]) status: Text
//     var
//         VendorBalanceSheet: Record "Vendor Audited Balance Sheet";
//     begin

//         VendorBalanceSheet.Reset;
//         VendorBalanceSheet.SetRange("Vendor No.", vendorNo);
//         VendorBalanceSheet.SetRange("Audit Year Code Reference", yearcode);
//         if VendorBalanceSheet.FindSet then begin
//             if VendorBalanceSheet.Delete(true) then begin
//                 status := 'success*Your Balance Sheet details have been successfully deleted!'
//             end else begin
//                 status := 'danger*Your Balance Sheet details could not be deleted!'
//             end
//         end;
//     end;

//     procedure fnEditBidResponseInsertBalanceSheet(bidresponseNumber: Code[50]; yearCode: Code[10]; totalCurrentAssets: Decimal; totalFixedAssets: Decimal; totalCurrentLiability: Decimal; totalLongtermliabilty: Decimal; totalOwnersequity: Decimal; vendorNo: Code[20]) inserstatus: Text
//     begin
//         objBidResponseBalanceSheet.Reset;
//         objBidResponseBalanceSheet.SetRange("Vendor No.", vendorNo);
//         objBidResponseBalanceSheet.SetRange("Audit Year Code Reference", yearCode);
//         objBidResponseBalanceSheet.SetRange("No.", bidresponseNumber);
//         if objBidResponseBalanceSheet.FindSet then begin
//             objBidResponseBalanceSheet.Reset;
//             objBidResponseBalanceSheet."No." := bidresponseNumber;
//             objBidResponseBalanceSheet."Vendor No." := vendorNo;
//             objBidResponseBalanceSheet."Audit Year Code Reference" := yearCode;
//             objBidResponseBalanceSheet."Current Assets (LCY)" := totalCurrentAssets;
//             objBidResponseBalanceSheet."Fixed Assets (LCY)" := totalFixedAssets;
//             objBidResponseBalanceSheet."Current Liabilities (LCY)" := totalCurrentLiability;
//             objBidResponseBalanceSheet."Long-term Liabilities (LCY)" := totalLongtermliabilty;
//             objBidResponseBalanceSheet."Owners Equity (LCY)" := totalOwnersequity;
//             if objBidResponseBalanceSheet.Modify(true) then begin
//                 inserstatus := 'success*You have submitted this entry successfully!';
//             end else begin
//                 inserstatus := 'danger*Unknown Error Occured!';
//             end
//         end
//     end;

//     procedure fnInsertIncomestatement(yearCode: Code[10]; totalRevenue: Decimal; totaCostofsoldgoods: Decimal; totaOperatingexpenses: Decimal; othernoneOperevenue: Decimal; interestExpense: Decimal; vendorNo: Code[20]) inserstatus: Text
//     begin
//         objIncomeStatement.Reset;
//         objIncomeStatement.SetRange("Vendor No.", vendorNo);
//         objIncomeStatement.SetRange("Audit Year Code Reference", yearCode);
//         if objIncomeStatement.FindSet then begin
//             objIncomeStatement.Reset;
//             objIncomeStatement."Vendor No." := vendorNo;
//             objIncomeStatement."Audit Year Code Reference" := yearCode;
//             objIncomeStatement."Total Revenue (LCY)" := totalRevenue;
//             objIncomeStatement."Total COGS (LCY)" := totaCostofsoldgoods;
//             objIncomeStatement."Total Operating Expenses (LCY)" := totaOperatingexpenses;
//             objIncomeStatement."Other Non-operating Re/Exp LCY" := othernoneOperevenue;
//             objIncomeStatement."Interest Expense (LCY)" := interestExpense;
//             if objIncomeStatement.Modify(true) then begin
//                 inserstatus := 'success*You have submitted this entry successfully!';
//             end;
//         end else begin
//             objIncomeStatement.Init;
//             objIncomeStatement."Vendor No." := vendorNo;
//             objIncomeStatement."Audit Year Code Reference" := yearCode;
//             objIncomeStatement."Total Revenue (LCY)" := totalRevenue;
//             objIncomeStatement."Total COGS (LCY)" := totaCostofsoldgoods;
//             objIncomeStatement."Total Operating Expenses (LCY)" := totaOperatingexpenses;
//             objIncomeStatement."Other Non-operating Re/Exp LCY" := othernoneOperevenue;
//             objIncomeStatement."Interest Expense (LCY)" := interestExpense;
//             if objIncomeStatement.Insert(true) then begin
//                 inserstatus := 'success*You have submitted this entry successfully!';
//             end else begin
//                 inserstatus := 'danger*Unknown Error Occured!';
//             end
//         end
//     end;

//     [NonDebuggable]
//     procedure fnDeleteIncomeStatementDetails(vendorNo: Code[20]; yearcode: Code[20]) status: Text
//     var
//         VendorIncomeStatement: Record "Vendor Audited Income Statemen";
//     begin

//         VendorIncomeStatement.Reset;
//         VendorIncomeStatement.SetRange("Vendor No.", vendorNo);
//         VendorIncomeStatement.SetRange("Audit Year Code Reference", yearcode);
//         if VendorIncomeStatement.FindSet then begin
//             if VendorIncomeStatement.Delete(true) then begin
//                 status := 'success*Your Income Statement details have been successfully deleted!'
//             end else begin
//                 status := 'danger*Your Income Statement details could not be deleted!'
//             end
//         end;
//     end;

//     procedure fnEditInsertIncomestatementDetails(bidresponsenumber: Code[20]; yearCode: Code[10]; totalRevenue: Decimal; totaCostofsoldgoods: Decimal; totaOperatingexpenses: Decimal; othernoneOperevenue: Decimal; interestExpense: Decimal; vendorNo: Code[20]) inserstatus: Text
//     begin
//         objBidResponseIncomeStatement.Reset;
//         objBidResponseIncomeStatement.SetRange("Vendor No.", vendorNo);
//         objBidResponseIncomeStatement.SetRange("Audit Year Code Reference", yearCode);
//         objBidResponseIncomeStatement.SetRange("No.", bidresponsenumber);
//         if objBidResponseIncomeStatement.FindSet then begin
//             objBidResponseIncomeStatement."Vendor No." := vendorNo;
//             objBidResponseIncomeStatement."Audit Year Code Reference" := yearCode;
//             objBidResponseIncomeStatement."Total Revenue (LCY)" := totalRevenue;
//             objBidResponseIncomeStatement."Total COGS (LCY)" := totaCostofsoldgoods;
//             objBidResponseIncomeStatement."Total Operating Expenses (LCY)" := totaOperatingexpenses;
//             objBidResponseIncomeStatement."Other Non-operating Re/Exp LCY" := othernoneOperevenue;
//             if objBidResponseIncomeStatement.Modify(true) then begin
//                 inserstatus := 'success*You have submitted this entry successfully!';
//             end else begin
//                 inserstatus := 'danger*Unknown Error Occured!';
//             end;
//         end;
//     end;

//     procedure fnBidResponseInsertIncomestatement(bidresponseNumber: Code[30]; yearCode: Code[10]; totalRevenue: Decimal; totaCostofsoldgoods: Decimal; totaOperatingexpenses: Decimal; othernoneOperevenue: Decimal; interestExpense: Decimal; vendorNo: Code[20]) inserstatus: Text
//     begin

//         objBidResponseIncomeStatement.Reset;
//         objBidResponseIncomeStatement.SetRange("Vendor No.", vendorNo);
//         objBidResponseIncomeStatement.SetRange("Audit Year Code Reference", yearCode);
//         objBidResponseIncomeStatement.SetRange("No.", bidresponseNumber);
//         if objBidResponseIncomeStatement.FindSet then begin
//             objBidResponseIncomeStatement.Reset;
//             objBidResponseIncomeStatement."No." := bidresponseNumber;
//             objBidResponseIncomeStatement."Vendor No." := vendorNo;
//             objBidResponseIncomeStatement."Audit Year Code Reference" := yearCode;
//             objBidResponseIncomeStatement."Total Revenue (LCY)" := totalRevenue;
//             objBidResponseIncomeStatement."Total COGS (LCY)" := totaCostofsoldgoods;
//             objBidResponseIncomeStatement."Total Operating Expenses (LCY)" := totaOperatingexpenses;
//             objBidResponseIncomeStatement."Other Non-operating Re/Exp LCY" := othernoneOperevenue;
//             objBidResponseIncomeStatement."Interest Expense (LCY)" := interestExpense;
//             if objBidResponseIncomeStatement.Modify(true) then begin
//                 inserstatus := 'success*You have submitted this entry successfully!';
//             end;
//         end else begin
//             objBidResponseIncomeStatement.Init;
//             objBidResponseIncomeStatement."No." := bidresponseNumber;
//             objBidResponseIncomeStatement."Vendor No." := vendorNo;
//             objBidResponseIncomeStatement."Audit Year Code Reference" := yearCode;
//             objBidResponseIncomeStatement."Total Revenue (LCY)" := totalRevenue;
//             objBidResponseIncomeStatement."Total COGS (LCY)" := totaCostofsoldgoods;
//             objBidResponseIncomeStatement."Total Operating Expenses (LCY)" := totaOperatingexpenses;
//             objBidResponseIncomeStatement."Other Non-operating Re/Exp LCY" := othernoneOperevenue;
//             objBidResponseIncomeStatement."Interest Expense (LCY)" := interestExpense;
//             if objBidResponseIncomeStatement.Insert(true) then begin
//                 inserstatus := 'success*You have submitted this entry successfully!';
//             end else begin
//                 inserstatus := 'danger*Unknown Error Occured!';
//             end
//         end
//     end;

//     [NonDebuggable]
//     procedure fnDeleteBidResponsIncomeStatamentDetails(vendorNo: Code[20]; yearcode: Code[20]; responsenumber: Code[40]) status: Text
//     var
//         VendoIncomeStatement: Record "Bid Audited Income Statement";
//     begin

//         VendoIncomeStatement.Reset;
//         VendoIncomeStatement.SetRange("Vendor No.", vendorNo);
//         VendoIncomeStatement.SetRange("No.", responsenumber);
//         VendoIncomeStatement.SetRange("Audit Year Code Reference", yearcode);
//         if VendoIncomeStatement.FindSet then begin
//             if VendoIncomeStatement.Delete(true) then begin
//                 status := 'success*Your Balance Sheet details have been successfully deleted!'
//             end else begin
//                 status := 'danger*Your Balance Sheet details could not be deleted!'
//             end
//         end;
//     end;

//     [NonDebuggable]
//     procedure fnDeleteBidResponsBalanceSheetDetails(vendorNo: Code[20]; yearcode: Code[20]; responsenumber: Code[40]) status: Text
//     var
//         VendorBalanceSheet: Record "Bid Audited Balance Sheet";
//     begin

//         VendorBalanceSheet.Reset;
//         VendorBalanceSheet.SetRange("Vendor No.", vendorNo);
//         VendorBalanceSheet.SetRange("No.", responsenumber);
//         VendorBalanceSheet.SetRange("Audit Year Code Reference", yearcode);
//         if VendorBalanceSheet.FindSet then begin
//             if VendorBalanceSheet.Delete(true) then begin
//                 status := 'success*Your Balance Sheet details have been successfully deleted!'
//             end else begin
//                 status := 'danger*Your Balance Sheet details could not be deleted!'
//             end
//         end;
//     end;

//     [NonDebuggable]
//     procedure fnDeleteBidResponsPastExperienceDetails(vendorNo: Code[20]; responsenumber: Code[40]) status: Text
//     var
//         VendorPastExperience: Record "Bid Past Experience";
//     begin

//         VendorPastExperience.Reset;
//         VendorPastExperience.SetRange("Vendor No.", vendorNo);
//         VendorPastExperience.SetRange("No.", responsenumber);
//         if VendorPastExperience.FindSet then begin
//             if VendorPastExperience.Delete(true) then begin
//                 status := 'success*Your Past Experience details have been successfully deleted!'
//             end else begin
//                 status := 'danger*Your Past Experience details could not be deleted!'
//             end
//         end;
//     end;

//     [NonDebuggable]
//     procedure fnDeleteBidResponTenderSecurity(vendorNo: Code[20]; responsenumber: Code[40]; securityid: Integer) status: Text
//     var
//         TenderBidSecurity: Record "Bid_Contract Security Register";
//     begin

//         TenderBidSecurity.Reset;
//         TenderBidSecurity.SetRange("Vendor No.", vendorNo);
//         TenderBidSecurity.SetRange("IFS No", responsenumber);
//         TenderBidSecurity.SetRange("Security ID", securityid);
//         if TenderBidSecurity.FindSet then begin
//             if TenderBidSecurity.Delete(true) then begin
//                 status := 'success*Your Tender Security details have been successfully deleted!'
//             end else begin
//                 status := 'danger*Your Tender Security details could not be deleted!'
//             end
//         end;
//     end;

//     procedure fnInsertFiledetails(vendorNo: Code[30]; procDoctype: Code[250]; docdescription: Text; certNo: Code[100]; issuedDate: Date; expiryDate: Date; fileName: Text; sharepointlink: Text) insertstatus: Text
//     begin
//         objFiledUploads.Init;
//         objFiledUploads."Vendor No" := vendorNo;
//         objFiledUploads."Procurement Document Type ID" := procDoctype;
//         objFiledUploads.Description := docdescription;
//         objFiledUploads."Certificate No." := certNo;
//         objFiledUploads."Date Filed" := Today;
//         objFiledUploads."Issue Date" := issuedDate;
//         objFiledUploads."Expiry Date" := expiryDate;
//         objFiledUploads."File Name" := fileName;
//         objFiledUploads."Procurement Process" := objFiledUploads."procurement process"::Registration;
//         if objFiledUploads.Insert(true) then begin
//             insertstatus := 'success*Document saved successfully!';
//         end
//         else begin
//             insertstatus := 'danger*Error occured!';
//         end
//     end;

//     procedure fnBidResponsePastExperience(bidresponseNumber: Code[30]; clientname: Code[70]; clientaddresss: Text; phonenumber: Text; county: Text; email: Text; projectscope: Text; projectname: Text; contractref: Code[80]; assignmentvalue: Decimal; assignmentstatus: Integer; assignmentstartdate: Date; assignmentenddate: Date; vendorNo: Code[20]) inserstatus: Text
//     begin

//         objPastExperience.Init;
//         objPastExperience."No." := bidresponseNumber;
//         objPastExperience."Vendor No." := vendorNo;
//         objPastExperience."Client Name" := clientname;
//         objPastExperience.Address := clientaddresss;
//         objPastExperience."Phone No." := phonenumber;
//         objPastExperience."Country/Region Code" := county;
//         objPastExperience."E-Mail" := email;
//         objPastExperience."Project Scope Summary" := projectscope;
//         objPastExperience."Assignment/Project Name" := projectname;
//         objPastExperience."Contract Ref No" := contractref;
//         objPastExperience."Assignment Value LCY" := assignmentvalue;
//         objPastExperience."Assignment Status" := assignmentstatus;
//         objPastExperience."Assignment Start Date" := assignmentstartdate;
//         objPastExperience."Assignment End Date" := assignmentenddate;
//         if objPastExperience.Insert then begin
//             inserstatus := 'success*You have submitted this entry successfully!';
//         end else begin
//             inserstatus := 'danger*Unknown Error Occured!';
//         end;
//     end;

//     procedure fnInsertStaffEntry(vendorNo: Code[12]; staffName: Text; profession: Text; designation: Text; phoneNumber: Code[15]; nationality: Code[30]; dateofBirth: Date; email: Text; joiningDate: Date; yearsWithFirm: Decimal; staffNumber: Code[20]; EmplymentType: Option) inserstatus: Text
//     begin
//         objProfstaff.SetRange("Vendor No.", vendorNo);
//         objProfstaff.SetRange("Staff Number", staffNumber);
//         if objProfstaff.FindSet then begin
//             objProfstaff.Reset;
//             objProfstaff."Vendor No." := vendorNo;
//             objProfstaff."Staff Name" := staffName;
//             objProfstaff."Staff Number" := staffNumber;
//             objProfstaff.Proffesion := profession;
//             objProfstaff."Current Designation" := designation;
//             objProfstaff."Phone No." := phoneNumber;
//             objProfstaff."Country/Region Code" := nationality;
//             objProfstaff."Date of Birth" := dateofBirth;
//             objProfstaff."E-Mail" := email;
//             objProfstaff."Joining Date" := joiningDate;
//             objProfstaff."Years With the Firm" := yearsWithFirm;
//             objProfstaff."Employment Type" := EmplymentType;
//             if objProfstaff.Modify(true) then begin
//                 inserstatus := 'success*Staff entry saved successfully!';
//             end;
//         end else begin
//             objProfstaff.Init;
//             objProfstaff."Vendor No." := vendorNo;
//             objProfstaff."Staff Name" := staffName;
//             objProfstaff."Staff Number" := staffNumber;
//             objProfstaff.Proffesion := profession;
//             objProfstaff."Current Designation" := designation;
//             objProfstaff."Phone No." := phoneNumber;
//             objProfstaff."Country/Region Code" := nationality;
//             objProfstaff."Date of Birth" := dateofBirth;
//             objProfstaff."E-Mail" := email;
//             objProfstaff."Joining Date" := joiningDate;
//             objProfstaff."Years With the Firm" := yearsWithFirm;
//             objProfstaff."Employment Type" := EmplymentType;
//             if objProfstaff.Insert then begin
//                 inserstatus := 'success*Staff entry saved successfully!';
//             end
//             else begin
//                 inserstatus := 'danger*Unknown error occured!'
//             end
//         end
//     end;

//     procedure fnInsertStaffQlfEntry(vendorNo: Code[12]; staffNIDorNumber: Code[20]; qualifCategory: Option; qualifcName: Text; institution: Text; startYear: Code[10]; endYear: Code[10]; outstandingAchievement: Text) inserstatus: Text
//     begin
//         objStaffQualif.Init;
//         objStaffQualif."Vendor No" := vendorNo;
//         objStaffQualif."Staff Id" := staffNIDorNumber;
//         objStaffQualif."Qualification Category" := qualifCategory;
//         objStaffQualif."Qualification Name" := qualifcName;
//         objStaffQualif.Institution := institution;
//         objStaffQualif."Start Year" := startYear;
//         objStaffQualif."End Year" := endYear;
//         objStaffQualif."Outstanding Achievements" := outstandingAchievement;
//         if objStaffQualif.Insert then begin
//             inserstatus := 'success*Staff qualification saved successfully!';
//         end
//         else begin
//             inserstatus := 'danger*Unknown error occured!'
//         end
//     end;

//     procedure fnInsertStaffXPrEntry(vendorNo: Code[12]; staffNIDorNumber: Code[20]; xPrCategory: Option; xPrSummarry: Text; assignmentDescription: Text; startYear: Code[10]; endYear: Code[10]; yrsofXpr: Decimal) inserstatus: Text
//     begin
//         objStaffXP.Init;
//         objStaffXP."Vendor No" := vendorNo;
//         objStaffXP."Staff ID" := staffNIDorNumber;
//         objStaffXP."Experience Category" := xPrCategory;
//         objStaffXP."Experience Summary" := xPrSummarry;
//         objStaffXP."Assignment Description" := assignmentDescription;
//         objStaffXP."Start Year" := startYear;
//         objStaffXP."End Year" := endYear;
//         objStaffXP."Years of Experience" := yrsofXpr;
//         if objStaffXP.Insert then begin
//             inserstatus := 'success*Staff Experience saved successfully!';
//         end
//         else begin
//             inserstatus := 'danger*Unknown error occured!'
//         end
//     end;

//     procedure fnCompleteSupplierReg(vendorNo: Code[20]) insertstatus: Text
//     begin
//         objVendor.Reset;
//         objVendor.SetRange("No.", vendorNo);
//         if objVendor.FindSet then begin
//             objVendor."Registrn Submitted onPortal" := true;
//             objVendor."Profile Complete" := true;
//             if objVendor.Modify() then begin
//                 insertstatus := 'success*You have successfully submitted your registration, kindly wait for Judiciary to review and communicate to you!';
//             end
//             else begin
//                 insertstatus := 'danger*Unknown error Occured!';
//             end
//         end
//         else begin

//         end
//     end;

//     procedure fnGetOwnerPercentage(vendorNo: Code[10]) percentage: Text
//     var
//         accruedpercentage: Decimal;
//     begin
//         objDirectors.Reset;
//         objDirectors.SetRange("Vendor No.", vendorNo);
//         objDirectors.CalcSums("Entity Ownership %");

//         accruedpercentage := objDirectors."Entity Ownership %";
//         if accruedpercentage > 100 then begin
//             percentage := 'danger*Ownership percentage cannot go beyond 100% by ' + '' + Format(-1 * (100 - accruedpercentage)) + '%';
//         end
//         else begin
//             percentage := 'success*Remaining ownership percentage is ' + '' + Format((100 - accruedpercentage));
//         end
//     end;

//     procedure fnInsertRFIresponseHeader(vendorNo: Code[20]; rfiDocumentNo: Code[12]) insertstatus: Text
//     var
//         rfiApplNo: Code[12];
//     begin
//         objVendor.Reset;
//         objVendor.SetRange("No.", vendorNo);
//         objVendor.SetRange("Profile Complete", true);
//         if objVendor.FindSet then begin

//             objRFIResponse.Reset;
//             objRFIResponse.SetRange("Vendor No.", vendorNo);
//             objRFIResponse.SetRange("RFI Document No.", rfiDocumentNo);
//             objRFIResponse.SetRange("Document Type", objRFIResponse."document type"::"IFP Response");
//             if objRFIResponse.FindSet then begin
//                 //edit entry
//                 insertstatus := 'success*' + fnGetLastDocumentNo(vendorNo, rfiDocumentNo);
//             end
//             else begin
//                 //fresh insert
//                 objRFIResponse.Init;
//                 objRFIResponse."Document Type" := objRFIResponse."document type"::"IFP Response";
//                 //objRFIResponse."Document Type":=DocumentType;

//                 ProcurementSetup.Get;
//                 if objRFIResponse."Document Type" = objRFIResponse."document type"::"IFP Response" then begin
//                     ProcurementSetup.TestField("IFP Response Nos");
//                     NoMgt.InitSeries(ProcurementSetup."IFP Response Nos", objRFIResponse."No. Series", 0D, objRFIResponse."Document No.", objRFIResponse."No. Series");
//                 end;

//                 objRFIResponse."RFI Document No." := rfiDocumentNo;
//                 objRFIResponse."Document Date" := Today;
//                 objRFIResponse."Vendor No." := vendorNo;
//                 objRFIResponse."Document Status" := objRFIResponse."document status"::Draft;
//                 objRFIResponse.Validate("Vendor No.");
//                 if objRFIResponse.Insert() then
//                     insertstatus := 'success*' + fnGetLastDocumentNo(vendorNo, rfiDocumentNo)
//                 else
//                     insertstatus := 'danger*Unknown error occured!';
//             end
//         end else begin
//             insertstatus := 'profileincomplete*Supplier Profile was not successfully completed';
//         end;
//     end;

//     procedure fnGetLastDocumentNoRegistration(vendorNo: Code[20]; rfiDocumentNo: Code[12]) insertstatus: Text
//     var
//         rfiApplNo: Code[12];
//     begin
//         objRFIResponse.Reset;
//         objRFIResponse.SetRange("Vendor No.", vendorNo);
//         objRFIResponse.SetRange("RFI Document No.", rfiDocumentNo);
//         objRFIResponse.SetRange("Document Type", objRFIResponse."document type"::"IFR Response");
//         if objRFIResponse.FindLast then begin
//             rfiApplNo := objRFIResponse."Document No.";
//             insertstatus := rfiApplNo;
//         end
//         else begin
//             insertstatus := 'danger*not found!';
//         end
//     end;

//     procedure fnGetLastDocumentNo(vendorNo: Code[20]; rfiDocumentNo: Code[12]) insertstatus: Text
//     var
//         rfiApplNo: Code[12];
//     begin
//         objRFIResponse.Reset;
//         objRFIResponse.SetRange("Vendor No.", vendorNo);
//         objRFIResponse.SetRange("RFI Document No.", rfiDocumentNo);
//         objRFIResponse.SetRange("Document Type", objRFIResponse."document type"::"IFP Response");
//         if objRFIResponse.FindLast then begin
//             rfiApplNo := objRFIResponse."Document No.";
//             insertstatus := rfiApplNo;
//         end
//         else begin
//             insertstatus := 'danger*not found!';
//         end
//     end;

//     procedure FnInsertIFRResponseLines(documentNo: Code[30]; procurementCategory: Code[30]; rfiDocumentNo: Code[30]; vendorNo: Code[30]; regionCode: Code[50]; constituencyCode: Code[50]; evalutionDecision: Option) insertstatus: Text
//     begin
//         objIFPResponseLine.Reset;
//         objIFPResponseLine.SetRange("Procurement Category", procurementCategory);
//         objIFPResponseLine.SetRange("Document Type", objIFPResponseLine."document type"::"IFR Response");
//         objIFPResponseLine.SetRange("RFI Document No.", rfiDocumentNo);
//         objIFPResponseLine."Document No." := documentNo;
//         objIFPResponseLine.SetRange("Vendor No.", vendorNo);
//         if objIFPResponseLine.FindSet then begin
//             objIFPResponseLine."Document No." := documentNo;
//             objIFPResponseLine."Vendor No." := vendorNo;
//             objIFPResponseLine."RFI Document No." := rfiDocumentNo;
//             objIFPResponseLine."Responsibility Center ID" := regionCode;
//             objIFPResponseLine.Validate("Responsibility Center ID");
//             objIFPResponseLine."Constituency Code" := constituencyCode;
//             objIFPResponseLine.Validate("Constituency Code");
//             objIFPResponseLine."Evaluation Decision" := evalutionDecision;
//             if objIFPResponseLine.Modify(true) then begin
//                 insertstatus := 'success*Item successfully modified!';
//             end;
//         end else begin
//             objIFPResponseLine.Init;
//             objIFPResponseLine."Document Type" := objIFPResponseLine."document type"::"IFR Response";
//             objIFPResponseLine."Document No." := documentNo;
//             objIFPResponseLine."RFI Document No." := rfiDocumentNo;
//             objIFPResponseLine."Procurement Category" := procurementCategory;
//             objIFPResponseLine.Validate("Procurement Category");
//             objIFPResponseLine."Vendor No." := vendorNo;
//             objIFPResponseLine."Responsibility Center ID" := regionCode;
//             objIFPResponseLine.Validate("Responsibility Center ID");
//             objIFPResponseLine."Constituency Code" := constituencyCode;
//             objIFPResponseLine.Validate("Constituency Code");
//             objIFPResponseLine."Evaluation Decision" := evalutionDecision;
//             if objIFPResponseLine.Insert(true) then
//                 insertstatus := 'success*Item successfully inserted!'
//             else
//                 insertstatus := 'danger*Unknown error while saving!';
//         end;
//     end;

//     procedure fnInsertRFIResponseLines(documentNo: Code[30]; procurementCategory: Code[30]; rfiDocumentNo: Code[30]; vendorNo: Code[30]; regionCode: Code[50]; constituencyCode: Code[50]; evalutionDecision: Option) insertstatus: Text
//     begin
//         objIFPResponseLine.Reset;
//         objIFPResponseLine.SetRange("Procurement Category", procurementCategory);
//         objIFPResponseLine.SetRange("Document Type", objIFPResponseLine."document type"::"IFP Response");
//         objIFPResponseLine.SetRange("RFI Document No.", rfiDocumentNo);
//         objIFPResponseLine."Document No." := documentNo;
//         objIFPResponseLine.SetRange("Vendor No.", vendorNo);
//         if objIFPResponseLine.FindSet then begin
//             objIFPResponseLine."Document No." := documentNo;
//             objIFPResponseLine."Vendor No." := vendorNo;
//             objIFPResponseLine."RFI Document No." := rfiDocumentNo;
//             objIFPResponseLine."Responsibility Center ID" := regionCode;
//             objIFPResponseLine.Validate("Responsibility Center ID");
//             objIFPResponseLine."Constituency Code" := constituencyCode;
//             objIFPResponseLine.Validate("Constituency Code");
//             objIFPResponseLine."Evaluation Decision" := evalutionDecision;
//             if objIFPResponseLine.Modify(true) then begin
//                 insertstatus := 'success*Item successfully modified!';
//             end;
//         end else begin
//             objIFPResponseLine.Init;
//             objIFPResponseLine."Document Type" := objIFPResponseLine."document type"::"IFP Response";
//             objIFPResponseLine."Document No." := documentNo;
//             objIFPResponseLine."RFI Document No." := rfiDocumentNo;
//             objIFPResponseLine."Procurement Category" := procurementCategory;
//             objIFPResponseLine.Validate("Procurement Category");
//             objIFPResponseLine."Vendor No." := vendorNo;
//             objIFPResponseLine."Responsibility Center ID" := regionCode;
//             objIFPResponseLine.Validate("Responsibility Center ID");
//             objIFPResponseLine."Constituency Code" := constituencyCode;
//             objIFPResponseLine.Validate("Constituency Code");
//             objIFPResponseLine."Evaluation Decision" := evalutionDecision;
//             if objIFPResponseLine.Insert(true) then
//                 insertstatus := 'success*Item successfully inserted!'
//             else
//                 insertstatus := 'danger*Unknown error while saving!';
//         end;
//     end;

//     procedure fnInsertRFIResponseLinesDetails(documentNo: Code[30]; procurementCategory: Code[30]; rfiDocumentNo: Code[30]; vendorNo: Code[30]) insertstatus: Text
//     begin
//         objIFPResponseLine.Reset;
//         objIFPResponseLine.SetRange("Procurement Category", procurementCategory);
//         objIFPResponseLine.SetRange("RFI Document No.", rfiDocumentNo);
//         objIFPResponseLine.SetRange("Vendor No.", vendorNo);

//         if objIFPResponseLine.FindSet then begin
//             //just modify
//             objIFPResponseLine."Document Type" := objIFPResponseLine."document type"::"IFP Response";
//             objIFPResponseLine."Document No." := documentNo;
//             if objIFPResponseLine.Modify then
//                 insertstatus := 'success*Item successfully modified!'
//             else
//                 insertstatus := 'danger*Unknown error while modifying!';
//         end else begin
//             objIFPResponseLine.Init;
//             objIFPResponseLine."Document Type" := objIFPResponseLine."document type"::"IFP Response";
//             objIFPResponseLine."Document No." := documentNo;
//             objIFPResponseLine."RFI Document No." := rfiDocumentNo;
//             objIFPResponseLine."Procurement Category" := procurementCategory;
//             objIFPResponseLine.Validate("Procurement Category");
//             objIFPResponseLine."Vendor No." := vendorNo;
//             if objIFPResponseLine.Insert then
//                 insertstatus := 'success*Item successfully inserted!'
//             else
//                 insertstatus := 'danger*Unknown error while saving!';

//         end
//     end;

//     procedure fnSubmitResponseFinal(vendorNo: Code[20]; rfiDocumentNo: Code[12]; repFullname: Text; repDesignation: Text; rfiApplNo: Code[10]) insertstatus: Text
//     begin
//         objRFIResponse.Reset;
//         objRFIResponse.SetRange("Vendor No.", vendorNo);
//         objRFIResponse.SetRange("RFI Document No.", rfiDocumentNo);
//         objRFIResponse.SetRange("Document No.", rfiApplNo);
//         objRFIResponse.SetRange("Document Type", objRFIResponse."document type"::"IFP Response");
//         if objRFIResponse.FindSet then begin
//             //modify entry
//             objRFIResponse."Vendor Representative Name" := repFullname;
//             objRFIResponse."Vendor Repr Designation" := repDesignation;
//             objRFIResponse."Document Status" := objRFIResponse."document status"::Submitted;
//             if objRFIResponse.Modify() then
//                 insertstatus := 'success*You have successfully submitted your response'
//             else
//                 insertstatus := 'danger*Unknown error occured!';
//         end
//         else begin
//             insertstatus := 'danger*error occured,call the office!';
//         end
//     end;

//     procedure fnPrequalificationResponseDetails(vendorNo: Code[20]; rfiDocumentNo: Code[12]; repFullname: Text; repDesignation: Text; rfiAppliNo: Code[50]; region: Code[50]; Constituency: Code[50]; registrationPeriod: Code[50]) insertstatus: Text
//     begin
//         objRFIResponse.Reset;
//         objRFIResponse.SetRange("Vendor No.", vendorNo);
//         objRFIResponse.SetRange("RFI Document No.", rfiDocumentNo);
//         objRFIResponse.SetRange("Document No.", rfiAppliNo);
//         //objRFIResponse.SETRANGE("Document Type", objRFIResponse."Document Type"::"IFP Response");
//         if objRFIResponse.FindSet then begin
//             objRFIResponse."Vendor Representative Name" := repFullname;
//             objRFIResponse."Vendor Repr Designation" := repDesignation;
//             objRFIResponse."Responsibility Center ID" := region;
//             objRFIResponse.Validate("Responsibility Center ID");
//             objRFIResponse."Constituency Code" := Constituency;
//             objRFIResponse.Validate("Constituency Code");
//             objRFIResponse."Registration Period" := registrationPeriod;
//             objRFIResponse.Validate("Registration Period");
//             objRFIResponse."Document Status" := objRFIResponse."document status"::Submitted;
//             if objRFIResponse.Modify() then
//                 insertstatus := 'success*You have successfully submitted your response'
//             else
//                 insertstatus := 'danger*Unknown error occured!';
//         end
//         else begin
//             insertstatus := 'danger*error occured,call the office!';
//         end
//     end;

//     procedure fnInsertFiledetails_Rfi(vendorNo: Code[30]; procDoctype: Code[250]; docdescription: Text; certNo: Code[100]; issuedDate: Date; expiryDate: Date; fileName: Text; documentNo: Code[20]) insertstatus: Text
//     begin
//         objRFIrespFiledDocument.Init;
//         objRFIrespFiledDocument."Document Type" := objRFIrespFiledDocument."document type"::"IFP Response";
//         objRFIrespFiledDocument."Vendor No" := vendorNo;
//         objRFIrespFiledDocument."Document No" := documentNo;
//         objRFIrespFiledDocument."Procurement Document Type ID" := procDoctype;
//         objRFIrespFiledDocument."Document Description" := docdescription;
//         objRFIrespFiledDocument."Certificate No." := certNo;
//         objRFIrespFiledDocument."Date Filed" := Today;
//         objRFIrespFiledDocument."Issue Date" := issuedDate;
//         objRFIrespFiledDocument."Expiry Date" := expiryDate;
//         objRFIrespFiledDocument."File Name" := fileName;
//         objRFIrespFiledDocument."Procurement Process" := objRFIrespFiledDocument."procurement process"::Prequalification;
//         if objRFIrespFiledDocument.Insert then begin
//             insertstatus := 'success*Document saved successfully!';
//         end
//         else begin
//             insertstatus := 'danger*Error occured!';
//         end
//     end;

//     procedure fnInsertPrequalificatinDocuments(vendorNo: Code[30]; procDoctype: Code[250]; docdescription: Text; certNo: Code[200]; issuedDate: Date; expiryDate: Date; fileName: Text; documentNo: Code[200]; SharepointLink: Text[500]) insertstatus: Text
//     var
//         RFIResponseFiledDocument: Record "RFI Response Filed Document";
//     begin

//         RFIResponseFiledDocument.Init;
//         RFIResponseFiledDocument."Document Type" := RFIResponseFiledDocument."document type"::"IFP Response";
//         RFIResponseFiledDocument."Vendor No" := vendorNo;
//         RFIResponseFiledDocument."Document No" := documentNo;
//         RFIResponseFiledDocument."Procurement Document Type ID" := procDoctype;
//         RFIResponseFiledDocument."Document Description" := docdescription;
//         RFIResponseFiledDocument."Certificate No." := certNo;
//         RFIResponseFiledDocument."Date Filed" := Today;
//         RFIResponseFiledDocument."Issue Date" := issuedDate;
//         RFIResponseFiledDocument."Expiry Date" := expiryDate;
//         RFIResponseFiledDocument."File Name" := fileName;
//         RFIResponseFiledDocument."Procurement Process" := RFIResponseFiledDocument."procurement process"::Prequalification;
//         RFIResponseFiledDocument."Document Link" := SharepointLink;
//         if RFIResponseFiledDocument.Insert then begin
//             insertstatus := 'success*Document saved successfully!';
//         end
//         else begin
//             insertstatus := 'danger*Error occured!';
//         end
//     end;

//     procedure fnInsertBidReponseDocuments(vendorNo: Code[30]; procDoctype: Code[250]; docdescription: Text; certNo: Code[200]; issuedDate: Date; expiryDate: Date; fileName: Text; documentNo: Code[200]; SharepointLink: Text[500]) insertstatus: Text
//     var
//         BidFiledDocument: Record "Bid Filed Document";
//     begin

//         BidFiledDocument.Init;
//         BidFiledDocument."Document Type" := BidFiledDocument."document type"::Quote;
//         BidFiledDocument."Vendor No" := vendorNo;
//         BidFiledDocument."No." := documentNo;
//         BidFiledDocument."Procurement Document Type ID" := procDoctype;
//         BidFiledDocument.Description := docdescription;
//         BidFiledDocument."Certificate No." := certNo;
//         BidFiledDocument."Date Filed" := Today;
//         BidFiledDocument."Issue Date" := issuedDate;
//         BidFiledDocument."Expiry Date" := expiryDate;
//         BidFiledDocument."File Name" := fileName;
//         BidFiledDocument."Procurement Process" := BidFiledDocument."procurement process"::"ITT Response";
//         BidFiledDocument."Document Link" := SharepointLink;
//         if BidFiledDocument.Insert then begin
//             insertstatus := 'success*Document saved successfully!';
//         end
//         else begin
//             insertstatus := 'danger*Error occured!';
//         end
//     end;

//     procedure fnSubmisionResponseStatus(rfiDocumentNo: Code[12]) insertstatus: Text
//     var
//         respStatus: Text;
//     begin
//         objRFIResponse.Reset;
//         objRFIResponse.SetRange("Document No.", rfiDocumentNo);
//         if objRFIResponse.FindSet then
//             insertstatus := Format(objRFIResponse."Document Status")
//         else
//             insertstatus := 'danger*notfound!';

//     end;

//     procedure fnGetEvalCritScores(templateID: Code[20]; evaluationType: Option) totals: Decimal
//     begin
//         objBidScoreCriteria.Reset;
//         objBidScoreCriteria.SetRange("Template ID", templateID);
//         objBidScoreCriteria.SetRange("Evaluation Type", evaluationType);

//         if objBidScoreCriteria.FindSet then begin
//             repeat
//                 objBidScoreCriteria.CalcSums("Total Weight %");
//                 totals := objBidScoreCriteria."Total Weight %";
//             until objBidScoreCriteria.Next = 0;
//         end else begin
//             totals := 0;
//         end
//     end;

//     procedure fnrfiResponsetLinks(rfnumber: Code[50]; filename: Text; sharepointlink: Text) status: Text
//     var
//         RFIResponse: Record "RFI Response";
//         RecordLink: Record "Record Link";
//         RecordIDNumber: RecordID;
//     begin
//         // Create Document Link to Sharepoint **********Obadiah Korir****************
//         RecordLink.Reset;
//         if RecordLink."Link ID" = 0 then begin
//             RecordLink.URL1 := sharepointlink;
//             RecordLink.Description := filename;
//             RecordLink.Type := RecordLink.Type::Link;
//             RecordLink.Company := COMPANYNAME;
//             RecordLink."User ID" := UserId;
//             RecordLink.Created := CreateDatetime(Today, Time);
//             RFIResponse.Reset;
//             RFIResponse."Document No." := rfnumber;
//             if RFIResponse.Find('=') then
//                 RecordIDNumber := RFIResponse.RecordId;
//             RecordLink."Record ID" := RecordIDNumber;
//             RecordLink.Insert(true);
//         end
//     end;

//     procedure fnSupplierRegistrationLinks(vendorNumber: Code[50]; filename: Text; sharepointlink: Text) status: Text
//     var
//         SupplierRegistration: Record Vendor;
//         RecordLink: Record "Record Link";
//         RecordIDNumber: RecordID;
//     begin
//         // Create Document Link to Sharepoint **********Obadiah Korir****************
//         RecordLink.Reset;
//         if RecordLink."Link ID" = 0 then begin
//             RecordLink.URL1 := sharepointlink;
//             RecordLink.Description := filename;
//             RecordLink.Type := RecordLink.Type::Link;
//             RecordLink.Company := COMPANYNAME;
//             RecordLink."User ID" := UserId;
//             RecordLink.Created := CreateDatetime(Today, Time);
//             SupplierRegistration.Reset;
//             SupplierRegistration."No." := vendorNumber;
//             if SupplierRegistration.Find('=') then
//                 RecordIDNumber := SupplierRegistration.RecordId;
//             RecordLink."Record ID" := RecordIDNumber;
//             RecordLink.Insert(true);
//         end
//     end;

//     procedure fnSubmitTenderResponse(vendornumber: Code[50]; invitationnumber: Code[50]) status: Text
//     var
//         Purch: Record "Purchase Header";
//         Vendor: Record Vendor;
//         BidOwner: Record "Bid Business Owner";
//         VendBusinessOwner: Record "Vendor Business Owner";
//         BidPreferences: Record "Bid Preference & Reservation";
//         VendSpecialGroup: Record "Vendor Special Group Entry";
//         BidLitigation: Record "Bid Litigation History";
//         VendLitigation: Record "Vendor Litigation History";
//         BidPastExperience: Record "Bid Past Experience";
//         VendPastExperience: Record "Vendor Past Experience";
//         BidAuditedBal: Record "Bid Audited Balance Sheet";
//         VendAuditedBal: Record "Vendor Audited Balance Sheet";
//         BidIncomeStat: Record "Bid Audited Income Statement";
//         VendIncomeStat: Record "Vendor Audited Income Statemen";
//         BidVendBankAccount: Record "Bid Vendor Bank Account";
//         VendBankAccount: Record "Vendor Bank Account";
//         BidKeyStaff: Record "Bid Key Staff";
//         VendKeyStaff: Record "Vendor Professional Staff";
//         BidKeyStaffQual: Record "Bid Key Staff Qualification";
//         VendKeyStaffQual: Record "Vendor Staff Qualification";
//         BidStaffExperience: Record "Bid Key Staff Experience";
//         VendStaffExperience: Record "Vendor Staff Experience";
//         IFS: Record "Standard Purchase Code";
//         IFSLines: Record "Standard Purchase Line";
//         PurchLines: Record "Purchase Line";
//         EntryNo: Integer;
//         BidEquipmentCompliance: Record "Bid Equipment Specification";
//         IFSRequiredEquipment: Record "IFS Required Equipment";
//     begin
//         objVendor.Reset;
//         objVendor.SetRange("No.", vendornumber);
//         objVendor.SETRANGE("Profile Complete", TRUE);
//         if objVendor.FindSet then begin

//             Purch.Reset;
//             Purch.SetRange("Invitation For Supply No", invitationnumber);
//             Purch.SetRange("Vendor No.", vendornumber);
//             Purch.SetRange("Document Type", Purch."document type"::Quote);
//             Purch.SetRange("Document Status", Purch."document status"::Draft);
//             if not Purch.FindSet then begin
//                 IFS.Reset;
//                 IFS.SetRange(Code, invitationnumber);
//                 if IFS.FindSet then begin
//                     Purch.Init;
//                     Purch."Document Type" := Purch."document type"::Quote;
//                     Purch."Invitation For Supply No" := invitationnumber;
//                     Purch."Pay-to Vendor No." := vendornumber;
//                     Purch."Vendor No." := vendornumber;
//                     Purch."Buy-from Vendor No." := vendornumber;
//                     Purch."Invitation Notice Type" := IFS."Invitation Notice Type";
//                     Purch."Bid Envelope Type" := IFS."Bid Envelop Type";
//                     Purch."Tender Description" := IFS."Tender Summary";
//                     Purch."Responsibility Center" := IFS."Responsibility Center";
//                     Purch.Validate(Purch."Location Code", IFS."Location Code");
//                     Purch."Language Code" := IFS."Language Code";
//                     Purch."Purchaser Code" := IFS."Purchaser Code";
//                     Purch."Currency Code" := IFS."Currency Code";
//                     Purch.Insert(true);
//                 end;
//                 IFSLines.Reset;
//                 IFSLines.SetRange("Standard Purchase Code", invitationnumber);
//                 if IFSLines.FindSet then begin
//                     Purch.Reset;
//                     Purch.SetRange("Invitation For Supply No", invitationnumber);
//                     Purch.SetRange("Vendor No.", vendornumber);
//                     if Purch.FindSet then begin
//                         repeat
//                             PurchLines.Init;
//                             PurchLines.Validate("Document Type", PurchLines."document type"::Quote);
//                             PurchLines.Validate("Document No.", Purch."No.");
//                             PurchLines.Validate("Line No.", IFSLines."Line No.");
//                             PurchLines."No." := IFSLines."No.";
//                             PurchLines.Validate(Type, IFSLines.Type);
//                             PurchLines.Validate("Item Category", IFSLines."Item Category");
//                             PurchLines.Validate(Description, IFSLines.Description);
//                             PurchLines.Quantity := IFSLines.Quantity;
//                             PurchLines.Validate("Unit of Measure Code", IFSLines."Unit of Measure Code");
//                             PurchLines.Validate("Shortcut Dimension 1 Code", IFSLines."Shortcut Dimension 1 Code");
//                             PurchLines.Validate("Shortcut Dimension 2 Code", IFSLines."Shortcut Dimension 2 Code");
//                             PurchLines.Validate("Variant Code", IFSLines."Variant Code");
//                             // PurchLines."Contract Type":=IFSLines."Contract Type";
//                             PurchLines.Validate("Dimension Set ID", IFSLines."Dimension Set ID");
//                             PurchLines.Insert(true);
//                         until IFSLines.Next = 0;
//                     end;
//                 end;
//                 Vendor.Reset;
//                 Vendor.SetRange("No.", vendornumber);
//                 if Vendor.FindSet then begin
//                     Purch.Reset;
//                     //Purch.VALIDATE("Buy-from Vendor No.");
//                     //Purch.VALIDATE("Pay-to Name");
//                     //Purch.VALIDATE("Vendor No.");
//                     //Purch.VALIDATE("Pay-to Vendor No.");
//                     Purch."Building/House No" := Vendor."Building/House No";
//                     Purch."Plot No" := Vendor."Plot No";
//                     Purch.Street := Vendor.Street;
//                     Purch."Nature of Business" := Vendor."Nature of Business";
//                     Purch."Current Trade Licence No" := Vendor."Current Trade Licence No";
//                     Purch."Trade Licence Expiry Date" := Vendor."Trade Licence Expiry Date";
//                     Purch."Max Value of Business" := Vendor."Max Value of Business";
//                     Purch."Preferred Bank Account Code" := Vendor."Preferred Bank Account Code";
//                     Purch."Business Type" := Vendor."Business Type";
//                     Purch."Nominal Capital LCY" := Vendor."Nominal Capital LCY";
//                     Purch."Issued Capital LCY" := Vendor."Issued Capital LCY";
//                     Purch.Modify(true)
//                 end;
//                 //a)Owners/Directors
//                 Purch.Reset;
//                 Purch.SetRange("Invitation For Supply No", invitationnumber);
//                 Purch.SetRange("Vendor No.", vendornumber);
//                 if Purch.FindSet then begin
//                     Purch.Validate("Invitation For Supply No");
//                     Vendor.Reset;
//                     Vendor.SetRange("No.", vendornumber);
//                     if Vendor.FindSet then begin
//                         Purch.Validate("Buy-from Vendor No.");
//                         Purch.Validate("Pay-to Vendor No.");
//                         Purch."Buy-from Vendor Name" := Vendor.Name;
//                         Purch."Building/House No" := Vendor."Building/House No";
//                         Purch."Plot No" := Vendor."Plot No";
//                         Purch.Street := Vendor.Street;
//                         Purch."Nature of Business" := Vendor."Nature of Business";
//                         Purch."Current Trade Licence No" := Vendor."Current Trade Licence No";
//                         Purch."Trade Licence Expiry Date" := Vendor."Trade Licence Expiry Date";
//                         Purch."Max Value of Business" := Vendor."Max Value of Business";
//                         Purch."Preferred Bank Account Code" := Vendor."Preferred Bank Account Code";
//                         Purch."Business Type" := Vendor."Business Type";
//                         Purch."Nominal Capital LCY" := Vendor."Nominal Capital LCY";
//                         Purch."Issued Capital LCY" := Vendor."Issued Capital LCY";
//                         Purch.Modify(true);
//                     end;
//                     BidOwner.Reset;
//                     BidOwner.SetRange(No, Purch."No.");
//                     if not BidOwner.FindSet then begin
//                         VendBusinessOwner.Reset;
//                         VendBusinessOwner.SetRange("Vendor No.", Purch."Vendor No.");
//                         VendBusinessOwner.SetRange(Blocked, false);
//                         if VendBusinessOwner.FindSet then begin
//                             repeat
//                                 BidOwner.Init;
//                                 BidOwner."Document Type" := Purch."Document Type";
//                                 BidOwner.No := Purch."No.";
//                                 BidOwner."Vendor No." := Purch."Vendor No.";
//                                 BidOwner."Entry No." := VendBusinessOwner."Entry No.";
//                                 BidOwner.Name := VendBusinessOwner.Name;
//                                 BidOwner.Address := VendBusinessOwner.Address;
//                                 BidOwner."Post Code" := VendBusinessOwner."Post Code";
//                                 BidOwner."Address 2" := VendBusinessOwner."Address 2";
//                                 BidOwner.City := VendBusinessOwner.City;
//                                 BidOwner."Phone No." := VendBusinessOwner."Phone No.";
//                                 BidOwner."Nationality ID" := VendBusinessOwner."Nationality ID";
//                                 BidOwner."Citizenship Type" := VendBusinessOwner."Citizenship Type";
//                                 BidOwner."ID/Passport No." := VendBusinessOwner."ID/Passport No.";
//                                 BidOwner."Entity Ownership %" := VendBusinessOwner."Entity Ownership %";
//                                 BidOwner."Share Types" := VendBusinessOwner."Share Types";
//                                 BidOwner."No. of Shares" := VendBusinessOwner."No. of Shares";
//                                 BidOwner."Nominal Value/Share" := VendBusinessOwner."Nominal Value/Share";
//                                 BidOwner."Total Nominal Value" := VendBusinessOwner."Total Nominal Value";
//                                 BidOwner."Ownership Effective Date" := VendBusinessOwner."Ownership Effective Date";
//                                 BidOwner.Blocked := VendBusinessOwner.Blocked;
//                                 BidOwner.Insert(true);
//                             until VendBusinessOwner.Next = 0;
//                         end;
//                     end;
//                 end;
//                 //b)Preference and Reservations
//                 Purch.Reset;
//                 Purch.SetRange("Invitation For Supply No", invitationnumber);
//                 Purch.SetRange("Buy-from Vendor No.", vendornumber);
//                 if Purch.FindSet then begin
//                     BidPreferences.Reset;
//                     BidPreferences.SetRange("Document No.", Purch."No.");
//                     if not BidPreferences.FindSet then begin
//                         BidPreferences.Reset;
//                         if BidPreferences.FindLast then
//                             EntryNo := BidPreferences."Entry No";
//                         VendSpecialGroup.Reset;
//                         VendSpecialGroup.SetRange("Vendor No", Purch."Vendor No.");
//                         VendSpecialGroup.SetRange(Blocked, false);
//                         if VendSpecialGroup.FindSet then begin
//                             repeat
//                                 BidPreferences.Init;
//                                 BidPreferences."Document Type" := Purch."Document Type";
//                                 BidPreferences."Document No." := Purch."No.";
//                                 BidPreferences."Entry No" := EntryNo + 1;
//                                 BidPreferences."Vendor No." := Purch."Vendor No.";
//                                 BidPreferences."AGPO Certificate No" := VendSpecialGroup."Certifcate No";
//                                 BidPreferences."Registered Special Group" := VendSpecialGroup."Registered Special Group";
//                                 BidPreferences."Products/Service Category" := VendSpecialGroup."Products/Service Category";
//                                 BidPreferences."Certificate Effective Date" := VendSpecialGroup."Effective Date";
//                                 BidPreferences."Certificate Expiry Date" := VendSpecialGroup."Certificate Expiry Date";
//                                 BidPreferences."Certifying Agency" := VendSpecialGroup."Certifying Agency";
//                                 BidPreferences.Insert(true);
//                                 EntryNo += 1;
//                             until VendSpecialGroup.Next = 0;
//                         end;
//                     end;
//                 end;
//                 //c)Litigation History
//                 Purch.Reset;
//                 Purch.SetRange("Invitation For Supply No", invitationnumber);
//                 Purch.SetRange("Vendor No.", vendornumber);
//                 if Purch.FindSet then begin
//                     BidLitigation.Reset;
//                     BidLitigation.SetRange("No.", Purch."No.");
//                     if not BidLitigation.FindSet then begin
//                         VendLitigation.Reset;
//                         // VendLitigation.SetRange("Vendor No.", Purch."Vendor No.");
//                         if VendLitigation.FindSet then begin
//                             repeat
//                                 BidLitigation.Init;
//                                 BidLitigation."Document Type" := Purch."Document Type";
//                                 BidLitigation."No." := Purch."No.";
//                                 BidLitigation."Vendor No." := Purch."Vendor No.";
//                                 BidLitigation."Entry No." := VendLitigation."Entry No.";
//                                 // BidLitigation."Dispute Matter" := VendLitigation."Dispute Matter";
//                                 // BidLitigation."Other Dispute Party" := VendLitigation."Other Dispute Party";
//                                 // BidLitigation."Dispute Amount LCY" := VendLitigation."Dispute Amount LCY";
//                                 // BidLitigation."Category of Matter" := VendLitigation."Category of Matter";
//                                 // BidLitigation.Year := VendLitigation.Year;
//                                 // BidLitigation."Award Type" := VendLitigation."Award Type";
//                                 BidLitigation.Insert(true);
//                             until VendLitigation.Next = 0;
//                         end;
//                     end;
//                 end;
//                 //d)Past Experience
//                 Purch.Reset;
//                 Purch.SetRange("Invitation For Supply No", invitationnumber);
//                 Purch.SetRange("Vendor No.", vendornumber);
//                 if Purch.FindSet then begin
//                     BidPastExperience.Reset;
//                     BidPastExperience.SetRange("No.", Purch."No.");
//                     if not BidPastExperience.FindSet then begin
//                         VendPastExperience.Reset;
//                         VendPastExperience.SetRange("Vendor No.", Purch."Vendor No.");
//                         if VendPastExperience.FindSet then begin
//                             repeat
//                                 BidPastExperience.Init;
//                                 BidPastExperience."Document Type" := Purch."Document Type";
//                                 BidPastExperience."No." := Purch."No.";
//                                 BidPastExperience."Vendor No." := Purch."Vendor No.";
//                                 BidPastExperience."Entry No." := VendPastExperience."Entry No.";
//                                 BidPastExperience."Client Name" := VendPastExperience."Client Name";
//                                 BidPastExperience.Address := VendPastExperience.Address;
//                                 BidPastExperience."Address 2" := VendPastExperience."Address 2";
//                                 BidPastExperience."Country/Region Code" := VendPastExperience."Country/Region Code";
//                                 BidPastExperience."E-Mail" := VendPastExperience."E-Mail";
//                                 BidPastExperience."Primary Contact Person" := VendPastExperience."Primary Contact Person";
//                                 BidPastExperience."Primary Contact Designation" := VendPastExperience."Primary Contact Designation";
//                                 BidPastExperience."Primary Contact Tel" := VendPastExperience."Primary Contact Tel";
//                                 BidPastExperience."Primary Contact Email" := VendPastExperience."Primary Contact Email";
//                                 BidPastExperience."Assignment/Project Name" := VendPastExperience."Assignment Name";
//                                 BidPastExperience."Project Scope Summary" := VendPastExperience."Project Scope Summary";
//                                 BidPastExperience."Delivery Location" := VendPastExperience."Delivery Location";
//                                 BidPastExperience."Contract Ref No" := VendPastExperience."Contract Ref No";
//                                 BidPastExperience."Assignment Start Date" := VendPastExperience."Assignment Start Date";
//                                 BidPastExperience."Assignment End Date" := VendPastExperience."Assignment End Date";
//                                 BidPastExperience."Assignment Value LCY" := VendPastExperience."Assignment Value LCY";
//                                 BidPastExperience."Assignment Status" := VendPastExperience."Assignment Status";
//                                 BidPastExperience.Insert(true);
//                             until VendPastExperience.Next = 0;
//                         end;
//                     end;
//                 end;

//                 //e)Audited Balance Sheet-
//                 Purch.Reset;
//                 Purch.SetRange("Invitation For Supply No", invitationnumber);
//                 Purch.SetRange("Vendor No.", vendornumber);
//                 if Purch.FindSet then begin
//                     BidAuditedBal.Reset;
//                     BidAuditedBal.SetRange("No.", Purch."No.");
//                     if not BidAuditedBal.FindSet then begin
//                         VendAuditedBal.Reset;
//                         VendAuditedBal.SetRange("Vendor No.", Purch."Vendor No.");
//                         if VendAuditedBal.FindSet then begin
//                             repeat
//                                 BidAuditedBal.Init;
//                                 BidAuditedBal."Document Type" := Purch."Document Type";
//                                 BidAuditedBal."No." := Purch."No.";
//                                 BidAuditedBal."Vendor No." := vendornumber;
//                                 BidAuditedBal."Audit Year Code Reference" := VendAuditedBal."Audit Year Code Reference";
//                                 BidAuditedBal."Current Assets (LCY)" := VendAuditedBal."Current Assets (LCY)";
//                                 BidAuditedBal."Fixed Assets (LCY)" := VendAuditedBal."Fixed Assets (LCY)";
//                                 BidAuditedBal."Total Assets (LCY)" := VendAuditedBal."Total Assets (LCY)";
//                                 BidAuditedBal."Current Liabilities (LCY)" := VendAuditedBal."Current Liabilities (LCY)";
//                                 BidAuditedBal."Long-term Liabilities (LCY)" := VendAuditedBal."Long-term Liabilities (LCY)";
//                                 BidAuditedBal."Total Liabilities (LCY)" := VendAuditedBal."Total Liabilities (LCY)";
//                                 BidAuditedBal."Owners Equity (LCY)" := VendAuditedBal."Owners Equity (LCY)";
//                                 BidAuditedBal."Total Liabilities & Equity(LCY" := VendAuditedBal."Total Liabilities & Equity(LCY";
//                                 BidAuditedBal."Debt Ratio" := VendAuditedBal."Debt Ratio";
//                                 BidAuditedBal."Current Ratio" := VendAuditedBal."Current Ratio";
//                                 BidAuditedBal."Working Capital (LCY)" := VendAuditedBal."Working Capital (LCY)";
//                                 BidAuditedBal."Assets-To-Equity Ratio" := VendAuditedBal."Assets-To-Equity Ratio";
//                                 BidAuditedBal."Debt-To-Equity Ratio" := VendAuditedBal."Debt-To-Equity Ratio";
//                                 BidAuditedBal.Insert(true);
//                             until VendAuditedBal.Next = 0;

//                         end;
//                     end;
//                 end;
//                 //f)Audited Income Statement-
//                 Purch.Reset;
//                 Purch.SetRange("Invitation For Supply No", invitationnumber);
//                 Purch.SetRange("Vendor No.", vendornumber);
//                 if Purch.FindSet then begin
//                     BidIncomeStat.Reset;
//                     BidIncomeStat.SetRange("No.", Purch."No.");
//                     if not BidIncomeStat.FindSet then begin
//                         VendIncomeStat.Reset;
//                         VendIncomeStat.SetRange("Vendor No.", Purch."Vendor No.");
//                         if VendIncomeStat.FindSet then begin
//                             repeat
//                                 BidIncomeStat.Init;
//                                 BidIncomeStat."Document Type" := Purch."Document Type";
//                                 BidIncomeStat."No." := Purch."No.";
//                                 BidIncomeStat."Vendor No." := vendornumber;
//                                 BidIncomeStat."Audit Year Code Reference" := VendIncomeStat."Audit Year Code Reference";
//                                 BidIncomeStat."Total Revenue (LCY)" := VendIncomeStat."Total Revenue (LCY)";
//                                 BidIncomeStat."Total COGS (LCY)" := VendIncomeStat."Total COGS (LCY)";
//                                 BidIncomeStat."Gross Margin (LCY)" := VendIncomeStat."Gross Margin (LCY)";
//                                 BidIncomeStat."Total Operating Expenses (LCY)" := VendIncomeStat."Total Operating Expenses (LCY)";
//                                 BidIncomeStat."Operating Income/EBIT (LCY)" := VendIncomeStat."Operating Income/EBIT (LCY)";
//                                 BidIncomeStat."Other Non-operating Re/Exp LCY" := VendIncomeStat."Other Non-operating Re/Exp LCY";
//                                 BidIncomeStat."Interest Expense (LCY)" := VendIncomeStat."Interest Expense (LCY)";
//                                 BidIncomeStat."Income Before Taxes (LCY)" := VendIncomeStat."Income Before Taxes (LCY)";
//                                 BidIncomeStat."Income Tax Expense (LCY)" := VendIncomeStat."Income Tax Expense (LCY)";
//                                 BidIncomeStat."Net Income from Ops  (LCY)" := VendIncomeStat."Net Income from Ops  (LCY)";
//                                 BidIncomeStat."Below-the-line Items (LCY)" := VendIncomeStat."Below-the-line Items (LCY)";
//                                 BidIncomeStat."Net Income" := VendIncomeStat."Net Income";
//                                 BidIncomeStat.Insert(true);
//                             until VendIncomeStat.Next = 0;
//                         end;
//                     end;
//                 end;
//                 //g)Vendor Bank Accounts
//                 Purch.Reset;
//                 Purch.SetRange("Invitation For Supply No", invitationnumber);
//                 Purch.SetRange("Vendor No.", vendornumber);
//                 if Purch.FindSet then begin
//                     BidVendBankAccount.Reset;
//                     BidVendBankAccount.SetRange("No.", Purch."No.");
//                     if not BidVendBankAccount.FindSet then begin
//                         VendBankAccount.Reset;
//                         VendBankAccount.SetRange("Vendor No.", Purch."Vendor No.");
//                         if VendBankAccount.FindSet then begin
//                             repeat
//                                 BidVendBankAccount.Init;
//                                 BidVendBankAccount."Document Type" := Purch."Document Type";
//                                 BidVendBankAccount."No." := Purch."No.";
//                                 BidVendBankAccount."Vendor No." := vendornumber;
//                                 BidVendBankAccount.Code := VendBankAccount.Code;
//                                 BidVendBankAccount.Name := VendBankAccount.Name;
//                                 BidVendBankAccount."Available Credit Line Valu" := VendBankAccount."Available Credit Line Valu";
//                                 BidVendBankAccount."Currency Code" := VendBankAccount."Currency Code";
//                                 BidVendBankAccount.Address := VendBankAccount.Address;
//                                 BidVendBankAccount."Address 2" := VendBankAccount."Address 2";
//                                 BidVendBankAccount."Post Code" := VendBankAccount."Post Code";
//                                 BidVendBankAccount.City := VendBankAccount.City;
//                                 BidVendBankAccount."Country/Region Code" := VendBankAccount."Country/Region Code";
//                                 BidVendBankAccount."Phone No." := VendBankAccount."Phone No.";
//                                 BidVendBankAccount."Bank Account No." := VendBankAccount."Bank Account No.";
//                                 BidVendBankAccount."Bank Branch No." := VendBankAccount."Bank Branch No.";
//                                 BidVendBankAccount.Contact := VendBankAccount.Contact;
//                                 BidVendBankAccount."Telex No." := VendBankAccount."Telex No.";
//                                 BidVendBankAccount."Transit No." := VendBankAccount."Transit No.";
//                                 BidVendBankAccount.County := VendBankAccount.County;
//                                 BidVendBankAccount."Fax No." := VendBankAccount."Fax No.";
//                                 BidVendBankAccount."Telex Answer Back" := VendBankAccount."Telex Answer Back";
//                                 BidVendBankAccount."Language Code" := VendBankAccount."Language Code";
//                                 BidVendBankAccount."E-Mail" := VendBankAccount."E-Mail";
//                                 BidVendBankAccount."Home Page" := VendBankAccount."Home Page";
//                                 BidVendBankAccount.Iban := VendBankAccount.Iban;
//                                 BidVendBankAccount."SWIFT Code" := VendBankAccount."SWIFT Code";
//                                 BidVendBankAccount."Bank Clearing Code" := VendBankAccount."Bank Clearing Code";
//                                 BidVendBankAccount."Bank Clearing Standard" := VendBankAccount."Bank Clearing Standard";
//                                 BidVendBankAccount.Insert(true);
//                             until VendBankAccount.Next = 0;
//                         end;

//                     end;
//                 end;
//                 //h)Key staff

//                 Purch.Reset;
//                 Purch.SetRange("Invitation For Supply No", invitationnumber);
//                 Purch.SetRange("Vendor No.", vendornumber);
//                 if Purch.FindSet then begin
//                     VendKeyStaff.Reset;
//                     VendKeyStaff.SetRange("Vendor No.", Purch."Vendor No.");
//                     if VendKeyStaff.FindSet then begin
//                         repeat
//                             BidKeyStaff.Init;
//                             BidKeyStaff."Document Type" := Purch."Document Type";
//                             BidKeyStaff."No." := Purch."No.";
//                             BidKeyStaff."Vendor No." := vendornumber;
//                             BidKeyStaff."Staff No." := VendKeyStaff."Staff Number";
//                             BidKeyStaff."Staff Name" := VendKeyStaff."Staff Name";
//                             BidKeyStaff."Years with Firm" := VendKeyStaff."Years With the Firm";
//                             BidKeyStaff."Staff Category" := VendKeyStaff."Staff Category";
//                             BidKeyStaff."Phone No." := VendKeyStaff."Phone No.";
//                             BidKeyStaff.Nationality := VendKeyStaff.Nationality;
//                             BidKeyStaff."E-Mail" := VendKeyStaff."E-Mail";
//                             BidKeyStaff.Insert(true);
//                         until VendKeyStaff.Next = 0;
//                     end;
//                 end;
//                 //i)Key Staff Qualifications-
//                 Purch.Reset;
//                 Purch.SetRange("Invitation For Supply No", invitationnumber);
//                 Purch.SetRange("Vendor No.", vendornumber);
//                 if Purch.FindSet then begin
//                     VendKeyStaffQual.Reset;
//                     VendKeyStaffQual.SetRange("Vendor No", vendornumber);
//                     if VendKeyStaffQual.FindSet then begin
//                         repeat
//                             BidKeyStaffQual.Init;
//                             BidKeyStaffQual."Document Type" := Purch."Document Type";
//                             BidKeyStaffQual."No." := Purch."No.";
//                             BidKeyStaffQual."Vendor No." := vendornumber;
//                             BidKeyStaffQual."Staff No." := VendKeyStaffQual."Staff Id";
//                             BidKeyStaffQual."Entry No" := VendKeyStaffQual."Entry No";
//                             BidKeyStaffQual."Qualification Category" := VendKeyStaffQual."Qualification Category";
//                             BidKeyStaffQual."Qualification Name" := VendKeyStaffQual."Qualification Name";
//                             BidKeyStaffQual.Institution := VendKeyStaffQual.Institution;
//                             BidKeyStaffQual."Start Year" := VendKeyStaffQual."Start Year";
//                             BidKeyStaffQual."End Year" := VendKeyStaffQual."End Year";
//                             BidKeyStaffQual."Outstanding Achievements" := VendKeyStaffQual."Outstanding Achievements";
//                             BidKeyStaffQual.Insert(true);
//                         until VendKeyStaffQual.Next = 0;
//                     end;
//                 end;
//                 //j)Key Staff Experience-
//                 Purch.Reset;
//                 Purch.SetRange("Invitation For Supply No", invitationnumber);
//                 Purch.SetRange("Vendor No.", vendornumber);
//                 if Purch.FindSet then begin
//                     VendStaffExperience.Reset;
//                     VendStaffExperience.SetRange("Vendor No", vendornumber);
//                     if VendStaffExperience.FindSet then begin
//                         repeat
//                             BidStaffExperience.Init;
//                             BidStaffExperience."Document Type" := Purch."Document Type";
//                             BidStaffExperience."No." := Purch."No.";
//                             BidStaffExperience."Vendor No." := vendornumber;
//                             BidStaffExperience."Staff No." := VendStaffExperience."Staff ID";
//                             BidStaffExperience."Entry No" := VendStaffExperience."Entry No";
//                             BidStaffExperience."Experience Category" := VendStaffExperience."Experience Category";
//                             BidStaffExperience."Years of Experience" := VendStaffExperience."Years of Experience";
//                             BidStaffExperience."Experience Summary" := VendStaffExperience."Experience Summary";
//                             BidStaffExperience."Sample Assignments/Projects" := VendStaffExperience."Assignment Description";
//                             BidStaffExperience."Experience From Year" := VendStaffExperience."Start Year";
//                             BidStaffExperience."Experience To Year" := VendStaffExperience."End Year";
//                             BidStaffExperience.Insert(true);
//                         until VendStaffExperience.Next = 0;
//                     end;
//                 end;

//                 //K Equipment Specifications.
//                 /* Purch.RESET;
//                  Purch.SETRANGE("Invitation For Supply No",invitationnumber);
//                  Purch.SETRANGE("Vendor No.",vendornumber);
//                  IF Purch.FINDSET THEN BEGIN
//                    IFSRequiredEquipment.RESET;
//                    IFSRequiredEquipment.SETRANGE("Document No",invitationnumber);
//                    IFSRequiredEquipment.SETRANGE(Blocked,FALSE);
//                       IF IFSRequiredEquipment.FINDSET THEN BEGIN
//                         REPEAT
//                           BidEquipmentCompliance.INIT;
//                           BidEquipmentCompliance."No.":=Purch."No.";
//                           BidEquipmentCompliance."Equipment Type Code":=IFSRequiredEquipment."Equipment Type Code";
//                           BidEquipmentCompliance.Description:=IFSRequiredEquipment.Description;
//                           BidEquipmentCompliance."Qty of Equipment":=IFSRequiredEquipment."Minimum Required Qty";
//                           BidEquipmentCompliance.INSERT(TRUE);
//                           UNTIL IFSRequiredEquipment.NEXT=0;
//                     END;
//                   END;
//                   */
//                 status := 'success*This has been created';
//             end else begin
//                 status := 'found*Your application is in draft status, you can continue to submit!';
//             end
//         end else begin
//             status := 'profileincomplete*Supplier Profile was not successfully completed';
//         end;


//     end;

//     procedure fngetBidResponseNumber(InvitationNumber: Code[100]; VendorNumber: Code[100]) responseNumber: Code[100]
//     var
//         PurchaseHeader: Record "Purchase Header";
//     begin
//         PurchaseHeader.Reset;
//         PurchaseHeader.SetRange("Pay-to Vendor No.", VendorNumber);
//         PurchaseHeader.SetRange("Document Type", PurchaseHeader."document type"::Quote);
//         PurchaseHeader.SetRange("Invitation For Supply No", InvitationNumber);
//         if PurchaseHeader.FindLast then begin
//             responseNumber := PurchaseHeader."No.";
//         end else begin
//             responseNumber := '';
//         end;
//     end;

//     procedure fnInserBidInfoTab1(vendorNo: Code[20]; ittNumber: Code[20]; bidderRepName: Text; bidderRepDesignation: Text; bidderRepAddr: Text; bidderWitnessName: Text; bidderWitnessDesignation: Text; bidderWitnessAddr: Text) insertstatus: Text
//     begin
//         Purch.Reset;
//         Purch.SetRange("No.", ittNumber);
//         Purch.SetRange("Vendor No.", vendorNo);
//         Purch.SetRange("Document Status", Purch."document status"::Draft);
//         if Purch.FindSet then begin
//             Purch."Bidder Representative Name" := bidderRepName;
//             Purch."Bidder Representative Desgn" := bidderRepDesignation;
//             Purch."Bidder Representative Address" := bidderRepAddr;
//             Purch."Bidder Witness Name" := bidderWitnessName;
//             Purch."Bidder Witness Designation" := bidderWitnessDesignation;
//             Purch."Bidder Witness Address" := bidderWitnessAddr;
//             if Purch.Modify then
//                 insertstatus := 'success*Bidder Representative saved successfully!'
//             else
//                 insertstatus := 'danger*Error saving your info, contact Judiciary Office!'
//         end
//         else begin
//             insertstatus := 'danger*Some details not found!'
//         end
//     end;

//     procedure fnInserBidGeneralDetails(vendorNo: Code[20]; ittNumber: Code[20]; bidderRepName: Text; bidderRepDesignation: Text; bidderRepAddr: Text; bidderWitnessName: Text; bidderWitnessDesignation: Text; bidderWitnessAddr: Text; bidderpaymentrefrence: Text; biddertype: Integer; bidderdocumentssource: Code[10]; bidderjointventure: Text) insertstatus: Text
//     begin
//         Purch.Reset;
//         Purch.SetRange("No.", ittNumber);
//         Purch.SetRange("Vendor No.", vendorNo);
//         Purch.SetRange("Document Status", Purch."document status"::Draft);
//         if Purch.FindSet then begin
//             Purch."Bidder Representative Name" := bidderRepName;
//             Purch."Bidder Representative Desgn" := bidderRepDesignation;
//             Purch."Bidder Representative Address" := bidderRepAddr;
//             if Purch.Modify(true) then
//                 insertstatus := 'success*Bidder Representative saved successfully!'
//             else
//                 insertstatus := 'danger*Error saving your info, contact Judiciary Office!'
//         end
//         else begin
//             insertstatus := 'danger*Some details not found!'
//         end
//     end;

//     procedure FnInsertBidPersonnelDetails(vendorNo: Code[20]; biddernumber: Code[20]; staffName: Text; staffcategory: Option; emplymentType: Option; EmailAddress: Text; Profession: Text; ProjectRoleCode: Code[100]; requiredProjectRole: Text; sharepointlink: Text; filename: Text) insertstatus: Text
//     var
//         bidKeyStaff: Record "Bid Key Staff";
//     begin
//         // Amos - Disabled Edit section use ; entryNo: Integer to check which value to edit
//         // bidKeyStaff.Reset;
//         // bidKeyStaff.SetRange("No.", biddernumber);
//         // bidKeyStaff.SetRange("Document Type", bidKeyStaff."document type"::Quote);
//         // //bidKeyStaff.SetRange("Entry No.", entryNo);
//         // if bidKeyStaff.FindSet then begin
//         //     bidKeyStaff."Vendor No." := vendorNo;
//         //     bidKeyStaff."No." := biddernumber;
//         //     bidKeyStaff."Staff Name" := staffName;
//         //     bidKeyStaff."Staff Category" := staffcategory;
//         //     bidKeyStaff.Validate("Staff Category");
//         //     bidKeyStaff."Employment Type" := emplymentType;
//         //     bidKeyStaff."E-Mail" := EmailAddress;
//         //     bidKeyStaff.Profession := Profession;
//         //     bidKeyStaff."Proposed Project Role ID" := ProjectRoleCode;
//         //     bidKeyStaff.Validate("Proposed Project Role ID");
//         //     bidKeyStaff."Required Project Role" := requiredProjectRole;
//         //     if bidKeyStaff.Modify(true) then begin
//         //         fnInsertLinks(biddernumber, sharepointlink, filename);
//         //         insertstatus := 'success*Bidder Personnel saved successfully!'
//         //     end;
//         // end else begin
//         bidKeyStaff.Init;
//         bidKeyStaff."No." := biddernumber;
//         bidKeyStaff."Staff Name" := staffName;
//         bidKeyStaff."Staff Category" := staffcategory;
//         bidKeyStaff.Validate("Staff Category");
//         bidKeyStaff."Employment Type" := emplymentType;
//         bidKeyStaff."E-Mail" := EmailAddress;
//         bidKeyStaff.Profession := Profession;
//         bidKeyStaff."Proposed Project Role ID" := ProjectRoleCode;
//         bidKeyStaff.Validate("Proposed Project Role ID");
//         bidKeyStaff."Required Project Role" := requiredProjectRole;
//         if bidKeyStaff.Insert(true) then begin
//             fnInsertLinks(biddernumber, sharepointlink, filename);
//             insertstatus := 'success*Bidder personnel saved successfully!'
//         end else begin
//             insertstatus := 'danger*Error saving your info, contact Judiciary Office!'
//         end;
//         // end;

//     end;

//     procedure fnInsertBidEquipmentsDetails(vendorNo: Code[20]; biddernumber: Code[20]; equipmentcategory: Code[20]; ownershiptypes: Integer; equipmentyearsused: Decimal; equipmentcondition: Integer; equipmentusabilitycode: Integer; equipmentserialnumber: Text; equipmentsQuantity: Decimal; sharepointlink: Text; filename: Text) insertstatus: Text
//     begin

//         objBidResponseEquipments.Reset;
//         objBidResponseEquipments.SetRange("No.", biddernumber);
//         objBidResponseEquipments.SetRange("Equipment Type Code", equipmentcategory);
//         objBidResponseEquipments.SetRange("Equipment Serial", objBidResponseEquipments."Equipment Serial");
//         objBidResponseEquipments.SetRange("Document Type", objBidResponseEquipments."document type"::Quote);
//         if objBidResponseEquipments.FindSet then begin
//             objBidResponseEquipments."No." := biddernumber;
//             objBidResponseEquipments."Ownership Type" := ownershiptypes;
//             objBidResponseEquipments."Equipment Type Code" := equipmentcategory;
//             objBidResponseEquipments.Validate("Equipment Type Code");
//             objBidResponseEquipments."Years of Previous Use" := equipmentyearsused;
//             objBidResponseEquipments."Equipment Condition Code" := equipmentcondition;
//             objBidResponseEquipments."Equipment Usability Code" := equipmentusabilitycode;
//             objBidResponseEquipments."Equipment Serial" := equipmentserialnumber;
//             objBidResponseEquipments."Qty of Equipment" := equipmentsQuantity;
//             if objBidResponseEquipments.Modify(true) then begin
//                 fnInsertLinks(biddernumber, sharepointlink, filename);
//                 insertstatus := 'success*Bidder Equipments saved successfully!'
//             end;
//         end else begin
//             objBidResponseEquipments.Init;
//             objBidResponseEquipments."No." := biddernumber;
//             objBidResponseEquipments."Equipment Type Code" := equipmentcategory;
//             objBidResponseEquipments."Document Type" := objBidResponseEquipments."document type"::Quote;
//             objBidResponseEquipments."No." := biddernumber;
//             objBidResponseEquipments."Ownership Type" := ownershiptypes;
//             objBidResponseEquipments."Equipment Type Code" := equipmentcategory;
//             objBidResponseEquipments.Validate("Equipment Type Code");
//             objBidResponseEquipments."Years of Previous Use" := equipmentyearsused;
//             objBidResponseEquipments."Equipment Condition Code" := equipmentcondition;
//             objBidResponseEquipments."Equipment Usability Code" := equipmentusabilitycode;
//             objBidResponseEquipments."Equipment Serial" := equipmentserialnumber;
//             objBidResponseEquipments."Qty of Equipment" := equipmentsQuantity;
//             if objBidResponseEquipments.Insert(true) then begin
//                 fnInsertLinks(biddernumber, sharepointlink, filename);
//                 insertstatus := 'success*Bidder Equipments saved successfully!'
//             end else begin
//                 insertstatus := 'danger*Error saving your info, contact Judiciary Office!'
//             end;
//         end;

//     end;

//     procedure fnAddBidPrefr(agpoCertNo: Code[50]; vendornumber: Code[50]; invitationnumber: Code[50]; registeredSpecialgrpe: Code[50]; productorserviceCategory: Text; certEffectiveDate: Date; certXpiryDate: Date) insertstatus: Text
//     begin
//         Purch.SetRange("No.", invitationnumber);
//         Purch.SetRange("Vendor No.", vendornumber);
//         if Purch.FindSet then begin
//             BidPreferences.Init;
//             BidPreferences."Document Type" := Purch."Document Type";
//             BidPreferences."Document No." := Purch."No.";
//             BidPreferences."Vendor No." := Purch."Vendor No.";
//             BidPreferences."AGPO Certificate No" := agpoCertNo;
//             BidPreferences."Registered Special Group" := registeredSpecialgrpe;
//             BidPreferences."Products/Service Category" := productorserviceCategory;
//             BidPreferences."Certificate Effective Date" := certEffectiveDate;
//             BidPreferences."Certificate Expiry Date" := certXpiryDate;
//             if BidPreferences.Insert then begin
//                 insertstatus := 'success*Your Bid Preference entry inserted successfully!';
//             end else begin
//                 insertstatus := 'danger*Unknown error occured!';
//             end
//         end;
//     end;

//     procedure fnDeleteBidAuditedBalsheet(auditYearCode: Code[20]; vendorNo: Code[30]; responseNo: Code[30]) deleteStatus: Text
//     begin
//         BidAuditedBal.Reset;
//         BidAuditedBal.SetRange("Audit Year Code Reference", auditYearCode);
//         BidAuditedBal.SetRange("Vendor No.", vendorNo);
//         BidAuditedBal.SetRange("No.", responseNo);
//         if BidAuditedBal.FindSet then begin
//             if BidAuditedBal.Delete then
//                 deleteStatus := 'success*Balance sheet entry Removed successfully!'
//             else
//                 deleteStatus := 'danger*Error while deleting..!'
//         end
//         else begin
//             Error('entry not found!');
//         end
//     end;

//     procedure ResetSendEmail(emailaddress: Text)
//     var
//         DynasoftPortalUser: Record "Dynasoft Portal User";
//         SMTPMailSetup: Record "Email Account";
//         Email2: Text;
//         Body: Text;
//         SMTP: Codeunit Mail;
//         SMTPMail: Codeunit "Email Message";
//         Smail: Codeunit EMail;
//         Subject: Text;
//     begin
//         DynasoftPortalUser.Reset;
//         DynasoftPortalUser.SetRange("Authentication Email", emailaddress);
//         DynasoftPortalUser.SetRange("Record Type", DynasoftPortalUser."Record Type"::Vendor);
//         if DynasoftPortalUser.FindSet then begin
//             CompInfo.get();
//             Subject := 'Account Password Reset ';
//             Body := 'Dear, ' + DynasoftPortalUser."Full Name" + ' your password for the account: ' + ' <strong>' + DynasoftPortalUser."Authentication Email" + '</strong> has been reset successfully. Kindly use the password below to access your account<br> <strong>Password: ' + DynasoftPortalUser."Password Value" + '</strong> <br>';
//             Body := Body + ' ' + 'Kind Regards, ' + CompInfo.Name + ' < br ><br>';
//             Body := Body + '[This email is automated. Kindly do not reply to it]<br><br>';
//             SMTPMail.Create(emailaddress, Subject, Body, true);
//             Smail.Send(SMTPMail, Enum::"Email Scenario"::Default);
//         end;
//     end;

//     procedure fnSubmitRFQResponse(vendornumber: Code[50]; invitationnumber: Code[50]) status: Text
//     var
//         Purch: Record "Purchase Header";
//         Vendor: Record Vendor;
//         BidOwner: Record "Bid Business Owner";
//         VendBusinessOwner: Record "Vendor Business Owner";
//         BidPreferences: Record "Bid Preference & Reservation";
//         VendSpecialGroup: Record "Vendor Special Group Entry";
//         BidLitigation: Record "Bid Litigation History";
//         VendLitigation: Record "Vendor Litigation History";
//         BidPastExperience: Record "Bid Past Experience";
//         VendPastExperience: Record "Vendor Past Experience";
//         BidAuditedBal: Record "Bid Audited Balance Sheet";
//         VendAuditedBal: Record "Vendor Audited Balance Sheet";
//         BidIncomeStat: Record "Bid Audited Income Statement";
//         VendIncomeStat: Record "Vendor Audited Income Statemen";
//         BidVendBankAccount: Record "Bid Vendor Bank Account";
//         VendBankAccount: Record "Vendor Bank Account";
//         BidKeyStaff: Record "Bid Key Staff";
//         VendKeyStaff: Record "Vendor Professional Staff";
//         BidKeyStaffQual: Record "Bid Key Staff Qualification";
//         VendKeyStaffQual: Record "Vendor Staff Qualification";
//         BidStaffExperience: Record "Bid Key Staff Experience";
//         VendStaffExperience: Record "Vendor Staff Experience";
//         IFS: Record "Standard Purchase Code";
//         IFSLines: Record "Standard Purchase Line";
//         PurchLines: Record "Purchase Line";
//         EntryNo: Integer;
//         BidEquipmentCompliance: Record "Bid Equipment Specification";
//         IFSRequiredEquipment: Record "IFS Required Equipment";
//     begin
//         objVendor.Reset;
//         objVendor.SetRange("No.", vendornumber);
//         objVendor.SetRange("Profile Complete", true);
//         if objVendor.findfirst then begin

//             Purch.Reset;
//             Purch.SetRange("Invitation For Supply No", invitationnumber);
//             Purch.SetRange("Vendor No.", vendornumber);
//             Purch.SetRange("Document Type", Purch."document type"::Quote);
//             Purch.SetRange("Document Status", Purch."document status"::Draft);
//             if not Purch.FindSet then begin
//                 IFS.Reset;
//                 IFS.SetRange(Code, invitationnumber);
//                 if IFS.FindSet then begin
//                     Purch.Init;
//                     Purch."Document Type" := Purch."document type"::Quote;
//                     Purch."Invitation For Supply No" := invitationnumber;
//                     Purch."Pay-to Vendor No." := vendornumber;
//                     Purch."Vendor No." := vendornumber;
//                     Purch."Buy-from Vendor No." := vendornumber;
//                     Purch."Invitation Notice Type" := IFS."Invitation Notice Type";
//                     Purch."Bid Envelope Type" := IFS."Bid Envelop Type";
//                     Purch."Tender Description" := IFS."Tender Summary";
//                     Purch."Responsibility Center" := IFS."Responsibility Center";
//                     Purch.Validate(Purch."Location Code", IFS."Location Code");
//                     Purch."Language Code" := IFS."Language Code";
//                     Purch."Purchaser Code" := IFS."Purchaser Code";
//                     Purch."Currency Code" := IFS."Currency Code";
//                     Purch."Linked IFS No." := invitationnumber;
//                     Purch.Insert(true);
//                 end;
//                 IFSLines.Reset;
//                 IFSLines.SetRange("Standard Purchase Code", invitationnumber);
//                 if IFSLines.FindSet then begin
//                     Purch.Reset;
//                     Purch.SetRange("Invitation For Supply No", invitationnumber);
//                     Purch.SetRange("Vendor No.", vendornumber);
//                     if Purch.FindSet then begin
//                         repeat
//                             PurchLines.Init;
//                             PurchLines."Document Type" := PurchLines."document type"::Quote;
//                             PurchLines."Document No." := Purch."No.";
//                             PurchLines."Line No." := IFSLines."Line No.";
//                             PurchLines.Validate("Buy-from Vendor No.", Purch."Vendor No.");
//                             PurchLines.Type := IFSLines.Type;
//                             PurchLines."Pay-to Vendor No." := Purch."Vendor No.";
//                             PurchLines."No." := IFSLines."No.";
//                             PurchLines."Location Code" := IFS."Location Code";
//                             //PurchLines."Posting Group":=IFSLines
//                             PurchLines.Description := IFSLines.Description;
//                             PurchLines."Description 2" := IFSLines.Description;
//                             PurchLines."Unit of Measure Code" := IFSLines."Unit of Measure Code";
//                             //PurchLines."Unit of Measure":=IFSLines."Unit of Measure Code";
//                             //PurchLines.VALIDATE(PurchLines.Description,IFSLines.Description);
//                             PurchLines.Validate(PurchLines.Quantity, IFSLines.Quantity);
//                             //MESSAGE('%1',PurchLines.Quantity);
//                             //PurchLines.Quantity:=IFSLines.Quantity;
//                             //PurchLines."Direct Unit Cost":=IFSLines."Amount Excl. VAT";

//                             PurchLines."Shortcut Dimension 1 Code" := IFSLines."Shortcut Dimension 2 Code";
//                             PurchLines."Shortcut Dimension 2 Code" := IFSLines."Shortcut Dimension 2 Code";
//                             PurchLines."Procurement Plan ID" := IFSLines."Procurement Plan ID";
//                             PurchLines."Procurement Plan Entry No" := IFSLines."Procurement Plan Entry No";
//                             PurchLines."Direct Unit Cost Inc. VAT" := 0;
//                             PurchLines."Direct Unit Cost" := 0;
//                             /*PurchLines."Variant Code":=IFSLines."Variant Code";
//                             PurchLines."Dimension Set ID":=IFSLines."Dimension Set ID";
//                             PurchLines."Item Category":=IFSLines."Item Category";*/
//                             PurchLines.Insert(true);
//                             PurchLines."Direct Unit Cost Inc. VAT" := 0;
//                             PurchLines."Direct Unit Cost" := 0;
//                             PurchLines.Modify(true);
//                         /* PurchLines.INIT;
//                          PurchLines."Document Type":=PurchLines."Document Type"::Quote;
//                          PurchLines."Document No.":=Purch."No.";
//                          PurchLines.Type:=IFSLines.Type;
//                          PurchLines."Line No.":=IFSLines."Line No.";
//                          PurchLines."No.":=IFSLines."No.";
//                          PurchLines."Location Code":=IFS."Location Code";
//                          PurchLines."Unit of Measure Code":=IFSLines."Unit of Measure Code";
//                          //PurchLines.VALIDATE(PurchLines.Quantity,IFSLines.Quantity);
//                          */

//                         /* // PurchLines.VALIDATE("Document Type",PurchLines."Document Type"::Quote);
//                          // PurchLines.VALIDATE("Document No.",Purch."No.");
//                          // PurchLines.VALIDATE("Line No.",IFSLines."Line No.");
//                         //  PurchLines."No.":=IFSLines."No.";
//                         //  PurchLines."Direct Unit Cost Inc. VAT":=0;
//                         //  PurchLines."Direct Unit Cost":=0;
//                          */
//                         // PurchLines.validate(type,ifslines.type);
//                         // PurchLines.validate("item category",ifslines."item category");
//                         // PurchLines.validate(description,ifslines.description);
//                         // PurchLines.quantity:=ifslines.quantity;
//                         // PurchLines.VALIDATE("Unit of Measure Code",IFSLines."Unit of Measure Code");
//                         // PurchLines.VALIDATE("Shortcut Dimension 1 Code",IFSLines."Shortcut Dimension 1 Code");
//                         // PurchLines.VALIDATE("Shortcut Dimension 2 Code",IFSLines."Shortcut Dimension 2 Code");
//                         //PurchLines.VALIDATE("Variant Code",IFSLines."Variant Code");
//                         // PurchLines.VALIDATE("Dimension Set ID",IFSLines."Dimension Set ID");

//                         // PurchLines.INSERT(TRUE);
//                         until IFSLines.Next = 0;
//                     end;
//                 end;

//                 Vendor.Reset;
//                 Vendor.SetRange("No.", vendornumber);
//                 if Vendor.FindSet then begin
//                     Purch.Reset;
//                     //Purch.VALIDATE("Buy-from Vendor No.");
//                     //Purch.VALIDATE("Pay-to Name");
//                     //Purch.VALIDATE("Vendor No.");
//                     //Purch.VALIDATE("Pay-to Vendor No.");
//                     Purch."Building/House No" := Vendor."Building/House No";
//                     Purch."Plot No" := Vendor."Plot No";
//                     Purch.Street := Vendor.Street;
//                     Purch."Nature of Business" := Vendor."Nature of Business";
//                     Purch."Current Trade Licence No" := Vendor."Current Trade Licence No";
//                     Purch."Trade Licence Expiry Date" := Vendor."Trade Licence Expiry Date";
//                     Purch."Max Value of Business" := Vendor."Max Value of Business";
//                     Purch."Preferred Bank Account Code" := Vendor."Preferred Bank Account Code";
//                     Purch."Business Type" := Vendor."Business Type";
//                     Purch."Nominal Capital LCY" := Vendor."Nominal Capital LCY";
//                     Purch."Issued Capital LCY" := Vendor."Issued Capital LCY";
//                     Purch.Modify(true)
//                 end;
//                 //a)Owners/Directors
//                 Purch.Reset;
//                 Purch.SetRange("Invitation For Supply No", invitationnumber);
//                 Purch.SetRange("Vendor No.", vendornumber);
//                 if Purch.FindSet then begin
//                     Purch.Validate("Invitation For Supply No");
//                     Vendor.Reset;
//                     Vendor.SetRange("No.", vendornumber);
//                     if Vendor.FindSet then begin
//                         //Purch.Validate("Buy-from Vendor No.");
//                         //Purch.Validate("Pay-to Vendor No.");
//                         Purch."Buy-from Vendor Name" := Vendor.Name;
//                         Purch."Building/House No" := Vendor."Building/House No";
//                         Purch."Plot No" := Vendor."Plot No";
//                         Purch.Street := Vendor.Street;
//                         Purch."Nature of Business" := Vendor."Nature of Business";
//                         Purch."Current Trade Licence No" := Vendor."Current Trade Licence No";
//                         Purch."Trade Licence Expiry Date" := Vendor."Trade Licence Expiry Date";
//                         Purch."Max Value of Business" := Vendor."Max Value of Business";
//                         Purch."Preferred Bank Account Code" := Vendor."Preferred Bank Account Code";
//                         Purch."Business Type" := Vendor."Business Type";
//                         Purch."Nominal Capital LCY" := Vendor."Nominal Capital LCY";
//                         Purch."Issued Capital LCY" := Vendor."Issued Capital LCY";
//                         Purch.Modify(true);
//                     end;
//                     BidOwner.Reset;
//                     BidOwner.SetRange(No, Purch."No.");
//                     if not BidOwner.FindSet then begin
//                         VendBusinessOwner.Reset;
//                         VendBusinessOwner.SetRange("Vendor No.", Purch."Vendor No.");
//                         VendBusinessOwner.SetRange(Blocked, false);
//                         if VendBusinessOwner.FindSet then begin
//                             repeat
//                                 BidOwner.Init;
//                                 BidOwner."Document Type" := Purch."Document Type";
//                                 BidOwner.No := Purch."No.";
//                                 BidOwner."Vendor No." := Purch."Vendor No.";
//                                 BidOwner."Entry No." := VendBusinessOwner."Entry No.";
//                                 BidOwner.Name := VendBusinessOwner.Name;
//                                 BidOwner.Address := VendBusinessOwner.Address;
//                                 BidOwner."Post Code" := VendBusinessOwner."Post Code";
//                                 BidOwner."Address 2" := VendBusinessOwner."Address 2";
//                                 BidOwner.City := VendBusinessOwner.City;
//                                 BidOwner."Phone No." := VendBusinessOwner."Phone No.";
//                                 BidOwner."Nationality ID" := VendBusinessOwner."Nationality ID";
//                                 BidOwner."Citizenship Type" := VendBusinessOwner."Citizenship Type";
//                                 BidOwner."ID/Passport No." := VendBusinessOwner."ID/Passport No.";
//                                 BidOwner."Entity Ownership %" := VendBusinessOwner."Entity Ownership %";
//                                 BidOwner."Share Types" := VendBusinessOwner."Share Types";
//                                 BidOwner."No. of Shares" := VendBusinessOwner."No. of Shares";
//                                 BidOwner."Nominal Value/Share" := VendBusinessOwner."Nominal Value/Share";
//                                 BidOwner."Total Nominal Value" := VendBusinessOwner."Total Nominal Value";
//                                 BidOwner."Ownership Effective Date" := VendBusinessOwner."Ownership Effective Date";
//                                 BidOwner.Blocked := VendBusinessOwner.Blocked;
//                                 BidOwner.Insert(true);
//                             until VendBusinessOwner.Next = 0;
//                         end;
//                     end;
//                 end;
//                 //b)Preference and Reservations
//                 Purch.Reset;
//                 Purch.SetRange("Invitation For Supply No", invitationnumber);
//                 Purch.SetRange("Buy-from Vendor No.", vendornumber);
//                 if Purch.FindSet then begin
//                     BidPreferences.Reset;
//                     BidPreferences.SetRange("Document No.", Purch."No.");
//                     if not BidPreferences.FindSet then begin
//                         BidPreferences.Reset;
//                         if BidPreferences.FindLast then
//                             EntryNo := BidPreferences."Entry No";
//                         VendSpecialGroup.Reset;
//                         VendSpecialGroup.SetRange("Vendor No", Purch."Vendor No.");
//                         VendSpecialGroup.SetRange(Blocked, false);
//                         if VendSpecialGroup.FindSet then begin
//                             repeat
//                                 BidPreferences.Init;
//                                 BidPreferences."Document Type" := Purch."Document Type";
//                                 BidPreferences."Document No." := Purch."No.";
//                                 BidPreferences."Entry No" := EntryNo + 1;
//                                 BidPreferences."Vendor No." := Purch."Vendor No.";
//                                 BidPreferences."AGPO Certificate No" := VendSpecialGroup."Certifcate No";
//                                 BidPreferences."Registered Special Group" := VendSpecialGroup."Registered Special Group";
//                                 BidPreferences."Products/Service Category" := VendSpecialGroup."Products/Service Category";
//                                 BidPreferences."Certificate Effective Date" := VendSpecialGroup."Effective Date";
//                                 BidPreferences."Certificate Expiry Date" := VendSpecialGroup."Certificate Expiry Date";
//                                 BidPreferences."Certifying Agency" := VendSpecialGroup."Certifying Agency";
//                                 BidPreferences.Insert(true);
//                                 EntryNo += 1;
//                             until VendSpecialGroup.Next = 0;
//                         end;
//                     end;
//                 end;
//                 //c)Litigation History
//                 Purch.Reset;
//                 Purch.SetRange("Invitation For Supply No", invitationnumber);
//                 Purch.SetRange("Vendor No.", vendornumber);

//                 if Purch.FindSet then begin
//                     BidLitigation.Reset;
//                     BidLitigation.SetRange("No.", Purch."No.");
//                     if not BidLitigation.FindSet then begin
//                         VendLitigation.Reset;
//                         // VendLitigation.SetRange("Vendor No.", Purch."Vendor No.");
//                         // if VendLitigation.FindSet then begin
//                         //     repeat
//                         //         BidLitigation.Init;
//                         //         BidLitigation."Document Type" := Purch."Document Type";
//                         //         BidLitigation."No." := Purch."No.";
//                         //         BidLitigation."Vendor No." := Purch."Vendor No.";
//                         //         BidLitigation."Entry No." := VendLitigation."Entry No.";
//                         //         BidLitigation."Dispute Matter" := VendLitigation."Dispute Matter";
//                         //         BidLitigation."Other Dispute Party" := VendLitigation."Other Dispute Party";
//                         //         BidLitigation."Dispute Amount LCY" := VendLitigation."Dispute Amount LCY";
//                         //         BidLitigation."Category of Matter" := VendLitigation."Category of Matter";
//                         //         BidLitigation.Year := VendLitigation.Year;
//                         //         BidLitigation."Award Type" := VendLitigation."Award Type";
//                         //         BidLitigation.Insert(true);
//                         //     until VendLitigation.Next = 0;
//                         // end;
//                     end;
//                 end;
//                 //d)Past Experience
//                 Purch.Reset;
//                 Purch.SetRange("Invitation For Supply No", invitationnumber);
//                 Purch.SetRange("Vendor No.", vendornumber);
//                 if Purch.FindSet then begin
//                     BidPastExperience.Reset;
//                     BidPastExperience.SetRange("No.", Purch."No.");
//                     if not BidPastExperience.FindSet then begin
//                         VendPastExperience.Reset;
//                         VendPastExperience.SetRange("Vendor No.", Purch."Vendor No.");
//                         if VendPastExperience.FindSet then begin
//                             repeat
//                                 BidPastExperience.Init;
//                                 BidPastExperience."Document Type" := Purch."Document Type";
//                                 BidPastExperience."No." := Purch."No.";
//                                 BidPastExperience."Vendor No." := Purch."Vendor No.";
//                                 BidPastExperience."Entry No." := VendPastExperience."Entry No.";
//                                 BidPastExperience."Client Name" := VendPastExperience."Client Name";
//                                 BidPastExperience.Address := VendPastExperience.Address;
//                                 BidPastExperience."Address 2" := VendPastExperience."Address 2";
//                                 BidPastExperience."Country/Region Code" := VendPastExperience."Country/Region Code";
//                                 BidPastExperience."E-Mail" := VendPastExperience."E-Mail";
//                                 BidPastExperience."Primary Contact Person" := VendPastExperience."Primary Contact Person";
//                                 BidPastExperience."Primary Contact Designation" := VendPastExperience."Primary Contact Designation";
//                                 BidPastExperience."Primary Contact Tel" := VendPastExperience."Primary Contact Tel";
//                                 BidPastExperience."Primary Contact Email" := VendPastExperience."Primary Contact Email";
//                                 BidPastExperience."Assignment/Project Name" := VendPastExperience."Assignment Name";
//                                 BidPastExperience."Project Scope Summary" := VendPastExperience."Project Scope Summary";
//                                 BidPastExperience."Delivery Location" := VendPastExperience."Delivery Location";
//                                 BidPastExperience."Contract Ref No" := VendPastExperience."Contract Ref No";
//                                 BidPastExperience."Assignment Start Date" := VendPastExperience."Assignment Start Date";
//                                 BidPastExperience."Assignment End Date" := VendPastExperience."Assignment End Date";
//                                 BidPastExperience."Assignment Value LCY" := VendPastExperience."Assignment Value LCY";
//                                 BidPastExperience."Assignment Status" := VendPastExperience."Assignment Status";
//                                 BidPastExperience.Insert(true);
//                             until VendPastExperience.Next = 0;
//                         end;
//                     end;
//                 end;

//                 //e)Audited Balance Sheet-
//                 Purch.Reset;
//                 Purch.SetRange("Invitation For Supply No", invitationnumber);
//                 Purch.SetRange("Vendor No.", vendornumber);
//                 if Purch.FindSet then begin
//                     BidAuditedBal.Reset;
//                     BidAuditedBal.SetRange("No.", Purch."No.");
//                     if not BidAuditedBal.FindSet then begin
//                         VendAuditedBal.Reset;
//                         VendAuditedBal.SetRange("Vendor No.", Purch."Vendor No.");
//                         if VendAuditedBal.FindSet then begin
//                             repeat
//                                 BidAuditedBal.Init;
//                                 BidAuditedBal."Document Type" := Purch."Document Type";
//                                 BidAuditedBal."No." := Purch."No.";
//                                 BidAuditedBal."Vendor No." := vendornumber;
//                                 BidAuditedBal."Audit Year Code Reference" := VendAuditedBal."Audit Year Code Reference";
//                                 BidAuditedBal."Current Assets (LCY)" := VendAuditedBal."Current Assets (LCY)";
//                                 BidAuditedBal."Fixed Assets (LCY)" := VendAuditedBal."Fixed Assets (LCY)";
//                                 BidAuditedBal."Total Assets (LCY)" := VendAuditedBal."Total Assets (LCY)";
//                                 BidAuditedBal."Current Liabilities (LCY)" := VendAuditedBal."Current Liabilities (LCY)";
//                                 BidAuditedBal."Long-term Liabilities (LCY)" := VendAuditedBal."Long-term Liabilities (LCY)";
//                                 BidAuditedBal."Total Liabilities (LCY)" := VendAuditedBal."Total Liabilities (LCY)";
//                                 BidAuditedBal."Owners Equity (LCY)" := VendAuditedBal."Owners Equity (LCY)";
//                                 BidAuditedBal."Total Liabilities & Equity(LCY" := VendAuditedBal."Total Liabilities & Equity(LCY";
//                                 BidAuditedBal."Debt Ratio" := VendAuditedBal."Debt Ratio";
//                                 BidAuditedBal."Current Ratio" := VendAuditedBal."Current Ratio";
//                                 BidAuditedBal."Working Capital (LCY)" := VendAuditedBal."Working Capital (LCY)";
//                                 BidAuditedBal."Assets-To-Equity Ratio" := VendAuditedBal."Assets-To-Equity Ratio";
//                                 BidAuditedBal."Debt-To-Equity Ratio" := VendAuditedBal."Debt-To-Equity Ratio";
//                                 BidAuditedBal.Insert(true);
//                             until VendAuditedBal.Next = 0;

//                         end;
//                     end;
//                 end;
//                 //f)Audited Income Statement-
//                 Purch.Reset;
//                 Purch.SetRange("Invitation For Supply No", invitationnumber);
//                 Purch.SetRange("Vendor No.", vendornumber);
//                 if Purch.FindSet then begin
//                     BidIncomeStat.Reset;
//                     BidIncomeStat.SetRange("No.", Purch."No.");
//                     if not BidIncomeStat.FindSet then begin
//                         VendIncomeStat.Reset;
//                         VendIncomeStat.SetRange("Vendor No.", Purch."Vendor No.");
//                         if VendIncomeStat.FindSet then begin
//                             repeat
//                                 BidIncomeStat.Init;
//                                 BidIncomeStat."Document Type" := Purch."Document Type";
//                                 BidIncomeStat."No." := Purch."No.";
//                                 BidIncomeStat."Vendor No." := vendornumber;
//                                 BidIncomeStat."Audit Year Code Reference" := VendIncomeStat."Audit Year Code Reference";
//                                 BidIncomeStat."Total Revenue (LCY)" := VendIncomeStat."Total Revenue (LCY)";
//                                 BidIncomeStat."Total COGS (LCY)" := VendIncomeStat."Total COGS (LCY)";
//                                 BidIncomeStat."Gross Margin (LCY)" := VendIncomeStat."Gross Margin (LCY)";
//                                 BidIncomeStat."Total Operating Expenses (LCY)" := VendIncomeStat."Total Operating Expenses (LCY)";
//                                 BidIncomeStat."Operating Income/EBIT (LCY)" := VendIncomeStat."Operating Income/EBIT (LCY)";
//                                 BidIncomeStat."Other Non-operating Re/Exp LCY" := VendIncomeStat."Other Non-operating Re/Exp LCY";
//                                 BidIncomeStat."Interest Expense (LCY)" := VendIncomeStat."Interest Expense (LCY)";
//                                 BidIncomeStat."Income Before Taxes (LCY)" := VendIncomeStat."Income Before Taxes (LCY)";
//                                 BidIncomeStat."Income Tax Expense (LCY)" := VendIncomeStat."Income Tax Expense (LCY)";
//                                 BidIncomeStat."Net Income from Ops  (LCY)" := VendIncomeStat."Net Income from Ops  (LCY)";
//                                 BidIncomeStat."Below-the-line Items (LCY)" := VendIncomeStat."Below-the-line Items (LCY)";
//                                 BidIncomeStat."Net Income" := VendIncomeStat."Net Income";
//                                 BidIncomeStat.Insert(true);
//                             until VendIncomeStat.Next = 0;
//                         end;
//                     end;
//                 end;
//                 //g)Vendor Bank Accounts
//                 Purch.Reset;
//                 Purch.SetRange("Invitation For Supply No", invitationnumber);
//                 Purch.SetRange("Vendor No.", vendornumber);
//                 if Purch.FindSet then begin
//                     BidVendBankAccount.Reset;
//                     BidVendBankAccount.SetRange("No.", Purch."No.");
//                     if not BidVendBankAccount.FindSet then begin
//                         VendBankAccount.Reset;
//                         VendBankAccount.SetRange("Vendor No.", Purch."Vendor No.");
//                         if VendBankAccount.FindSet then begin
//                             repeat
//                                 BidVendBankAccount.Init;
//                                 BidVendBankAccount."Document Type" := Purch."Document Type";
//                                 BidVendBankAccount."No." := Purch."No.";
//                                 BidVendBankAccount."Vendor No." := vendornumber;
//                                 BidVendBankAccount.Code := VendBankAccount.Code;
//                                 BidVendBankAccount.Name := VendBankAccount.Name;
//                                 BidVendBankAccount."Available Credit Line Valu" := VendBankAccount."Available Credit Line Valu";
//                                 BidVendBankAccount."Currency Code" := VendBankAccount."Currency Code";
//                                 BidVendBankAccount.Address := VendBankAccount.Address;
//                                 BidVendBankAccount."Address 2" := VendBankAccount."Address 2";
//                                 BidVendBankAccount."Post Code" := VendBankAccount."Post Code";
//                                 BidVendBankAccount.City := VendBankAccount.City;
//                                 BidVendBankAccount."Country/Region Code" := VendBankAccount."Country/Region Code";
//                                 BidVendBankAccount."Phone No." := VendBankAccount."Phone No.";
//                                 BidVendBankAccount."Bank Account No." := VendBankAccount."Bank Account No.";
//                                 BidVendBankAccount."Bank Branch No." := VendBankAccount."Bank Branch No.";
//                                 BidVendBankAccount.Contact := VendBankAccount.Contact;
//                                 BidVendBankAccount."Telex No." := VendBankAccount."Telex No.";
//                                 BidVendBankAccount."Transit No." := VendBankAccount."Transit No.";
//                                 BidVendBankAccount.County := VendBankAccount.County;
//                                 BidVendBankAccount."Fax No." := VendBankAccount."Fax No.";
//                                 BidVendBankAccount."Telex Answer Back" := VendBankAccount."Telex Answer Back";
//                                 BidVendBankAccount."Language Code" := VendBankAccount."Language Code";
//                                 BidVendBankAccount."E-Mail" := VendBankAccount."E-Mail";
//                                 BidVendBankAccount."Home Page" := VendBankAccount."Home Page";
//                                 BidVendBankAccount.Iban := VendBankAccount.Iban;
//                                 BidVendBankAccount."SWIFT Code" := VendBankAccount."SWIFT Code";
//                                 BidVendBankAccount."Bank Clearing Code" := VendBankAccount."Bank Clearing Code";
//                                 BidVendBankAccount."Bank Clearing Standard" := VendBankAccount."Bank Clearing Standard";
//                                 BidVendBankAccount.Insert(true);
//                             until VendBankAccount.Next = 0;
//                         end;

//                     end;
//                 end;
//                 //h)Key staff

//                 Purch.Reset;
//                 Purch.SetRange("Invitation For Supply No", invitationnumber);
//                 Purch.SetRange("Vendor No.", vendornumber);
//                 if Purch.FindSet then begin
//                     VendKeyStaff.Reset;
//                     VendKeyStaff.SetRange("Vendor No.", Purch."Vendor No.");
//                     if VendKeyStaff.FindSet then begin
//                         repeat
//                             BidKeyStaff.Init;
//                             BidKeyStaff."Document Type" := Purch."Document Type";
//                             BidKeyStaff."No." := Purch."No.";
//                             BidKeyStaff."Vendor No." := vendornumber;
//                             BidKeyStaff."Staff No." := VendKeyStaff."Staff Number";
//                             BidKeyStaff."Staff Name" := VendKeyStaff."Staff Name";
//                             BidKeyStaff."Years with Firm" := VendKeyStaff."Years With the Firm";
//                             BidKeyStaff."Staff Category" := VendKeyStaff."Staff Category";
//                             BidKeyStaff."Phone No." := VendKeyStaff."Phone No.";
//                             BidKeyStaff.Nationality := VendKeyStaff.Nationality;
//                             BidKeyStaff."E-Mail" := VendKeyStaff."E-Mail";
//                             BidKeyStaff.Insert(true);
//                         until VendKeyStaff.Next = 0;
//                     end;
//                 end;
//                 //i)Key Staff Qualifications-
//                 Purch.Reset;
//                 Purch.SetRange("Invitation For Supply No", invitationnumber);
//                 Purch.SetRange("Vendor No.", vendornumber);
//                 if Purch.FindSet then begin
//                     VendKeyStaffQual.Reset;
//                     VendKeyStaffQual.SetRange("Vendor No", vendornumber);
//                     if VendKeyStaffQual.FindSet then begin
//                         repeat
//                             BidKeyStaffQual.Init;
//                             BidKeyStaffQual."Document Type" := Purch."Document Type";
//                             BidKeyStaffQual."No." := Purch."No.";
//                             BidKeyStaffQual."Vendor No." := vendornumber;
//                             BidKeyStaffQual."Staff No." := VendKeyStaffQual."Staff Id";
//                             BidKeyStaffQual."Entry No" := VendKeyStaffQual."Entry No";
//                             BidKeyStaffQual."Qualification Category" := VendKeyStaffQual."Qualification Category";
//                             BidKeyStaffQual."Qualification Name" := VendKeyStaffQual."Qualification Name";
//                             BidKeyStaffQual.Institution := VendKeyStaffQual.Institution;
//                             BidKeyStaffQual."Start Year" := VendKeyStaffQual."Start Year";
//                             BidKeyStaffQual."End Year" := VendKeyStaffQual."End Year";
//                             BidKeyStaffQual."Outstanding Achievements" := VendKeyStaffQual."Outstanding Achievements";
//                             BidKeyStaffQual.Insert(true);
//                         until VendKeyStaffQual.Next = 0;
//                     end;
//                 end;
//                 //j)Key Staff Experience-
//                 Purch.Reset;
//                 Purch.SetRange("Invitation For Supply No", invitationnumber);
//                 Purch.SetRange("Vendor No.", vendornumber);
//                 if Purch.FindSet then begin
//                     VendStaffExperience.Reset;
//                     VendStaffExperience.SetRange("Vendor No", vendornumber);
//                     if VendStaffExperience.FindSet then begin
//                         repeat
//                             BidStaffExperience.Init;
//                             BidStaffExperience."Document Type" := Purch."Document Type";
//                             BidStaffExperience."No." := Purch."No.";
//                             BidStaffExperience."Vendor No." := vendornumber;
//                             BidStaffExperience."Staff No." := VendStaffExperience."Staff ID";
//                             BidStaffExperience."Entry No" := VendStaffExperience."Entry No";
//                             BidStaffExperience."Experience Category" := VendStaffExperience."Experience Category";
//                             BidStaffExperience."Years of Experience" := VendStaffExperience."Years of Experience";
//                             BidStaffExperience."Experience Summary" := VendStaffExperience."Experience Summary";
//                             BidStaffExperience."Sample Assignments/Projects" := VendStaffExperience."Assignment Description";
//                             BidStaffExperience."Experience From Year" := VendStaffExperience."Start Year";
//                             BidStaffExperience."Experience To Year" := VendStaffExperience."End Year";
//                             BidStaffExperience.Insert(true);
//                         until VendStaffExperience.Next = 0;
//                     end;
//                 end;

//                 //K Equipment Specifications.
//                 /* Purch.RESET;
//                  Purch.SETRANGE("Invitation For Supply No",invitationnumber);
//                  Purch.SETRANGE("Vendor No.",vendornumber);
//                  IF Purch.FINDSET THEN BEGIN
//                    IFSRequiredEquipment.RESET;
//                    IFSRequiredEquipment.SETRANGE("Document No",invitationnumber);
//                    IFSRequiredEquipment.SETRANGE(Blocked,FALSE);
//                       IF IFSRequiredEquipment.FINDSET THEN BEGIN
//                         REPEAT
//                           BidEquipmentCompliance.INIT;
//                           BidEquipmentCompliance."No.":=Purch."No.";
//                           BidEquipmentCompliance."Equipment Type Code":=IFSRequiredEquipment."Equipment Type Code";
//                           BidEquipmentCompliance.Description:=IFSRequiredEquipment.Description;
//                           BidEquipmentCompliance."Qty of Equipment":=IFSRequiredEquipment."Minimum Required Qty";
//                           BidEquipmentCompliance.INSERT(TRUE);
//                           UNTIL IFSRequiredEquipment.NEXT=0;
//                     END;
//                   END;
//                   */
//                 status := 'success*This has been created';
//             end else begin
//                 status := 'found*Your application is in draft status, you can continue to submit!';
//             end
//         end;


//     end;

//     procedure fnInserRFQBidGeneralDetails(vendorNo: Code[20]; ittNumber: Code[20]; bidderRepName: Text; bidderRepDesignation: Text; bidderRepAddr: Text) insertstatus: Text
//     begin
//         Purch.Reset;
//         Purch.SetRange("No.", ittNumber);
//         Purch.SetRange("Vendor No.", vendorNo);
//         Purch.SetRange("Document Status", Purch."document status"::Draft);
//         if Purch.FindSet then begin
//             Purch."Bidder Representative Name" := bidderRepName;
//             Purch."Bidder Representative Desgn" := bidderRepDesignation;
//             Purch."Bidder Representative Address" := bidderRepAddr;
//             if Purch.Modify(true) then
//                 insertstatus := 'success*Bidder Representative saved successfully!'
//             else
//                 insertstatus := 'danger*Error saving your info, contact Judiciary Office!'
//         end
//         else begin
//             insertstatus := 'danger*Some details not found!'
//         end
//     end;

//     procedure FnGenerateRFQPreviewReport(VendorNumber: Code[20]; bidrsponseNumber: Code[20]) status: Text
//     var
//         RfqResponse: Record "Purchase Header";
//     begin

//         RfqResponse.Reset;
//         RfqResponse.SetRange("No.", bidrsponseNumber);
//         RfqResponse.SetRange("Vendor No.", VendorNumber);
//         if RfqResponse.FindSet then begin
//             if FILE.Exists(FILESPATH5 + bidrsponseNumber + '.pdf') then
//                 FILE.Erase(FILESPATH5 + bidrsponseNumber + '.pdf');
//             Report.SaveAsPdf(70103, FILESPATH5 + bidrsponseNumber + '.pdf', RfqResponse);
//             status := 'success*Generated*Downloads\RFQ\' + bidrsponseNumber + '.pdf';

//         end else begin
//             status := 'danger*The Report Could not be generated';
//         end
//     end;

//     procedure FnGeneratePrequalificationPreviewReport(VendorNumber: Code[20]; PrequalificationNumber: Code[20]) status: Text
//     var
//         RFIResponse: Record "RFI Response";
//     begin

//         RFIResponse.Reset;
//         RFIResponse.SetRange("Document No.", PrequalificationNumber);
//         RFIResponse.SetRange("Vendor No.", VendorNumber);
//         if RFIResponse.FindSet then begin
//             if FILE.Exists(FILESPATH4 + PrequalificationNumber + '.pdf') then
//                 FILE.Erase(FILESPATH4 + PrequalificationNumber + '.pdf');
//             Report.SaveAsPdf(70102, FILESPATH4 + PrequalificationNumber + '.pdf', RFIResponse);
//             status := 'success*Generated*Downloads\Prequalifications\' + PrequalificationNumber + '.pdf';

//         end else begin
//             status := 'danger*The Report Could not be generated';
//         end
//     end;

//     procedure FnGenerateRegistrationPreviewReport(VendorNumber: Code[20]; PrequalificationNumber: Code[20]) status: Text
//     var
//         RFIResponse: Record "RFI Response";
//     begin

//         RFIResponse.Reset;
//         RFIResponse.SetRange("Document No.", PrequalificationNumber);
//         RFIResponse.SetRange("Vendor No.", VendorNumber);
//         if RFIResponse.FindSet then begin
//             // if FILE.Exists(FILESPATH4 + PrequalificationNumber + '.pdf') then
//             //     FILE.Erase(FILESPATH4 + PrequalificationNumber + '.pdf');
//             // Report.SaveAsPdf(70107, FILESPATH4 + PrequalificationNumber + '.pdf', RFIResponse);
//             status := 'success*Generated*Downloads\Prequalifications\' + PrequalificationNumber + '.pdf';

//         end else begin
//             status := 'danger*The Report Could not be generated';
//         end
//     end;

//     procedure fnDeletePrequalificatinDocuments(vendorNo: Code[30]; fileName: Text; documentNo: Code[200]) deletestatus: Text
//     var
//         RFIResponseFiledDocument: Record "RFI Response Filed Document";
//     begin

//         RFIResponseFiledDocument.Reset;
//         RFIResponseFiledDocument.SetRange("Vendor No", vendorNo);
//         RFIResponseFiledDocument.SetRange("File Name", fileName);
//         RFIResponseFiledDocument.SetRange("Document No", documentNo);
//         if RFIResponseFiledDocument.Find('-') then begin
//             RFIResponseFiledDocument.Delete;
//             deletestatus := 'success*Document deleted successfully!';
//         end
//         else begin
//             deletestatus := 'danger*Error occured!';
//         end
//     end;

//     [NonDebuggable]
//     procedure fnInsertBeneficiaries(vendorNo: Code[50]; Name: Text; Type: Option; IdType: Option; idPassportNumber: Text; PhoneNumber: Integer; Email: Text; AllocatedShares: Decimal) bankinserted: Text
//     var
//         Beneficiary: Record "Vendor Beneficiaries";
//     begin
//         Beneficiary.Reset;
//         Beneficiary.SetRange("Vendor No.", vendorNo);
//         Beneficiary.SetRange(Name, Name);
//         if Beneficiary.FindSet then begin
//             Beneficiary."Vendor No." := vendorNo;
//             Beneficiary.Name := Name;
//             Beneficiary.Type := Type;
//             Beneficiary."ID Type" := IdType;
//             Beneficiary."ID/Passport No." := idPassportNumber;
//             Beneficiary."Phone No." := PhoneNumber;
//             Beneficiary.Email := Email;
//             Beneficiary."Allocated Shares" := AllocatedShares;

//             if Beneficiary.Modify() then begin
//                 bankinserted := 'success*Your Beneficiary details inserted successfully!'
//             end else begin
//                 bankinserted := 'danger*Unknown Error editing!'
//             end
//         end
//         else begin
//             Beneficiary.Init;
//             Beneficiary.Name := Name;
//             Beneficiary.Type := Type;
//             Beneficiary."ID Type" := IdType;
//             Beneficiary."ID/Passport No." := idPassportNumber;
//             Beneficiary."Phone No." := PhoneNumber;
//             Beneficiary.Email := Email;
//             Beneficiary."Allocated Shares" := AllocatedShares;
//             Beneficiary."Vendor No." := vendorNo;
//             if Beneficiary.Insert() then begin
//                 bankinserted := 'success*Your Beneficiary details saved successfully!'
//             end else begin
//                 bankinserted := 'danger*Unknown Error occured!'
//             end
//         end
//     end;

//     procedure FnSubmitPrequalificationResponse(vendorNumber: Code[50]; PrequalificationNumber: Code[50]) status: Text
//     var
//         RFIRequiredDocument: Record "RFI Required Document";
//         RFIResponseFiledDocument: Record "RFI Response Filed Document";
//         tbl_RFIResponse: Record "RFI Response";
//     begin
//         RFIRequiredDocument.Reset;
//         RFIRequiredDocument.SetRange("Document Type", RFIRequiredDocument."document type"::"Invitation For Prequalification");
//         RFIRequiredDocument.SetRange("Requirement Type", RFIRequiredDocument."requirement type"::Mandatory);
//         if RFIRequiredDocument.FindSet then begin
//             repeat
//                 RFIResponseFiledDocument.Reset;
//                 RFIResponseFiledDocument.SetRange("Document No", PrequalificationNumber);
//                 RFIResponseFiledDocument.SetRange("Vendor No", vendorNumber);
//                 RFIResponseFiledDocument.SetRange("Procurement Document Type ID", RFIRequiredDocument."Procurement Document Type ID");
//                 if RFIResponseFiledDocument.FindSet then begin
//                     status := 'success*Your application has been received successfully';
//                 end else begin
//                     status := 'mandatory* All The mandatory Documents Should be uploaded'
//                 end
//             until RFIRequiredDocument.Next = 0;
//             tbl_RFIResponse.Reset;
//             tbl_RFIResponse.SetRange("Document No.", PrequalificationNumber);
//             if tbl_RFIResponse.FindSet(true) then begin
//                 tbl_RFIResponse."Document Status" := tbl_RFIResponse."Document Status"::Submitted;
//                 if tbl_RFIResponse.modify(true) then begin
//                     status := 'success*Your application has been received successfully';
//                 end else begin
//                     status := 'danger* Sorry, kindly try again later. Contact the system admin if this error persists';
//                 end;
//             end;

//         end else begin
//             status := 'success*Your application has been received successfully';
//         end;
//     end;

//     procedure FnGetRegisteredCategories(var VarAll: BigText; vendorNo: Code[20])
//     var
//         VendorRegistrationEntries: Record "Vendor Registration Entry";
//     begin
//         Clear(VarAll);
//         VendorRegistrationEntries.Reset;
//         VendorRegistrationEntries.SetRange(VendorRegistrationEntries."Vendor No.", vendorNo);
//         if VendorRegistrationEntries.Find('-') then begin
//             repeat

//                 VarAll.AddText('::::' + VendorRegistrationEntries."Procurement Type" + '* ' + VendorRegistrationEntries."Procurement Category Code" + '* ' + VendorRegistrationEntries.Description + '* ' +
//                 Format(VendorRegistrationEntries."Start Date") + '* ' + Format(VendorRegistrationEntries."End Date"));
//             until VendorRegistrationEntries.Next = 0;

//         end;
//     end;

//     // local procedure "<-----------------------------------------------------------------------------------------------Contractor Hub Codes---------->"()
//     // begin
//     // end;

//     procedure fnCreatNewWorkExecutionPlan(vendornumber: Code[20]; contractno: Code[50]; region: Code[50]; projecttitle: Code[50]; roadclass: Code[50]; fundingsource: Code[100]; startdate: Date; enddate: Date; projectaccountant: Code[70]; residentengineer: Code[80]) status: Text
//     var
//         Job: Record Job;
//         JobTask: Record "Job Task";
//     begin
//         Job.Init;
//         Job."No." := '';
//         //  objProcsetup.GET;
//         // Contact.INIT;
//         //Contact."No.":=objNoSeriesManagement.GetNextNo(objProcsetup."Request For Registration Nos",TODAY,TRUE);
//         Job."Contractor No." := contractno;
//         Job.Description := projecttitle;
//         Job."Person Responsible" := projectaccountant;
//         Job."Project Manager" := residentengineer;
//         Job."Region ID" := region;
//         Job."Country Entry Code" := region;
//         Job."Road Class ID" := roadclass;
//         Job."Funding Source" := fundingsource;
//         Job."Starting Date" := startdate;
//         Job."Ending Date" := enddate;
//         if Job.Insert(true) then begin
//             status := 'success*New Project Work Execution Was Successfully Created!'
//         end else begin
//             status := 'danger*Error while Creating the Execution Work Plan!'
//         end;
//         //END;
//     end;

//     procedure fnCreatNewWorkExecutionPlanDetails(vendornumber: Code[20]; CommencementOrderNo: Code[50]; ProjectNo: Code[50]; ContractNo: Code[50]) status: Text
//     var
//         Job: Record Job;
//         JobTask: Record "Job Task";
//         WorkExecutionPlan: Record "Work Execution Plan";
//         RoadManagementSetup: Record "Road Management Setup";
//     begin
//         WorkExecutionPlan.Reset;
//         WorkExecutionPlan.SetRange("Commencement Order ID", CommencementOrderNo);
//         WorkExecutionPlan.SetRange("Contractor No.", vendornumber);
//         WorkExecutionPlan.SetRange("Project ID", ProjectNo);
//         if WorkExecutionPlan.FindLast then begin
//             WorkExecutionPlan.Reset;
//             WorkExecutionPlan."Contractor No." := vendornumber;
//             WorkExecutionPlan."Commencement Order ID" := CommencementOrderNo;
//             WorkExecutionPlan.Validate("Commencement Order ID");
//             WorkExecutionPlan."Purchase Contract ID" := ContractNo;
//             WorkExecutionPlan.Validate("Purchase Contract ID");
//             WorkExecutionPlan."Project ID" := ProjectNo;
//             WorkExecutionPlan.Validate("Project ID");
//             if WorkExecutionPlan.Modify(true) then begin
//                 status := 'success*Project Work Execution Was Successfully Modified!';
//             end else begin
//                 status := 'danger*Project Work Execution Was Not Successfully Modified!';
//             end;
//         end else begin
//             WorkExecutionPlan.Init;
//             WorkExecutionPlan."Document No." := '';
//             //objNoSeriesManagement.GetNextNo(RoadManagementSetup."Work Program Nos",TODAY,TRUE);
//             WorkExecutionPlan."Contractor No." := vendornumber;
//             WorkExecutionPlan."Commencement Order ID" := CommencementOrderNo;
//             WorkExecutionPlan.Validate("Commencement Order ID");
//             WorkExecutionPlan."Purchase Contract ID" := ContractNo;
//             WorkExecutionPlan.Validate("Purchase Contract ID");
//             WorkExecutionPlan."Project ID" := ProjectNo;
//             WorkExecutionPlan.Validate("Project ID");
//             if WorkExecutionPlan.Insert(true) then begin
//                 status := 'success*New Project Work Execution Was Successfully Created!'
//             end else begin
//                 status := 'danger*Error while Creating the Execution Work Plan!'
//             end;
//         end;
//     end;

//     procedure fnCreatWorkExecutionScheduleDetails(vendornumber: Code[20]; CommencementOrderNo: Code[50]) status: Text
//     var
//         Job: Record Job;
//         JobTask: Record "Job Task";
//         WorkExecutionPlan: Record "Work Execution Plan";
//         RoadManagementSetup: Record "Road Management Setup";
//         WEPExecutionSchedule: Record "WEP Execution Schedule";
//         ProjectCommencementOrder: Record "Project Commencement Order";
//     begin
//         ProjectCommencementOrder.Reset;
//         ProjectCommencementOrder.SetRange("Notice No.", CommencementOrderNo);
//         if ProjectCommencementOrder.FindSet then begin
//             WorkExecutionPlan.Reset;
//             WorkExecutionPlan.SetRange("Commencement Order ID", CommencementOrderNo);
//             WorkExecutionPlan.SetRange("Contractor No.", ProjectCommencementOrder."Contractor No.");
//             if WorkExecutionPlan.FindLast then begin
//                 WorkExecutionPlan.Reset;
//                 WorkExecutionPlan."Document Type" := WorkExecutionPlan."document type"::"Work Execution Programme";
//                 WorkExecutionPlan."Contractor No." := vendornumber;
//                 WorkExecutionPlan."Commencement Order ID" := CommencementOrderNo;
//                 WorkExecutionPlan.Validate("Commencement Order ID");
//                 WorkExecutionPlan."Purchase Contract ID" := ProjectCommencementOrder."Purchase Contract ID";
//                 WorkExecutionPlan.Validate("Purchase Contract ID");
//                 WorkExecutionPlan."Project ID" := ProjectCommencementOrder."Project ID";
//                 WorkExecutionPlan.Validate("Project ID");
//                 WorkExecutionPlan."Department ID" := ProjectCommencementOrder."Department ID";
//                 WorkExecutionPlan."Constituency ID" := ProjectCommencementOrder."Constituency ID";
//                 WorkExecutionPlan."Directorate ID" := ProjectCommencementOrder."Directorate ID";
//                 WorkExecutionPlan.Status := WorkExecutionPlan.Status::Open;
//                 if WorkExecutionPlan.Modify(true) then begin
//                     ExecutionPlanNumber := fngetWorkExecutionPlanNumber(vendornumber, CommencementOrderNo);
//                     fnPopulateWorkExecutionPlanLines(ExecutionPlanNumber, ProjectCommencementOrder."Project ID");
//                     status := 'success*Project Work Execution Was Successfully Modified!';
//                 end else begin
//                     status := 'danger*Project Work Execution Was Not Successfully Modified!';
//                 end;
//             end else begin
//                 WorkExecutionPlan.Init;
//                 WorkExecutionPlan."Document No." := '';
//                 WorkExecutionPlan."Document Type" := WorkExecutionPlan."document type"::"Work Execution Programme";
//                 WorkExecutionPlan."Contractor No." := vendornumber;
//                 WorkExecutionPlan."Commencement Order ID" := CommencementOrderNo;
//                 WorkExecutionPlan.Validate("Commencement Order ID");
//                 WorkExecutionPlan."Purchase Contract ID" := ProjectCommencementOrder."Purchase Contract ID";
//                 WorkExecutionPlan.Validate("Purchase Contract ID");
//                 WorkExecutionPlan."Project ID" := ProjectCommencementOrder."Project ID";
//                 WorkExecutionPlan.Validate("Project ID");
//                 WorkExecutionPlan."Department ID" := ProjectCommencementOrder."Department ID";
//                 WorkExecutionPlan."Constituency ID" := ProjectCommencementOrder."Constituency ID";
//                 WorkExecutionPlan."Directorate ID" := ProjectCommencementOrder."Directorate ID";
//                 WorkExecutionPlan.Status := WorkExecutionPlan.Status::Open;
//                 if WorkExecutionPlan.Insert(true) then begin
//                     ExecutionPlanNumber := fngetWorkExecutionPlanNumber(vendornumber, CommencementOrderNo);
//                     fnPopulateWorkExecutionPlanLines(ExecutionPlanNumber, ProjectCommencementOrder."Project ID");
//                     status := 'success*New Project Work Execution Was Successfully Created!'
//                 end else begin
//                     status := 'danger*Error while Creating the Execution Work Plan!'
//                 end;
//             end;
//         end else begin
//             status := 'danger*The Project Commencement Order Cannot be found!';
//         end;
//     end;

//     procedure fngetWorkExecutionPlanNumber(VendorNumber: Code[100]; CommencementOrderNumber: Code[50]) workexecutionplanNumber: Code[100]
//     var
//         PurchaseHeader: Record "Purchase Header";
//         WorkExecutionPlan: Record "Work Execution Plan";
//     begin

//         WorkExecutionPlan.Reset;
//         WorkExecutionPlan.SetRange("Contractor No.", VendorNumber);
//         WorkExecutionPlan.SetRange("Document Type", WorkExecutionPlan."document type"::"Work Execution Programme");
//         WorkExecutionPlan.SetRange("Commencement Order ID", CommencementOrderNumber);
//         if WorkExecutionPlan.FindLast then begin
//             workexecutionplanNumber := WorkExecutionPlan."Document No.";
//         end else begin
//             workexecutionplanNumber := '';
//         end;
//     end;

//     procedure fngetWorkExecutionPlanProjectNumber(VendorNumber: Code[100]; CommencementOrderNumber: Code[50]) ProjectNumber: Code[100]
//     var
//         PurchaseHeader: Record "Purchase Header";
//         WorkExecutionPlan: Record "Work Execution Plan";
//     begin

//         WorkExecutionPlan.Reset;
//         WorkExecutionPlan.SetRange("Contractor No.", VendorNumber);
//         WorkExecutionPlan.SetRange("Commencement Order ID", CommencementOrderNumber);
//         if WorkExecutionPlan.FindLast then begin
//             ProjectNumber := WorkExecutionPlan."Project ID";
//         end else begin
//             ProjectNumber := '';
//         end;
//     end;

//     procedure fngetContractNo(documentno: Code[50]) contractno: Code[100]
//     var
//         DailyWorkRecord: Record "Daily Work Record";
//     begin
//         DailyWorkRecord.Reset;
//         DailyWorkRecord.SetRange("Document No.", documentno);
//         if DailyWorkRecord.FindLast then begin
//             contractno := DailyWorkRecord."Purchase Contract ID";
//         end else begin
//             contractno := '';
//         end;
//     end;

//     procedure fnSubmitWorkExecutionPlanScheduleDetails(documentNumber: Code[20]; projectNumber: Code[50]; taskNumber: Code[50]; startdate: Date; enddate: Date) status: Text
//     var
//         Job: Record Job;
//         JobTask: Record "Job Task";
//         WEPExecutionSchedule: Record "WEP Execution Schedule";
//     begin
//         WEPExecutionSchedule.Reset;
//         WEPExecutionSchedule.SetRange("Document No", documentNumber);
//         WEPExecutionSchedule.SetRange("Job No", projectNumber);
//         WEPExecutionSchedule.SetRange("Job Task No", taskNumber);
//         if WEPExecutionSchedule.FindSet then begin
//             WEPExecutionSchedule."Document No" := documentNumber;
//             WEPExecutionSchedule."Document Type" := WEPExecutionSchedule."document type"::"Work Execution Programme";
//             WEPExecutionSchedule."Job No" := projectNumber;
//             WEPExecutionSchedule."Job Task No" := taskNumber;
//             WEPExecutionSchedule.Validate("Job Task No");
//             WEPExecutionSchedule."Scheduled Start Date" := startdate;
//             WEPExecutionSchedule."Scheduled End Date" := enddate;
//             if WEPExecutionSchedule.Modify(true) then begin
//                 status := 'success*New Project Work Execution Plan schedule Was Successfully Modified!'
//             end else begin
//                 status := 'danger*New Project Work Execution Plan schedule could not be Modified!'
//             end;
//         end else begin
//             WEPExecutionSchedule.Init;
//             WEPExecutionSchedule."Document No" := documentNumber;
//             WEPExecutionSchedule."Document Type" := WEPExecutionSchedule."document type"::"Work Execution Programme";
//             WEPExecutionSchedule."Job No" := projectNumber;
//             WEPExecutionSchedule."Job Task No" := taskNumber;
//             WEPExecutionSchedule.Validate("Job Task No");
//             WEPExecutionSchedule."Scheduled Start Date" := startdate;
//             WEPExecutionSchedule."Scheduled End Date" := enddate;
//             if WEPExecutionSchedule.Insert(true) then begin

//                 status := 'success*New Project Work Execution Plan schedule Was Successfully Submmitted!'
//             end else begin
//                 status := 'danger*New Project Work Execution Plan schedule could not be Submitted!'
//             end;
//         end;
//     end;

//     procedure fnSubmitWorkExecutionPlanContractorTeam(documentNumber: Code[50]; contractor: Code[50]; staffnumber: Code[50]; staffname: Code[50]; emailaddress: Code[50]; address: Code[50]; address2: Code[50]; city: Code[50]; country: Code[50]; postcode: Code[50]; mobilephonenumber: Code[50]; designation: Code[50]; staffcategory: Integer; startdate: Date; idno: Code[20]) status: Text
//     var
//         Job: Record Job;
//         JobTask: Record "Job Task";
//         WEPExecutionSchedule: Record "WEP Execution Schedule";
//         WEPContractorTeam: Record "WEP Contractor Team";
//     begin

//         WEPContractorTeam.Reset;
//         WEPContractorTeam.SetRange("Document No", documentNumber);
//         WEPContractorTeam.SetRange("Contractor Staff No.", staffnumber);
//         WEPContractorTeam.SetRange("Contractor No.", contractor);
//         if WEPContractorTeam.FindSet then begin
//             WEPContractorTeam."Document No" := documentNumber;
//             WEPContractorTeam."Document Type" := WEPContractorTeam."document type"::"Contractor Personnel Appointment";
//             WEPContractorTeam."Contractor No." := contractor;
//             WEPContractorTeam."Contractor Staff No." := staffnumber;
//             WEPContractorTeam.Name := staffname;
//             WEPContractorTeam."ID Number" := idno;
//             WEPContractorTeam.Address := address;
//             WEPContractorTeam."Address 2" := address2;
//             WEPContractorTeam.City := city;
//             WEPContractorTeam."Post Code" := postcode;
//             WEPContractorTeam."Country/Region Code" := country;
//             WEPContractorTeam.Email := emailaddress;
//             WEPContractorTeam.Telephone := mobilephonenumber;
//             WEPContractorTeam."Role Code" := designation;
//             WEPContractorTeam."Staff Category" := staffcategory;
//             WEPContractorTeam."Effective Date" := startdate;
//             if WEPContractorTeam.Modify(true) then begin
//                 WEPContractorTeam.Validate("Contractor Staff No.");
//                 WEPContractorTeam.Validate("Role Code");
//                 WEPContractorTeam.Validate("ID Number");
//                 status := 'success*Contractor Staff Details Was Successfully Modified!';
//             end else begin
//                 status := 'danger*Contractor Staff Details Was Successfully Modified!';
//             end;
//         end else begin
//             WEPContractorTeam.Init;
//             WEPContractorTeam."Document No" := documentNumber;
//             WEPContractorTeam."Document Type" := WEPContractorTeam."document type"::"Contractor Personnel Appointment";
//             WEPContractorTeam."Contractor No." := contractor;
//             WEPContractorTeam."Contractor Staff No." := staffnumber;
//             WEPContractorTeam.Name := staffname;
//             WEPContractorTeam."ID Number" := idno;
//             WEPContractorTeam.Address := address;
//             WEPContractorTeam."Address 2" := address2;
//             WEPContractorTeam.City := city;
//             WEPContractorTeam."Post Code" := postcode;
//             WEPContractorTeam."Country/Region Code" := country;
//             WEPContractorTeam.Email := emailaddress;
//             WEPContractorTeam.Telephone := mobilephonenumber;
//             WEPContractorTeam."Role Code" := designation;
//             WEPContractorTeam."Staff Category" := staffcategory;
//             WEPContractorTeam."Effective Date" := startdate;
//             if WEPContractorTeam.Insert(true) then begin
//                 WEPContractorTeam.Validate("Contractor Staff No.");
//                 WEPContractorTeam.Validate("Role Code");
//                 WEPContractorTeam.Validate("ID Number");
//                 status := 'success*Contractor Staff Details Was Successfully Submitted!';
//             end else begin
//                 status := 'danger*Contractor Staff Details Was Successfully Submitted!';
//             end;
//         end;
//     end;

//     procedure fnPopulateWorkExecutionPlanLines(documentNumber: Code[50]; projectnumber: Code[50]) status: Text
//     var
//         Job: Record Job;
//         JobTask: Record "Job Task";
//         WEPExecutionSchedule: Record "WEP Execution Schedule";
//         WEPContractorTeam: Record "WEP Contractor Team";
//         WorkExecutionPlan: Record "Work Execution Plan";
//         JobPlanningLine: Record "Job Planning Line";
//     begin

//         JobPlanningLine.Reset;
//         JobPlanningLine.SetRange(JobPlanningLine."Job No.", projectnumber);
//         if JobPlanningLine.FindSet then begin
//             WEPExecutionSchedule.Reset;
//             WEPExecutionSchedule.SetRange("Document No", documentNumber);
//             if WEPExecutionSchedule.FindSet then
//                 WEPExecutionSchedule.DeleteAll;
//             repeat
//                 WEPExecutionSchedule.Init;
//                 WEPExecutionSchedule."Document Type" := WEPExecutionSchedule."document type"::"Work Execution Programme";
//                 WEPExecutionSchedule."Document No" := documentNumber;
//                 WEPExecutionSchedule."Job No" := projectnumber;
//                 WEPExecutionSchedule."Line No" := WEPExecutionSchedule.Count + 1;
//                 WEPExecutionSchedule."Job Task No" := JobPlanningLine."Job Task No.";
//                 WEPExecutionSchedule."Job Task Type" := WEPExecutionSchedule."job task type"::Posting;
//                 WEPExecutionSchedule.Description := JobPlanningLine.Description;
//                 WEPExecutionSchedule."Budget (Total Cost)" := JobPlanningLine."Unit Cost";
//                 if not WEPExecutionSchedule.Get(WEPExecutionSchedule."Document Type", WEPExecutionSchedule."Document No", WEPExecutionSchedule."Job No", WEPExecutionSchedule."Job Task No") then
//                     WEPExecutionSchedule.Insert(true);
//             until JobPlanningLine.Next = 0;
//         end;
//         /*
//         JobPlanningLine.RESET;
//         JobPlanningLine.SETRANGE(JobPlanningLine."Job No.",projectnumber);
//         IF JobPlanningLine.FINDSET THEN BEGIN
//           WEPExecutionSchedule.RESET;
//           WEPExecutionSchedule.SETRANGE("Document No",documentNumber);
//           IF WEPExecutionSchedule.FINDSET THEN
//             WEPExecutionSchedule.DELETEALL;
//           REPEAT
//             WEPExecutionSchedule.INIT;
//             WEPExecutionSchedule."Document Type":=WEPExecutionSchedule."Document Type"::"Work Execution Programme";
//             WEPExecutionSchedule."Document No":=WorkExecutionPlan."Document No.";
//             WEPExecutionSchedule."Line No":=WEPExecutionSchedule.COUNT+100;
//             WEPExecutionSchedule."Job No":=WorkExecutionPlan."Project ID";
//             WEPExecutionSchedule."Job Task No":=JobPlanningLine."Job Task No.";
//             WEPExecutionSchedule."Job Task Type":=WEPExecutionSchedule."Job Task Type"::Posting;
//             WEPExecutionSchedule.Description:=JobPlanningLine.Description;
//             WEPExecutionSchedule."Budget (Total Cost)":=JobPlanningLine."Unit Cost";
//             WEPExecutionSchedule.INSERT(TRUE);
//            UNTIL JobPlanningLine.NEXT=0;
//         END;
//         */

//     end;

//     procedure fnSubmitWorkExecutionPlanEquipments(documentNumber: Code[50]; contractor: Code[50]; equipmentnumber: Code[50]; equipmenttype: Code[50]; equipmentdescription: Text; equipmentownership: Integer; equipmentserialnumber: Code[50]; equipmentusability: Integer; yearofuse: Integer; equipmentcondition: Integer; equipmentavailability: Text; scheduledeliverydate: Date; projectphase: Text) status: Text
//     var
//         Job: Record Job;
//         JobTask: Record "Job Task";
//         WEPExecutionSchedule: Record "WEP Execution Schedule";
//         WEPContractorTeam: Record "WEP Contractor Team";
//         WEPContractorEquipment: Record "WEP Contractor Equipment";
//     begin

//         WEPContractorEquipment.Reset;
//         WEPContractorEquipment.SetRange("Document No.", documentNumber);
//         WEPContractorEquipment.SetRange("Equipment No.", equipmentnumber);
//         WEPContractorEquipment.SetRange("Contractor No.", contractor);
//         if WEPContractorEquipment.FindSet then begin
//             WEPContractorEquipment."Document Type" := WEPContractorEquipment."document type"::"Contractor Equipment Register";
//             WEPContractorEquipment."Document No." := documentNumber;
//             WEPContractorEquipment."Equipment No." := equipmentnumber;
//             WEPContractorEquipment."Contractor No." := contractor;
//             WEPContractorEquipment."Equipment Type Code" := equipmenttype;
//             WEPContractorEquipment.Validate("Equipment Type Code");
//             WEPContractorEquipment."Ownership Type" := equipmentownership;
//             WEPContractorEquipment."Equipment Serial No." := equipmentserialnumber;
//             WEPContractorEquipment."Equipment Usability Code" := equipmentusability;
//             WEPContractorEquipment."Years of Previous Use" := yearofuse;
//             WEPContractorEquipment."Equipment Condition Code" := equipmentcondition;
//             WEPContractorEquipment."Equipment Availability" := equipmentavailability;
//             WEPContractorEquipment."Scheduled Date of Delivery" := scheduledeliverydate;
//             WEPContractorEquipment."Project Phase" := projectphase;
//             if WEPContractorEquipment.Modify(true) then begin
//                 status := 'success*Contractor Equipment Details Was Successfully Modified!';
//             end else begin
//                 status := 'danger*Contractor Equipment Details Was Successfully Modified!';
//             end;
//         end else begin
//             WEPContractorEquipment.Init;
//             WEPContractorEquipment."Document Type" := WEPContractorEquipment."document type"::"Contractor Equipment Register";
//             WEPContractorEquipment."Document No." := documentNumber;
//             WEPContractorEquipment."Equipment No." := equipmentnumber;
//             WEPContractorEquipment."Contractor No." := contractor;
//             WEPContractorEquipment."Equipment Type Code" := equipmenttype;
//             WEPContractorEquipment.Description := equipmentdescription;
//             WEPContractorEquipment."Ownership Type" := equipmentownership;
//             WEPContractorEquipment."Equipment Serial No." := equipmentserialnumber;
//             WEPContractorEquipment."Equipment Usability Code" := equipmentusability;
//             WEPContractorEquipment."Years of Previous Use" := yearofuse;
//             WEPContractorEquipment."Equipment Condition Code" := equipmentcondition;
//             WEPContractorEquipment."Equipment Availability" := equipmentavailability;
//             WEPContractorEquipment."Scheduled Date of Delivery" := scheduledeliverydate;
//             WEPContractorEquipment."Project Phase" := projectphase;
//             if WEPContractorEquipment.Insert(true) then begin
//                 status := 'success*Contractor Equipment Details Was Successfully Submitted!';
//             end else begin
//                 status := 'danger*Contractor Equipment Details Was Not Submitted!';
//             end;
//         end;
//     end;

//     procedure fnSubmitWEPEquipmentRepairPlan(documentNumber: Code[50]; contractor: Code[50]; equipmentnumber: Code[50]; maintenancetype: Integer; tododescription: Text; scheduledate: Date; responsibleperson: Code[50]) status: Text
//     var
//         WEPContractorEquipmentRepair: Record "WEP Equipment Repair Plan";
//     begin

//         WEPContractorEquipmentRepair.Reset;
//         WEPContractorEquipmentRepair.SetRange("Document No.", documentNumber);
//         WEPContractorEquipmentRepair.SetRange("Equipment No.", equipmentnumber);
//         WEPContractorEquipmentRepair.SetRange("Contractor No.", contractor);
//         if WEPContractorEquipmentRepair.FindSet then begin
//             WEPContractorEquipmentRepair."Document Type" := WEPContractorEquipmentRepair."document type"::"Work Execution Programme";
//             WEPContractorEquipmentRepair."Document No." := documentNumber;
//             WEPContractorEquipmentRepair."Equipment No." := equipmentnumber;
//             WEPContractorEquipmentRepair."Contractor No." := contractor;
//             WEPContractorEquipmentRepair."Maintenance Type" := maintenancetype;
//             WEPContractorEquipmentRepair."To-do Description" := tododescription;
//             WEPContractorEquipmentRepair."Scheduled Date" := scheduledate;
//             WEPContractorEquipmentRepair."Responsible Staff No." := responsibleperson;
//             if WEPContractorEquipmentRepair.Modify(true) then begin
//                 status := 'success*Contractor Equipment Repair Details Was Successfully Modified!';
//             end else begin
//                 status := 'danger*Contractor Equipment Repair Details Was Successfully Modified!';
//             end;
//         end else begin
//             WEPContractorEquipmentRepair.Init;
//             WEPContractorEquipmentRepair."Document Type" := WEPContractorEquipmentRepair."document type"::"Work Execution Programme";
//             WEPContractorEquipmentRepair."Document No." := documentNumber;
//             WEPContractorEquipmentRepair."Equipment No." := equipmentnumber;
//             WEPContractorEquipmentRepair."Contractor No." := contractor;
//             WEPContractorEquipmentRepair."Maintenance Type" := maintenancetype;
//             WEPContractorEquipmentRepair."To-do Description" := tododescription;
//             WEPContractorEquipmentRepair."Scheduled Date" := scheduledate;
//             WEPContractorEquipmentRepair."Responsible Staff No." := responsibleperson;
//             if WEPContractorEquipmentRepair.Insert(true) then begin
//                 status := 'success*Contractor Equipment Repair Details Was Successfully Submitted!';
//             end else begin
//                 status := 'danger*Contractor Equipment Repair Details Was Not Submitted!';
//             end;
//         end;
//     end;

//     procedure FnSendEmaiNotificationOnApplicantRegRequestAcknowledge(ApplicantRequest: Record Contact)
//     var
//         SupplierReq: Record Contact;
//         LastFieldNo: Integer;
//         FooterPrinted: Boolean;
//         FileDirectory: Text[100];
//         FileName: Text[100];
//         ReportID: Integer;
//         // //"Object": Record "Object";
//         Window: Dialog;
//         RunOnceFile: Text[1000];
//         TimeOut: Integer;
//         Customer2: Record Customer;
//         Cust: Record Customer;
//         cr: Integer;
//         lf: Integer;
//         EmailBody: array[2] of Text[30];
//         BodyText: Text[250];
//         mymail: Codeunit Mail;
//         DefaultPrinter: Text[200];
//         WindowisOpen: Boolean;
//         FileDialog: Codeunit Mail;
//         SendingDate: Date;
//         SendingTime: Time;
//         Counter: Integer;
//         cu400: Codeunit Mail;
//         DocLog: Record "Document E-mail Log";
//         BranchName: Code[80];
//         DimValue: Record "Dimension Value";
//         SenderAddress: Text[100];
//         CustEmail: Text[100];
//         UserSetup: Record "User Setup";
//         HRSetup: Record "Company Information";
//         Emp: Record Vendor;
//         PayrollMonth: Date;
//         PayrollMonthText: Text[30];
//         PayPeriodtext: Text;
//         PayPeriod: Record "Payroll PeriodX";
//         CompInfo: Record "Company Information";
//         DateFilter: Text;
//         FromDate: Date;
//         ToDate: Date;
//         FromDateS: Text;
//         ToDateS: Text;
//         vend: Record Vendor;
//         StartDate: Date;
//         EndDAte: Date;
//         EmailVerifier: Codeunit Payroll3;
//         IsEmailValid: Boolean;
//         RequesterName: Text[100];
//         RequesterEmail: Text[100];
//         emailhdr: Text[100];
//         CompanyDetails: Text[250];
//         SupplierDetails: Text[250];
//         SenderMessage: Text[1000];
//         ProcNote: Text[1000];
//         LoginDetails: Text[250];
//         PortalUser: Record "Dynasoft Portal User";
//         Password: Text[50];
//         ActivationDetails: Text[1000];
//         HRSetupNew: Record "Procurement Setup";
//     begin
//         /*CompInfo.GET;
//         HRSetupNew.GET;
//         RequesterEmail:=ApplicantRequest."E-Mail";
//         RequesterName:=ApplicantRequest.Name;
//         Counter:=Counter+1;
//         IF CompInfo."E-Mail"='' THEN
//           ERROR('Please Contact the IT Admin to specify the E-mail address under Company Information Setup page!!');
//         SenderAddress:=CompInfo."E-Mail";
//         IF HRSetupNew."Default Proc Email Contact" = '' THEN
//         ERROR('Please Contact the IT Admin to specify the procurement E-mail address under Human Resource Setup page!!');
//         CustEmail:=HRSetupNew."Default Proc Email Contact";
//         CompanyDetails:='Dear,'+ApplicantRequest.Name+'<BR>';
//         SenderMessage:='<BR>Thank you for using our e-student Portal which has been established to provide you with easy access to our online student services such as e-registration.'+
//         'This email is to acknowledge that your Request for registration as a student, done on: '+FORMAT(ApplicantRequest."Last Date Modified")+
//         'has been received, summarized as follows:'+'<BR></BR>';
//         SupplierDetails:='Registration Request Reference No:'+ApplicantRequest."No."+'<BR></BR>'+'<b>Full Names:</b>'+ApplicantRequest.Name+'<BR></BR>'+
//         '<b>KRA Registration (PIN) No:</b>'+ApplicantRequest."VAT Registration No."+'<BR></BR>'+'<b>Primary Email Address<b>:'+ApplicantRequest."E-Mail"+'<BR></BR>'+
//         '<b>Mobile Phone No:<b>'+ApplicantRequest."Phone No."+'<BR></BR>';
//         IF CustEmail='' THEN
//          EXIT;
//         emailhdr:='e-registration Acknowledgment (Reference No:'+ApplicantRequest."No."+')';
//         cu400.CreateMessage(CompInfo.Name,SenderAddress,CustEmail,emailhdr,
//         CompanyDetails+'<BR></BR>'+SenderMessage+SupplierDetails+LoginDetails+ActivationDetails, TRUE);
//         cu400.AddCC(RequesterEmail);
//         cu400.AddBodyline(ProcNote);
//         cu400.Send;
//         SendingDate:=TODAY;
//         SendingTime:=TIME;
//          SLEEP(1000);
//          Window.CLOSE;*/

//     end;

//     procedure FnSendEmaiNotificationOnApplicantAccountActivation(ApplicantRequest: Record Contact)
//     var
//         SupplierReq: Record Contact;
//         LastFieldNo: Integer;
//         FooterPrinted: Boolean;
//         FileDirectory: Text[100];
//         FileName: Text[100];
//         ReportID: Integer;
//         //  //"Object": Record "Object";
//         Window: Dialog;
//         RunOnceFile: Text[1000];
//         TimeOut: Integer;
//         Customer2: Record Customer;
//         Cust: Record Customer;
//         cr: Integer;
//         lf: Integer;
//         EmailBody: array[2] of Text[30];
//         BodyText: Text[250];
//         mymail: Codeunit Mail;
//         DefaultPrinter: Text[200];
//         WindowisOpen: Boolean;
//         FileDialog: Codeunit Mail;
//         SendingDate: Date;
//         SendingTime: Time;
//         Counter: Integer;
//         cu400: Codeunit Mail;
//         DocLog: Record "Document E-mail Log";
//         BranchName: Code[80];
//         DimValue: Record "Dimension Value";
//         SenderAddress: Text[100];
//         CustEmail: Text[100];
//         UserSetup: Record "User Setup";
//         HRSetupNew: Record "Purchases & Payables Setup";
//         HRSetup: Record "Company Information";
//         Emp: Record Vendor;
//         PayrollMonth: Date;
//         PayrollMonthText: Text[30];
//         PayPeriodtext: Text;
//         PayPeriod: Record "Payroll PeriodX";
//         CompInfo: Record "Company Information";
//         DateFilter: Text;
//         FromDate: Date;
//         ToDate: Date;
//         FromDateS: Text;
//         ToDateS: Text;
//         vend: Record Vendor;
//         StartDate: Date;
//         EndDAte: Date;
//         EmailVerifier: Codeunit Payroll3;
//         IsEmailValid: Boolean;
//         RequesterName: Text[100];
//         RequesterEmail: Text[100];
//         emailhdr: Text[100];
//         CompanyDetails: Text[250];
//         SupplierDetails: Text[1000];
//         SenderMessage: Text[1000];
//         ProcNote: Text[1000];
//         LoginDetails: Text[1000];
//         PortalUser: Record "Dynasoft Portal User";
//         Password: Text[50];
//         ActivationDetails: Text[1000];
//     begin
//         CompInfo.Get;
//         HRSetup.Get;
//         HRSetupNew.Get;
//         RequesterEmail := ApplicantRequest."E-Mail";
//         RequesterName := ApplicantRequest.Name;
//         Counter := Counter + 1;
//         PortalUser.Reset;
//         PortalUser.SetRange("Authentication Email", ApplicantRequest."E-Mail");
//         if PortalUser.FindSet then
//             Password := PortalUser."Password Value";
//         if CompInfo."E-Mail" = '' then
//             Error('Please Contact the IT Admin to specify the E-mail address under Company Information Setup page!!');
//         SenderAddress := CompInfo."E-Mail";
//         if HRSetupNew."Procurement/Stores E-mail" = '' then
//             Error('Please Contact the IT Admin to specify the HR Manager E-mail address under Human Resource Setup page!!');
//         CustEmail := HRSetupNew."Procurement/Stores E-mail";
//         CompanyDetails := 'Dear Sir/Madam,';
//         //SenderMessage:='<BR>Please note that your Supplier account has been created on our System, with the following key registration details:</BR>';
//         SenderMessage := '<BR>Thank you for using our e-Procurement Portal which has been established to provide you with easy access to our online business services such as supplier registration, Prequalification and Tendering.' +
//         'This email is to acknowledge that your Request for registration as a supplier, done on:' + Format(ApplicantRequest."Last Date Modified") +
//         ' has been received.' + '<BR><BR>' + 'Find below your registration details:' + '<BR></BR>' +

//         'Registration Request Reference No: ' + ApplicantRequest."No." + '<BR></BR>' + 'Company Name: ' + ApplicantRequest.Name + '<BR></BR>' +
//         'Tax Registration No: ' + ApplicantRequest."VAT Registration No." + '<BR></BR>' + 'Primary Email: ' + ApplicantRequest."E-Mail" + '<BR></BR>' +
//         'Mobile Phone No:' + ApplicantRequest."Phone No." + '<BR></BR>';

//         //'<BR>Registration Request Reference No: </>'+ApplicantRequest."No."+'</BR>'+'<BR> Name: </>'+ApplicantRequest.Name+'</BR>'+
//         //'<BR>Mobile Phone No: '+ApplicantRequest."Phone No."+'</BR>';

//         LoginDetails := '<br>We have also created your portal access account with the following login credentials:' + '<BR></BR>' +
//         'User Name: ' + ApplicantRequest."E-Mail" + '<BR></BR>' + 'Password: ' + Password + '<BR><BR>To access our Supplier Procurement portal and complete your registration, click on the link below:<BR>' +
//         '<a href="http://192.168.1.87:8076/Home/Login/">E-Procurement Portal</a>';

//         //'<br> <br><a href="http://192.168.1.87:7988/">E-Recruitment Portal Link</a></br>';
//         // ActivationDetails:='<BR><BR>Once you access our portal, you shall be required to complete your supplier profile: </BR>'+
//         // '<BR>Regards,'+
//         // '<BR>Supply Chain Management'+

//         // '<BR><BR>Note: This is a system generated mail. Please DO NOT reply to it.';
//         CompInfo.get();
//         ActivationDetails := '<BR>If you require any assistance, please contact our Supply chain Management team by Phone <BR>' + HRSetup."Phone No." +
//         '<BR><BR>Regards,' +
//         '<BR>Supply chain management' +
//         '<BR>' + CompInfo.Name +
//         '<BR><BR>Note: This is a system generated mail. Please DO NOT reply to it.';
//         if CustEmail = '' then
//             exit;
//         emailhdr := 'E-procurement Activation (Applicant Account No:' + ApplicantRequest."No." + ')';
//         // cu400.CreateMessage(CompInfo.Name, SenderAddress, CustEmail, emailhdr,
//         // CompanyDetails + '<BR></BR>' + SenderMessage + SupplierDetails + LoginDetails + ActivationDetails, true);
//         // cu400.AddCC(RequesterEmail);
//         // cu400.AddBodyline(ProcNote);
//         // cu400.Send;
//         SendingDate := Today;
//         SendingTime := Time;
//         Sleep(1000);
//         Window.Close;
//     end;

//     procedure FnCreateApplicantAccountRequest(emailaddress: Text) status: Text
//     var
//         PortalUSer: Record "Dynasoft Portal User";
//         RandomDigit: Text[50];
//         entryno: Integer;
//         ApplicantProfile: Record Vendor;
//         VendorSetup: Record "Purchases & Payables Setup";
//         Contact: Record Contact;
//         NoSeriesMgt: Codeunit NoSeriesManagement;
//     begin
//         Contact.Reset;
//         Contact.SetRange("E-Mail", emailaddress);
//         Contact.SetRange("Applicant Type", Contact."Applicant Type"::"E-Procurment");
//         if Contact.FindSet then begin
//             VendorSetup.Get;
//             ApplicantProfile.Reset;
//             ApplicantProfile.SetRange("E-Mail", emailaddress);
//             if not ApplicantProfile.FindSet then begin
//                 ApplicantProfile.Init;
//                 ApplicantProfile."No." := NoSeriesMgt.GetNextNo(VendorSetup."Vendor Nos.", Today, true);
//                 ApplicantProfile.Name := Contact.Name;
//                 ApplicantProfile.Registered := ApplicantProfile.Registered::No;
//                 ApplicantProfile."E-Mail" := Contact."E-Mail";
//                 ApplicantProfile."Post Code" := Contact."Post Code";
//                 ApplicantProfile."VAT Registration No." := Contact."VAT Registration No.";
//                 ApplicantProfile.City := Contact.City;
//                 ApplicantProfile.Address := Contact.Address;
//                 ApplicantProfile."Phone No." := Contact."Phone No.";
//                 if ApplicantProfile.Insert(true) then begin
//                     // Update Dynasoft Portal user;
//                     PortalUSer.Reset;
//                     PortalUSer.SetRange("Authentication Email", emailaddress);
//                     if not PortalUSer.FindSet then begin
//                         PortalUSer.Init;
//                         PortalUSer."User Name" := Contact.Name;
//                         PortalUSer."Full Name" := Contact.Name;
//                         PortalUSer."Authentication Email" := Contact."E-Mail";
//                         PortalUSer."Mobile Phone No." := Contact."Phone No.";
//                         PortalUSer.State := PortalUSer.State::Enabled;
//                         PortalUSer."Record Type" := PortalUSer."record type"::Vendor;
//                         PortalUSer."Record ID" := ApplicantProfile."No.";
//                         RandomDigit := CreateGuid;
//                         RandomDigit := DelChr(RandomDigit, '=', '{}-01');
//                         RandomDigit := CopyStr(RandomDigit, 1, 8);
//                         PortalUser."Change Password" := true;
//                         PortalUSer."Password Value" := RandomDigit;
//                         PortalUSer."Last Modified Date" := Today;
//                         if PortalUSer.Insert(true) then begin
//                             status := 'success* Vendor created successfully';
//                         end;
//                     end;
//                 end;
//             end;
//         end;
//     end;

//     procedure fnUpdateAcknowledgementStatus(VendorNumber: Code[100]; documentno: Code[50]; signatoryID: Integer) status: Text
//     var
//         PurchaseHeader: Record "Purchase Header";
//         WorkExecutionPlan: Record "Work Execution Plan";
//     begin

//         ProjectMobilizationHeader.Reset;
//         ProjectMobilizationHeader.SetRange("Document No.", VendorNumber);
//         //ProjectMobilizationHeader.SETRANGE("Document Type",ProjectMobilizationHeader."Document Type"::"Order-To-Commence");
//         ProjectMobilizationHeader.SetRange("Purchase Contract ID", documentno);
//         if ProjectMobilizationHeader.Find('-') then begin
//             ProjectMobilizationHeader.Validate("Representative ID", signatoryID);
//             ProjectMobilizationHeader."Acknowledgement Status" := ProjectMobilizationHeader."acknowledgement status"::Acknowledged;
//             ProjectMobilizationHeader."Acknowledgement Date" := Today;
//             ProjectMobilizationHeader.Modify;
//             status := 'success*Acknowledgement was successfully submitted!';
//         end else begin
//             status := 'danger*Error!, could not update acknowledgement status';
//         end;
//         exit(status);
//     end;

//     procedure fnUpdateAcknowledgementStatusDWR(documentno: Code[50]; signatoryID: Integer) status: Text
//     var
//         DailyWorkRecord: Record "Daily Work Record";
//     begin
//         DailyWorkRecord.Reset;
//         DailyWorkRecord.SetRange("Document No.", documentno);
//         if DailyWorkRecord.Find('-') then begin
//             // DailyWorkRecord.Validate("Representative ID", signatoryID);
//             // DailyWorkRecord."Acknowledgement Status" := DailyWorkRecord."acknowledgement status"::Acknowledged;
//             // DailyWorkRecord."Acknowledgement DateTime" := CurrentDatetime;
//             // DailyWorkRecord.Modify;
//             status := 'success*Acknowledgement was successfully submitted!';
//         end else begin
//             status := 'danger*Error!, could not update acknowledgement status';
//         end;
//         exit(status);
//     end;

//     procedure fnUpdateAcknowledgementStatusSiteInstructions(documentno: Code[50]; signatoryID: Code[20]) status: Text
//     var
//     // RESiteInstructions: Record "Site Instructions Header";
//     begin
//         // RESiteInstructions.Reset;
//         // RESiteInstructions.SetRange("Document No.", documentno);
//         // if RESiteInstructions.Find('-') then begin
//         //     RESiteInstructions."Acknowledged By" := signatoryID;
//         //     RESiteInstructions."Acknowledgement Status" := RESiteInstructions."acknowledgement status"::Acknowledged;
//         //     RESiteInstructions."Acknowledment DateTime" := CurrentDatetime;
//         //     RESiteInstructions.Modify;
//         //     status := 'success*Acknowledgement was successfully submitted!';
//         // end else begin
//         //     status := 'danger*Error!, could not update acknowledgement status';
//         // end;
//         exit(status);
//     end;

//     procedure FnGeneratePCOReport(vendorNo: Code[20]; PCONo: Code[20]) status: Text
//     begin

//         //filename := FILESPATH+Path;
//         // IF EXISTS(filename) THEN
//         //
//         // ERASE(filename);
//         // if FILE.Exists(FILEPATHT + '\Downloads\' + Format(PCONo) + '.pdf') then
//         //     FILE.Erase(FILEPATHT + '\Downloads\' + Format(PCONo) + '.pdf');

//         ProjectMobilizationHeader.Reset;
//         ProjectMobilizationHeader.SetRange(ProjectMobilizationHeader."Document Type", ProjectMobilizationHeader."document type"::"Order-To-Commence");
//         ProjectMobilizationHeader.SetRange(ProjectMobilizationHeader."Document No.", PCONo);
//         if ProjectMobilizationHeader.FindSet then begin
//             // objVendor.SETFILTER(objVendor."Date Filter", FORMAT(FORMAT(startDate)  +'..'+ FORMAT(endDate)));


//             //  Report.SaveAsPdf(72026, FILEPATHT + '\Downloads\' + Format(PCONo) + '.pdf', ProjectMobilizationHeader);
//             status := 'success*Downloads\' + Format(PCONo) + '.pdf';
//             // END
//             // ELSE BEGIN

//             // END
//         end
//         else begin
//             status := 'danger*Error generating PCO Report!';
//             //ERROR(status);
//             // status:='danger*Vendor number not found!';
//         end;
//     end;

//     procedure fnSubmitWEPMethodofWorks(documentNumber: Code[50]; summary: Text; description: Text; entryno: Integer) status: Text
//     var
//     //  WEPMethodOfWorks: Record "WEP Method of Work";
//     begin
//         // WEPMethodOfWorks.Reset;
//         // WEPMethodOfWorks.SetRange("Document No", documentNumber);
//         // WEPMethodOfWorks.SetRange("Entry No", entryno);
//         // if WEPMethodOfWorks.FindSet then begin
//         //     WEPMethodOfWorks."Entry No" := entryno;
//         //     WEPMethodOfWorks."Document No" := documentNumber;
//         //     WEPMethodOfWorks."Document Type" := WEPMethodOfWorks."document type"::"Work Execution Programme";
//         //     WEPMethodOfWorks.Description := description;
//         //     WEPMethodOfWorks."Benefits Summary" := summary;
//         //     if WEPMethodOfWorks.Modify(true) then begin
//         //         status := 'success*Method of Work Details Was Successfully Modified!';
//         //     end else begin
//         //         status := 'danger*Method of Work Details Was Successfully Modified!';
//         //     end;
//         // end else begin
//         //     WEPMethodOfWorks.Init;
//         //     WEPMethodOfWorks."Document No" := documentNumber;
//         //     WEPMethodOfWorks."Document Type" := WEPMethodOfWorks."document type"::"Work Execution Programme";
//         //     WEPMethodOfWorks.Description := description;
//         //     WEPMethodOfWorks."Benefits Summary" := summary;

//         //     if WEPMethodOfWorks.Insert(true) then begin
//         //         status := 'success*Method of Work Details Was Successfully Submitted!';
//         //     end else begin
//         //         status := 'danger*Method of Work Details Was Not Submitted!';
//         //     end;
//         // end;
//     end;

//     procedure fnsendWEPRecordForApproval(vendorNo: Code[50]; documentNo: Code[50]; recordType: Text) status: Text
//     var
//         ProjectMobilizationHeader1: Record "Project Mobilization Header";
//     begin
//         status := 'danger*The record could not be sent for approval';
//         recordType := UpperCase(recordType);
//         if recordType = 'WEP' then begin
//             status := 'danger*The Work Execution Plan could not be sent for approval';
//             ProjectMobilizationHeader.Reset;
//             ProjectMobilizationHeader.SetRange("Document No.", documentNo);
//             ProjectMobilizationHeader.SetRange("Contractor No.", vendorNo);
//             if ProjectMobilizationHeader.FindSet then begin
//                 // if ApprovalsMgmt.CheckWEPPCOReqApprovalPossible(ProjectMobilizationHeader) then
//                 //     ApprovalsMgmt.OnSendWEPPCOReqForApproval(ProjectMobilizationHeader);
//                 if ProjectMobilizationHeader1.Get(ProjectMobilizationHeader."Document No.") then begin
//                     if ProjectMobilizationHeader1.Status = ProjectMobilizationHeader1.Status::Open then begin
//                         status := 'warning*Your Work Execution Plan  could not be sent for approval';
//                     end else begin
//                         status := 'success*Your Work Execution Plan was successfully  sent for approval';
//                     end;
//                 end;
//             end else begin
//                 status := 'danger*The Work Execution Plan does not exist or you are not the requester';
//             end;
//         end;
//         exit(status);
//     end;

//     procedure fncancelWEPRecordApproval(vendorNo: Code[50]; documentNo: Code[50]; recordType: Text) status: Text
//     var
//         ProjectMobilizationHeader1: Record "Project Mobilization Header";
//     begin
//         status := 'danger*The record approval could not be cancelled';
//         recordType := Lowercase(recordType);
//         if recordType = 'WEP' then begin
//             status := 'danger*The Work Execution Plan approval could not be cancelled';
//             ProjectMobilizationHeader.Reset;
//             ProjectMobilizationHeader.SetRange("Document No.", documentNo);
//             ProjectMobilizationHeader.SetRange("Contractor No.", vendorNo);
//             if ProjectMobilizationHeader.FindSet then begin
//                 // ApprovalsMgmt.OnCancelWEPPCOReqApprovalRequest(ProjectMobilizationHeader);
//                 if ProjectMobilizationHeader1.Get(ProjectMobilizationHeader."Document No.") then begin
//                     if ProjectMobilizationHeader1.Status = ProjectMobilizationHeader1.Status then begin
//                         status := 'warning*Your Work Execution Plan approval could not be cancelled';
//                     end else begin
//                         status := 'success*Your Work Execution Plan approval was successfully cancelled';
//                     end;
//                 end;
//             end else begin
//                 status := 'danger*The Work Execution Plan does not exist or you are not the requester';

//             end;

//         end;

//         exit(status);
//     end;

//     procedure FnGenerateWEPReport(vendorNo: Code[20]; PCONo: Code[20]) status: Text
//     begin

//         //filename := FILESPATH+Path;
//         // IF EXISTS(filename) THEN
//         //
//         // ERASE(filename);

//         // if FILE.Exists(FILEPATHT + '\Downloads\' + Format(PCONo) + '.pdf') then
//         //     FILE.Erase(FILEPATHT + '\Downloads\' + Format(PCONo) + '.pdf');

//         ProjectMobilizationHeader.Reset;
//         ProjectMobilizationHeader.SetRange(ProjectMobilizationHeader."Document Type", ProjectMobilizationHeader."document type"::"Work Execution Programme");
//         ProjectMobilizationHeader.SetRange(ProjectMobilizationHeader."Document No.", PCONo);
//         if ProjectMobilizationHeader.FindSet then begin
//             // Report.SaveAsPdf(72025, FILEPATHT + '\Downloads\' + Format(PCONo) + '.pdf', ProjectMobilizationHeader);
//             status := 'success*Downloads\' + Format(PCONo) + '.pdf';
//             // END
//             // ELSE BEGIN

//             // END
//         end
//         else begin
//             status := 'danger*Error generating PCO Report!';
//             //ERROR(status);
//             // status:='danger*Vendor number not found!';
//         end;
//     end;

//     procedure fnSubmitProjectPhotoRecord(projectid: Code[50]; externalrefno: Code[10]; comments: Text) status: Text
//     var
//     // ProjectPhotoRecord: Record "Project Photo Record";
//     begin

//         // ProjectPhotoRecord.Init;
//         // ProjectPhotoRecord.Validate("Project ID", projectid);
//         // ProjectPhotoRecord."External Reference No." := externalrefno;
//         // ProjectPhotoRecord."Additional Comments/Notes" := comments;
//         // ProjectPhotoRecord."Date Filed" := Today;

//         // if ProjectPhotoRecord.Insert(true) then begin
//         //     status := 'success*Project Photo Record Details Was Successfully Submitted!';
//         // end else begin
//         //     status := 'danger*Project Photo Record Details Was Not Submitted!';
//         // end;
//     end;

//     procedure fnCreateNewDailyWorkRecord(vendornumber: Code[20]; wepID: Code[50]; temperature: Decimal; workingstartdade: Time; workingenddate: Time; casualstaffno: Integer; rainfall: Decimal; otherWeathercondition: Text) status: Text
//     var
//         DailyWorkRecord: Record "Daily Work Record";
//     begin
//         DailyWorkRecord.Init;
//         DailyWorkRecord."Document No." := '';
//         // DailyWorkRecord."Document Date" := Today;
//         // DailyWorkRecord.Validate("Work Execution Programme ID", wepID);
//         // DailyWorkRecord."Average Temperature" := temperature;
//         // DailyWorkRecord."Working End Time" := workingenddate;
//         // DailyWorkRecord."Working Start Time" := workingstartdade;
//         // DailyWorkRecord."No. of Casual Staff" := casualstaffno;
//         // DailyWorkRecord."Rainfall (mm)" := rainfall;
//         // DailyWorkRecord."Other Weather Condition" := otherWeathercondition;
//         if DailyWorkRecord.Insert(true) then begin
//             status := 'success*' + DailyWorkRecord."Document No." + '*New Daily Work Record Was Successfully Created!'
//         end else begin
//             status := 'danger*Error while Creating the Daily Work Record!'
//         end;
//         //END;
//     end;

//     procedure fnSubmitDailyWorkRecordExecutionLines(vendornumber: Code[20]; Documentno: Code[50]; projectid: Code[30]; jobtaskno: Code[20]; lineno: Integer; quantitydone: Decimal; additionalcomments: Text; photono: Code[20]) status: Text
//     var
//     // DailyWorkRecordExecution: Record "Daily Work Record Execution";
//     begin
//         // DailyWorkRecordExecution.Init;
//         // DailyWorkRecordExecution."Document No." := Documentno;
//         // if DailyWorkRecordExecution.Insert(true) then begin

//         //     DailyWorkRecordExecution."Document Date" := Today;
//         //     DailyWorkRecordExecution."Job No." := projectid;
//         //     DailyWorkRecordExecution."Job Task No." := jobtaskno;
//         //     DailyWorkRecordExecution.Validate("Line No.", lineno);
//         //     DailyWorkRecordExecution."Quantity Done" := quantitydone;
//         //     DailyWorkRecordExecution."Additional Comments/Notes" := additionalcomments;
//         //     DailyWorkRecordExecution."Photo No." := photono;
//         //     if DailyWorkRecordExecution.Modify(true) then begin
//         //         status := 'success*New Progress of Works Was Successfully Created!'
//         //     end else begin
//         //         status := 'danger*Error while Creating the Progress of Works!'
//         //     end;
//         // end else begin
//         //     status := 'danger*Error while Creating the Progress of Works!'
//         // end
//     end;

//     procedure fngetDWRWorkExecutionPlanNumber(VendorNumber: Code[100]; dailyworkrecordno: Code[50]) workexecutionplanNumber: Code[100]
//     var
//         DailyWorkRecord: Record "Daily Work Record";
//     begin
//         DailyWorkRecord.Reset;
//         // DailyWorkRecord.SetRange("Contractor No.", VendorNumber);
//         DailyWorkRecord.SetRange("Document No.", dailyworkrecordno);
//         if DailyWorkRecord.FindLast then begin
//             //workexecutionplanNumber := DailyWorkRecord."Work Execution Programme ID";
//         end else begin
//             workexecutionplanNumber := '';
//         end;
//     end;

//     procedure fngetDailyWorkRecordProjectNumber(documentno: Code[50]) ProjectNumber: Code[100]
//     var
//         DailyWorkRecord: Record "Daily Work Record";
//     begin
//         DailyWorkRecord.Reset;
//         DailyWorkRecord.SetRange("Document No.", documentno);
//         if DailyWorkRecord.FindLast then begin
//             // ProjectNumber := DailyWorkRecord."Project ID";
//         end else begin
//             ProjectNumber := '';
//         end;
//     end;

//     procedure fngetDailyWorkRecordDocumentDate(documentno: Code[50]) ProjectNumber: Code[100]
//     var
//         DailyWorkRecord: Record "Daily Work Record";
//     begin
//         DailyWorkRecord.Reset;
//         DailyWorkRecord.SetRange("Document No.", documentno);
//         if DailyWorkRecord.FindLast then begin
//             // ProjectNumber := Format(DailyWorkRecord."Document Date");
//         end else begin
//             ProjectNumber := '';
//         end;
//     end;

//     procedure fngetEOTRequestProjectEngineer(documentno: Code[50]) result: Code[100]
//     var
//     //  InternalProjectResource: Record "Internal Project Resource";
//     begin
//         // InternalProjectResource.Reset;
//         // InternalProjectResource.SetRange(InternalProjectResource."Project ID", documentno);
//         // InternalProjectResource.SetRange(InternalProjectResource."Project Manager", true);
//         // if InternalProjectResource.FindSet then begin
//         //     result := InternalProjectResource."Resource No.";
//         // end
//         // else begin
//         //     result := '';
//         // end;
//     end;

//     procedure fngetEOTRequestProjectManager(documentno: Code[50]) result: Code[100]
//     var
//     //  InternalProjectResource: Record "Internal Project Resource";
//     begin
//         // InternalProjectResource.Reset;
//         // InternalProjectResource.SetRange(InternalProjectResource."Project ID", documentno);
//         // InternalProjectResource.SetRange(InternalProjectResource."Project Manager", true);
//         // if InternalProjectResource.FindSet then begin
//         //     result := InternalProjectResource."User ID";

//         // end
//         // else begin
//         //     result := '';
//         // end;
//     end;

//     procedure fnSubmitDailyWorkRecordKeyTeam(vendornumber: Code[20]; Documentno: Code[50]; projectid: Code[30]; contractorstaffno: Code[20]) status: Text
//     var
//     // DailyWorkRecordKeyTeam: Record "Daily Work Record Key Team";
//     begin

//         // DailyWorkRecordKeyTeam.Init;
//         // DailyWorkRecordKeyTeam."Document No." := Documentno;
//         // if DailyWorkRecordKeyTeam.Insert(true) then begin
//         //     DailyWorkRecordKeyTeam.Validate("Contractor Staff No.", contractorstaffno);
//         //     if DailyWorkRecordKeyTeam.Modify(true) then begin
//         //         status := 'success*New Key Team Was Successfully Created!'
//         //     end else begin
//         //         status := 'danger*Error while Creating the Key Team!'
//         //     end;
//         // end else begin
//         //     status := 'danger*Error while Creating the Key Team!'
//         // end
//     end;

//     procedure fnSubmitDailyWorkRecordEquipment(vendornumber: Code[20]; Documentno: Code[50]; projectid: Code[30]; equipmentno: Code[20]; photono: Code[50]; utilization: Integer; usagehours: Integer; remarks: Text) status: Text
//     var
//     // DailyWorkRecordEquipment: Record "Daily Work Record Equipment";
//     begin

//         // DailyWorkRecordEquipment.Init;
//         // DailyWorkRecordEquipment."Document No." := Documentno;
//         // DailyWorkRecordEquipment."Equipment No." := equipmentno;
//         // //DailyWorkRecordEquipment.VALIDATE("Equipment No.",equipmentno);
//         // DailyWorkRecordEquipment."Photo No." := photono;
//         // DailyWorkRecordEquipment."Equipment Utilization" := utilization;
//         // DailyWorkRecordEquipment."Equipment Usage Hours" := usagehours;
//         // DailyWorkRecordEquipment.Remarks := remarks;
//         // if DailyWorkRecordEquipment.Insert(true) then begin
//         //     status := 'success*New Key Team Was Successfully Created!'

//         // end else begin
//         //     status := 'danger*Error while Creating the Key Team!'
//         // end
//     end;

//     procedure fnSubmitDailyWorkRecordMaterialsDelivered(vendornumber: Code[20]; Documentno: Code[50]; materialid: Code[20]; photono: Code[50]; quantity: Integer; materialtestrecid: Code[10]) status: Text
//     var
//     // DailyWorkRecordMaterial: Record "Daily Work Record Material";
//     begin

//         // DailyWorkRecordMaterial.Init;
//         // DailyWorkRecordMaterial."Document No." := Documentno;
//         // DailyWorkRecordMaterial."Movement Type" := DailyWorkRecordMaterial."movement type"::"Delivered To Site";
//         // DailyWorkRecordMaterial.Validate("Material ID", materialid);
//         // DailyWorkRecordMaterial."Photo No." := photono;
//         // if materialtestrecid <> 'null' then
//         //     DailyWorkRecordMaterial."Material Test Record ID" := materialtestrecid;
//         // DailyWorkRecordMaterial.Quantity := quantity;
//         // if DailyWorkRecordMaterial.Insert(true) then begin

//         //     status := 'success*New Material Delivered Was Successfully Created!'

//         // end else begin
//         //     status := 'danger*Error while Creating the Material Delivered!'
//         // end
//     end;

//     procedure fnSubmitDailyWorkRecordMaterialsRemoved(vendornumber: Code[20]; Documentno: Code[50]; materialid: Code[20]; photono: Code[50]; quantity: Integer; materialtestrecid: Code[10]; reasonsforremoval: Text) status: Text
//     var
//     // DailyWorkRecordMaterial: Record "Daily Work Record Material";
//     begin

//         // DailyWorkRecordMaterial.Init;
//         // DailyWorkRecordMaterial."Movement Type" := DailyWorkRecordMaterial."movement type"::"Removed From Site";
//         // DailyWorkRecordMaterial."Document No." := Documentno;
//         // if materialtestrecid <> 'null' then
//         //     DailyWorkRecordMaterial.Validate("Material ID", materialid);
//         // DailyWorkRecordMaterial."Photo No." := photono;
//         // DailyWorkRecordMaterial."Material Test Record ID" := materialtestrecid;
//         // DailyWorkRecordMaterial.Quantity := quantity;
//         // DailyWorkRecordMaterial."Reasons for Removal" := reasonsforremoval;
//         // if DailyWorkRecordMaterial.Insert(true) then begin
//         //     status := 'success*New Material Removed Was Successfully Created!'

//         // end else begin
//         //     status := 'danger*Error while Creating the Material Removed!'
//         // end
//     end;

//     procedure fnSubmitDailyWorkRecordLabourSchedule(vendornumber: Code[20]; Documentno: Code[50]; labourtype: Integer; noofstaff: Integer; averagemanhours: Decimal; estimatetotalwagespaid: Decimal) status: Text
//     var
//     // DailyWorkRecordLabours: Record "Daily Work Record Labor";
//     begin

//         // DailyWorkRecordLabours.Init;
//         // DailyWorkRecordLabours."Document No." := Documentno;
//         // if DailyWorkRecordLabours.Insert(true) then begin
//         //     DailyWorkRecordLabours.Validate(Gender, labourtype);
//         //     DailyWorkRecordLabours."Total No. of Staff" := noofstaff;
//         //     DailyWorkRecordLabours."Average ManHours Worked" := averagemanhours;
//         //     DailyWorkRecordLabours."Estimate Total Wages Paid" := estimatetotalwagespaid;
//         //     if DailyWorkRecordLabours.Modify(true) then begin
//         //         status := 'success*New Labour Schedule Was Successfully Created!'
//         //     end else begin
//         //         status := 'danger*Error while Creating the Labour Schedule!'
//         //     end;
//         // end else begin
//         //     status := 'danger*Error while Creating the Labour Schedule!'
//         // end
//     end;

//     procedure fnSubmitDailyWorkRecordVisitor(vendornumber: Code[20]; Documentno: Code[50]; projectid: Code[30]; visitorname: Text; organization: Text; timein: Time; timeout: Time; purpose: Text; telephoneno: Code[20]; idpassportno: Code[20]; remarks: Text; vistoremail: Text) status: Text
//     var
//     // DailyWorkRecordVisitor: Record "Daily Work Record Visitor";
//     begin
//         // DailyWorkRecordVisitor.Init;
//         // DailyWorkRecordVisitor."Document No." := Documentno;
//         // if DailyWorkRecordVisitor.Insert(true) then begin
//         //     DailyWorkRecordVisitor."Visitor Name" := visitorname;
//         //     DailyWorkRecordVisitor.Organization := organization;
//         //     DailyWorkRecordVisitor."Time In" := timein;
//         //     DailyWorkRecordVisitor."Time Out" := timeout;
//         //     DailyWorkRecordVisitor."Purpose of Visit" := purpose;
//         //     DailyWorkRecordVisitor."Telephone No." := telephoneno;
//         //     DailyWorkRecordVisitor."ID/Passport No." := idpassportno;
//         //     DailyWorkRecordVisitor.Remarks := remarks;
//         //     DailyWorkRecordVisitor."Visitor Email" := vistoremail;
//         //     if DailyWorkRecordVisitor.Modify(true) then begin
//         //         status := 'success*New Visitor Was Successfully Created!'
//         //     end else begin
//         //         status := 'danger*Error while Creating the Visitor!'
//         //     end;
//         // end else begin
//         //     status := 'danger*Error while Creating the Visitor!'
//         // end
//     end;

//     procedure fnSubmitDailyWorkRecordMeetings(vendornumber: Code[20]; Documentno: Code[50]; projectid: Code[30]; meetingtype: Code[20]; meetingorganizerid: Code[20]; starttime: Time; endtime: Time; duration: Text; startdate: Date; enddate: Date; meetingstatus: Integer; venue: Text) status: Text
//     var
//     //DailyWorkRecordMeetings: Record "Daily Work Record Meeting";
//     begin
//         // DailyWorkRecordMeetings.Init;
//         // DailyWorkRecordMeetings."Document No." := Documentno;
//         // if DailyWorkRecordMeetings.Insert(true) then begin
//         //     DailyWorkRecordMeetings.Validate("Meeting Type", meetingtype);
//         //     DailyWorkRecordMeetings."Meeting Organizer ID" := meetingorganizerid;
//         //     DailyWorkRecordMeetings."Start Date" := startdate;
//         //     DailyWorkRecordMeetings."Start Time" := starttime;
//         //     //DailyWorkRecordMeetings."Duration(Days)",duration);
//         //     DailyWorkRecordMeetings."End Date" := enddate;
//         //     DailyWorkRecordMeetings."End Time" := endtime;
//         //     DailyWorkRecordMeetings."Venue/Location" := venue;
//         //     DailyWorkRecordMeetings."Meeting Status" := meetingstatus;
//         //     if DailyWorkRecordMeetings.Modify(true) then begin
//         //         status := 'success*New Meeting Was Successfully Created!'
//         //     end else begin
//         //         status := 'danger*Error while Creating the Meeting!'
//         //     end;
//         // end else begin
//         //     status := 'danger*Error while Creating the Meeting!'
//         // end
//     end;

//     procedure fnSubmitContractorAdvancePayment(vendornumber: Code[20]; Documentno: Code[50]; projectid: Code[30]; advanceamount: Decimal; guaranteeref: Integer; performancesecurityid: Integer; advancejustification: Text) status: Text
//     var
//     // ContractorPaymentRequest: Record "Measurement &  Payment Header";
//     // ContractorRequestPlanLine: Record "Contractor Request Plan Line";
//     // ContractorRequestTask: Record "Contractor Request Task";
//     begin

//         // ContractorPaymentRequest.Init;
//         // ContractorPaymentRequest."Document Type" := ContractorPaymentRequest."document type"::"Contractor Payment Request";
//         // ContractorPaymentRequest."Payment Certificate Type" := ContractorPaymentRequest."payment certificate type"::"Advance Payment";
//         // ContractorPaymentRequest."Project ID" := projectid;
//         // ContractorPaymentRequest."Requested Advance Payment(LCY)" := advanceamount;
//         // ContractorPaymentRequest."Advance Payment Security ID" := guaranteeref;
//         // ContractorPaymentRequest."Performance Security ID" := performancesecurityid;
//         // ContractorPaymentRequest."Advance Payment Justification" := advancejustification;
//         // if ContractorPaymentRequest.Insert(true) then begin
//         //     ContractorPaymentRequest.Validate("Project ID");
//         //     ContractorPaymentRequest.Validate("Advance Payment Security ID");
//         //     ContractorPaymentRequest.Validate("Performance Security ID");
//         //     ContractorPaymentRequest.Validate("Requested Advance Payment(LCY)");
//         //     if ContractorPaymentRequest.Modify(true) then begin
//         //         Rec := ContractorPaymentRequest;
//         //         RMSManagement.FnSuggesTasks_PlanLinesFromJob(ContractorRequestTask, ContractorRequestPlanLine, Rec);
//         //         status := 'success*' + ContractorPaymentRequest."Document No." + '*New Advance Payment Request Was Successfully Created!'
//         //     end else begin
//         //         status := 'danger*Error while Creating the Advance Payment Request!'
//         //     end;
//         // end else begin
//         //     status := 'danger*Error while Creating the Advance Payment Request!'
//         // end
//     end;

//     procedure fnSubmitContractorPaymentRequest(vendornumber: Code[20]; Documentno: Code[50]; projectid: Code[30]; milestonecode: Code[20]; guaranteeref: Integer; performancesecurityid: Integer) status: Text
//     var
//     // ContractorPaymentRequest: Record "Measurement &  Payment Header";
//     // ContractorRequestPlanLine: Record "Contractor Request Plan Line";
//     // ContractorRequestTask: Record "Contractor Request Task";
//     begin

//         // ContractorPaymentRequest.Init;
//         // ContractorPaymentRequest."Document Type" := ContractorPaymentRequest."document type"::"Contractor Payment Request";
//         // ContractorPaymentRequest."Payment Certificate Type" := ContractorPaymentRequest."payment certificate type"::"Interim Payment";
//         // ContractorPaymentRequest."Advance Payment Security ID" := guaranteeref;
//         // ContractorPaymentRequest."Performance Security ID" := performancesecurityid;
//         // ContractorPaymentRequest."Milestone Code" := milestonecode;
//         // if ContractorPaymentRequest.Insert(true) then begin
//         //     ContractorPaymentRequest.Validate("Project ID", projectid);
//         //     ContractorPaymentRequest.Validate("Advance Payment Security ID");
//         //     ContractorPaymentRequest.Validate("Performance Security ID");
//         //     if ContractorPaymentRequest.Modify(true) then begin
//         //         Rec := ContractorPaymentRequest;
//         //         RMSManagement.FnSuggesTasks_PlanLinesFromJob(ContractorRequestTask, ContractorRequestPlanLine, Rec);
//         //         status := 'success*' + ContractorPaymentRequest."Document No." + '*New Payment Request Was Successfully Created!'
//         //     end else begin
//         //         status := 'danger*Error while Creating the Payment Request!'
//         //     end;
//         // end else begin
//         //     status := 'danger*Error while Creating the Payment Request!'
//         // end
//     end;

//     procedure fnSubmitContractorRetentionPaymentRequest(vendornumber: Code[20]; Documentno: Code[50]; projectid: Code[30]; milestonecode: Code[20]) status: Text
//     var
//     // ContractorPaymentRequest: Record "Measurement &  Payment Header";
//     // ContractorRequestPlanLine: Record "Contractor Request Plan Line";
//     // ContractorRequestTask: Record "Contractor Request Task";
//     begin

//         // ContractorPaymentRequest.Init;
//         // ContractorPaymentRequest."Document Type" := ContractorPaymentRequest."document type"::"Contractor Payment Request";
//         // ContractorPaymentRequest."Payment Certificate Type" := ContractorPaymentRequest."payment certificate type"::"Retention Payment";
//         // ContractorPaymentRequest."Project ID" := projectid;
//         // ContractorPaymentRequest."Milestone Code" := milestonecode;
//         // if ContractorPaymentRequest.Insert(true) then begin
//         //     ContractorPaymentRequest.Validate("Project ID");
//         //     if ContractorPaymentRequest.Modify(true) then begin
//         //         Rec := ContractorPaymentRequest;
//         //         RMSManagement.FnSuggesTasks_PlanLinesFromJob(ContractorRequestTask, ContractorRequestPlanLine, Rec);
//         //         status := 'success*' + ContractorPaymentRequest."Document No." + '*New Retention Payment Request Was Successfully Created!'
//         //     end else begin
//         //         status := 'danger*Error while Creating the Retention Payment Request!'
//         //     end;
//         // end else begin
//         //     status := 'danger*Error while Creating the Retention Payment Request!'
//         // end
//     end;

//     procedure fnSubmitContractorFinalPaymentRequest(vendornumber: Code[20]; Documentno: Code[50]; projectid: Code[30]; milestonecode: Code[20]; guaranteeref: Integer; performancesecurityid: Integer) status: Text
//     var
//     // ContractorPaymentRequest: Record "Measurement &  Payment Header";
//     // ContractorRequestPlanLine: Record "Contractor Request Plan Line";
//     // ContractorRequestTask: Record "Contractor Request Task";
//     begin

//         // ContractorPaymentRequest.Init;
//         // ContractorPaymentRequest."Document Type" := ContractorPaymentRequest."document type"::"Contractor Payment Request";
//         // ContractorPaymentRequest."Payment Certificate Type" := ContractorPaymentRequest."payment certificate type"::"Final Payment";
//         // ContractorPaymentRequest."Advance Payment Security ID" := guaranteeref;
//         // ContractorPaymentRequest."Performance Security ID" := performancesecurityid;
//         // ContractorPaymentRequest."Milestone Code" := milestonecode;
//         // if ContractorPaymentRequest.Insert(true) then begin
//         //     ContractorPaymentRequest.Validate("Project ID", projectid);
//         //     ContractorPaymentRequest.Validate("Advance Payment Security ID");
//         //     ContractorPaymentRequest.Validate("Performance Security ID");
//         //     if ContractorPaymentRequest.Modify(true) then begin
//         //         Rec := ContractorPaymentRequest;
//         //         RMSManagement.FnSuggesTasks_PlanLinesFromJob(ContractorRequestTask, ContractorRequestPlanLine, Rec);
//         //         status := 'success*' + ContractorPaymentRequest."Document No." + '*New Final Payment Request Was Successfully Created!'
//         //     end else begin
//         //         status := 'danger*Error while Creating the Final Payment Request!'
//         //     end;
//         // end else begin
//         //     status := 'danger*Error while Creating the Final Payment Request!'
//         // end
//     end;

//     procedure fnSubmitContractorInterestPaymentRequest(vendornumber: Code[20]; Documentno: Code[50]; projectid: Code[30]; interestamount: Decimal) status: Text
//     var
//     // ContractorPaymentRequest: Record "Measurement &  Payment Header";
//     // ContractorRequestPlanLine: Record "Contractor Request Plan Line";
//     // ContractorRequestTask: Record "Contractor Request Task";
//     begin

//         // ContractorPaymentRequest.Init;
//         // ContractorPaymentRequest."Document Type" := ContractorPaymentRequest."document type"::"Contractor Payment Request";
//         // ContractorPaymentRequest."Payment Certificate Type" := ContractorPaymentRequest."payment certificate type"::Interest;
//         // ContractorPaymentRequest."Project ID" := projectid;
//         // ContractorPaymentRequest."Requested Advance Payment(LCY)" := interestamount;
//         // if ContractorPaymentRequest.Insert(true) then begin
//         //     ContractorPaymentRequest.Validate("Project ID");
//         //     // ContractorPaymentRequest.VALIDATE("Requested Advance Payment(LCY)");
//         //     if ContractorPaymentRequest.Modify(true) then begin
//         //         Rec := ContractorPaymentRequest;
//         //         RMSManagement.FnSuggesTasks_PlanLinesFromJob(ContractorRequestTask, ContractorRequestPlanLine, Rec);
//         //         status := 'success*' + ContractorPaymentRequest."Document No." + '*New Interest Payment Request Was Successfully Created!'
//         //     end else begin
//         //         status := 'danger*Error while Creating the Interest Payment Request!'
//         //     end;
//         // end else begin
//         //     status := 'danger*Error while Creating the Interest Payment Request!'
//         // end
//     end;

//     procedure fnSubmiCPRTaskLines(vendornumber: Code[20]; Documentno: Code[50]; projectid: Code[30]; jobtaskno: Code[20]; lineno: Integer; quantitydone: Decimal; additionalcomments: Text; photono: Code[20]) status: Text
//     var
//     // ContractorRequestTask: Record "Contractor Request Task";
//     begin
//         // ContractorRequestTask.Init;
//         // ContractorRequestTask."Document No." := Documentno;
//         // if ContractorRequestTask.Insert(true) then begin


//         //     ContractorRequestTask."Job No." := projectid;
//         //     ContractorRequestTask."Job Task No." := jobtaskno;
//         //     // ContractorRequestTask.VALIDATE("Line No.",lineno);
//         //     // ContractorRequestTask."Quantity Done":=quantitydone;
//         //     // ContractorRequestTask."Additional Comments/Notes":=additionalcomments;
//         //     // ContractorRequestTask."Photo No.":=photono;
//         //     if ContractorRequestTask.Modify(true) then begin
//         //         status := 'success*New Progress of Works Was Successfully Created!'
//         //     end else begin
//         //         status := 'danger*Error while Creating the Progress of Works!'
//         //     end;
//         // end else begin
//         //     status := 'danger*Error while Creating the Progress of Works!'
//         // end
//     end;

//     procedure fnSubmiCPRPlanningLines(vendornumber: Code[20]; Documentno: Code[50]; projectid: Code[30]; jobtaskno: Code[20]; lineno: Integer; quantitydone: Decimal; additionalcomments: Text; photono: Code[20]) status: Text
//     var
//     // ContractorRequestPlanLine: Record "Contractor Request Plan Line";
//     begin

//         // ContractorRequestPlanLine.Init;
//         // ContractorRequestPlanLine."Document No." := Documentno;
//         // if ContractorRequestPlanLine.Insert(true) then begin

//         //     ContractorRequestPlanLine."Document Date" := Today;
//         //     ContractorRequestPlanLine."Job No." := projectid;
//         //     ContractorRequestPlanLine."Job Task No." := jobtaskno;
//         //     ContractorRequestPlanLine.Validate("Line No.", lineno);

//         //     if ContractorRequestPlanLine.Modify(true) then begin
//         //         status := 'success*New Progress of Works Was Successfully Created!'
//         //     end else begin
//         //         status := 'danger*Error while Creating the Progress of Works!'
//         //     end;
//         // end else begin
//         //     status := 'danger*Error while Creating the Progress of Works!'
//         // end
//     end;

//     procedure fnSubmitFeeNoteRequest(vendornumber: Code[20]; Documentno: Code[50]; projectid: Code[30]) status: Text
//     var
//     // ContractorPaymentRequest: Record "Measurement &  Payment Header";
//     // ContractorRequestPlanLine: Record "Contractor Request Plan Line";
//     // ContractorRequestTask: Record "Contractor Request Task";
//     begin

//         // ContractorPaymentRequest.Init;
//         // ContractorPaymentRequest."Document Type" := ContractorPaymentRequest."document type"::"Fee Note";
//         // ContractorPaymentRequest."Payment Certificate Type" := ContractorPaymentRequest."payment certificate type"::"Interim Payment";
//         // if ContractorPaymentRequest.Insert(true) then begin
//         //     ContractorPaymentRequest.Validate("Project ID", projectid);
//         //     if ContractorPaymentRequest.Modify(true) then begin
//         //         Rec := ContractorPaymentRequest;
//         //         RMSManagement.FnSuggesTasks_PlanLinesFromJob(ContractorRequestTask, ContractorRequestPlanLine, Rec);
//         //         status := 'success*' + ContractorPaymentRequest."Document No." + '*New Payment Request Was Successfully Created!'
//         //     end else begin
//         //         status := 'danger*Error while Creating the Payment Request!'
//         //     end;
//         // end else begin
//         //     status := 'danger*Error while Creating the Payment Request!'
//         // end
//     end;

//     procedure fnSubmiFeeNoteTaskLines(vendornumber: Code[20]; Documentno: Code[50]; projectid: Code[30]; jobtaskno: Code[20]; lineno: Integer; quantitydone: Decimal; additionalcomments: Text; photono: Code[20]) status: Text
//     var
//     // ContractorRequestTask: Record "Contractor Request Task";
//     begin
//         // ContractorRequestTask.Init;
//         // ContractorRequestTask."Document No." := Documentno;
//         // if ContractorRequestTask.Insert(true) then begin


//         //     ContractorRequestTask."Job No." := projectid;
//         //     ContractorRequestTask."Job Task No." := jobtaskno;
//         //     // ContractorRequestTask.VALIDATE("Line No.",lineno);
//         //     // ContractorRequestTask."Quantity Done":=quantitydone;
//         //     // ContractorRequestTask."Additional Comments/Notes":=additionalcomments;
//         //     // ContractorRequestTask."Photo No.":=photono;
//         //     if ContractorRequestTask.Modify(true) then begin
//         //         status := 'success*New Progress of Works Was Successfully Created!'
//         //     end else begin
//         //         status := 'danger*Error while Creating the Progress of Works!'
//         //     end;
//         // end else begin
//         //     status := 'danger*Error while Creating the Progress of Works!'
//         // end
//     end;

//     procedure fnSubmiFeeNotePlanningLines(vendornumber: Code[20]; Documentno: Code[50]; projectid: Code[30]; jobtaskno: Code[20]; lineno: Integer; qtytoorder: Decimal) status: Text
//     var
//     //ContractorRequestPlanLine: Record "Contractor Request Plan Line";
//     begin

//         // ContractorRequestPlanLine.Reset;
//         // ContractorRequestPlanLine.SetRange("Document No.", Documentno);
//         // ContractorRequestPlanLine.SetRange("Line No.", lineno);
//         // if ContractorRequestPlanLine.Find('-') then begin
//         //     ContractorRequestPlanLine."Qty. to Order" := qtytoorder;
//         //     ContractorRequestPlanLine.Validate("Qty. to Order");
//         //     if ContractorRequestPlanLine.Modify(true) then begin
//         //         status := 'success*Fee Note Planning Line Was Successfully Updated!'
//         //     end else begin
//         //         status := 'danger*Error while Creating the Fee Note Planning Line!'
//         //     end;
//         // end else begin
//         //     status := 'danger*Error while Creating the Fee Note Planning Line!'
//         // end
//     end;

//     procedure fngetCPRProjectNumber(documentno: Code[50]) ProjectNumber: Text
//     var
//     //ContractorPaymentRequest: Record "Measurement &  Payment Header";
//     begin

//         // ContractorPaymentRequest.Reset;
//         // ContractorPaymentRequest.SetRange("Document No.", documentno);
//         // if ContractorPaymentRequest.FindLast then begin
//         //     ProjectNumber := ContractorPaymentRequest."Project ID" + '*' + ContractorPaymentRequest."Project Name" + '*' + Format(ContractorPaymentRequest."IPC Number")
//         //  + '*' + Format(ContractorPaymentRequest."Settled Amount") + '*' + Format(ContractorPaymentRequest."Project Start Date");
//         // end else begin
//         //     ProjectNumber := '';
//         // end;
//     end;

//     procedure fnSubmitRiskManagementPlan(vendornumber: Code[20]; Documentno: Code[50]; projectid: Code[30]; primarymission: Text; staffno: Code[20]) status: Text
//     var
//         RiskManagementPlan: Record "Risk Management Plan";
//     begin


//         RiskManagementPlan.Init;
//         RiskManagementPlan."Document Type" := RiskManagementPlan."document type"::Project;
//         if RiskManagementPlan.Insert(true) then begin
//             RiskManagementPlan.Validate("Project ID", projectid);
//             RiskManagementPlan."Primary MIssion" := primarymission;
//             RiskManagementPlan."Risk Likelihood Rate Scale ID" := fngetRiskRatingScaleID(1);
//             RiskManagementPlan."Risk Impact Rating Scale ID" := fngetRiskRatingScaleID(2);
//             RiskManagementPlan."Overall Risk Rating Scale ID" := fngetRiskRatingScaleID(3);
//             RiskManagementPlan."Risk Appetite Rating Scale ID" := fngetRiskRatingScaleID(4);
//             if staffno <> '' then
//                 RiskManagementPlan."Responsible Officer No." := staffno;
//             RiskManagementPlan.Status := RiskManagementPlan.Status::Open;
//             // RiskManagementPlan."Portal Status" := RiskManagementPlan."portal status"::Draft;
//             if RiskManagementPlan.Modify(true) then begin

//                 status := 'success*' + RiskManagementPlan."Document No" + '*New Risk Management Plan Was Successfully Created!'
//             end else begin
//                 status := 'danger*Error while Creating the Risk Management Plan!'
//             end;
//         end else begin
//             status := 'danger*Error while Creating the Risk Management Plan!'
//         end
//     end;

//     procedure fnSubmitRiskManagementPlanLines(vendornumber: Code[20]; Documentno: Code[50]; projectid: Code[30]; riskcategory: Code[50]; riskimpacttype: Integer; estimatefinancialimpact: Decimal; risklikelihoodcode: Code[20]; riskresponsestrategy: Code[50]; riskimpactcode: Code[50]; estimatedelayimpactdays: Integer) status: Text
//     var
//         RiskManagementPlanLines: Record "Risk Management Plan Line";
//     begin


//         RiskManagementPlanLines.Init;
//         RiskManagementPlanLines."Document Type" := RiskManagementPlanLines."document type"::Project;
//         RiskManagementPlanLines."Document No" := Documentno;
//         RiskManagementPlanLines."Estimate Fin. Impact (LCY)" := estimatefinancialimpact;
//         RiskManagementPlanLines."Estimate Delay Impact (Days)" := estimatedelayimpactdays;
//         if RiskManagementPlanLines.Insert(true) then begin
//             RiskManagementPlanLines.Validate("Risk Category", riskcategory);
//             RiskManagementPlanLines."Risk Impact Type" := riskimpacttype;
//             RiskManagementPlanLines."Gen. Risk Response Strategy" := riskresponsestrategy;
//             RiskManagementPlanLines.Validate("Risk Likelihood Code", risklikelihoodcode);
//             RiskManagementPlanLines.Validate("Risk Impact Code", riskimpactcode);
//             if RiskManagementPlanLines.Modify(true) then begin

//                 status := 'success*New Risk Management Plan Line Was Successfully Created!'
//             end else begin
//                 status := 'danger*Error while Creating the Risk Management Plan Line!'
//             end;
//         end else begin
//             status := 'danger*Error while Creating the Risk Management Plan Line!'
//         end
//     end;

//     procedure fnSubmitContractorSupervisionRequirement(vendornumber: Code[20]; Documentno: Code[50]; projectid: Code[30]) status: Text
//     var
//     /// TemporarySupervision: Record "Temporary Supervision Requirem";
//     begin


//         // TemporarySupervision.Init;
//         // if TemporarySupervision.Insert(true) then begin
//         //     TemporarySupervision.Validate("Project No", projectid);
//         //     TemporarySupervision.Status := TemporarySupervision.Status::Open;
//         //     if TemporarySupervision.Modify(true) then begin

//         //         status := 'success*' + TemporarySupervision."Document No" + '*New Contractor Supervision Requirement Was Successfully Created!'
//         //     end else begin
//         //         status := 'danger*Error while Creating the Contractor Supervision Requirement!'
//         //     end;
//         // end else begin
//         //     status := 'danger*Error while Creating the Contractor Supervision Requirement!'
//         // end
//     end;

//     procedure fnSubmitTemporarySupervisionLines(vendornumber: Code[20]; Documentno: Code[50]; projectid: Code[30]; documenttype: Integer; provisiontype: Integer; jobtaskno: Code[50]; lineno: Integer; comments: Text; scheduleddeliverydate: Date; identificationno: Code[30]; reversiontype: Integer) status: Text
//     var
//     // TemporarySupervisionLine: Record "Temporary Supervision Line";
//     begin


//         // TemporarySupervisionLine.Init;
//         // TemporarySupervisionLine."Document No" := Documentno;
//         // TemporarySupervisionLine."Document Type" := documenttype;
//         // TemporarySupervisionLine."Project ID" := projectid;
//         // TemporarySupervisionLine."Task No." := jobtaskno;
//         // TemporarySupervisionLine.Validate("Plan Line No", lineno);
//         // TemporarySupervisionLine."Provision Type" := provisiontype;
//         // TemporarySupervisionLine."Reversion Type" := reversiontype;
//         // TemporarySupervisionLine.Comments := comments;
//         // TemporarySupervisionLine.No := identificationno;
//         // TemporarySupervisionLine."Scheduled Date of Delivery" := scheduleddeliverydate;
//         // if TemporarySupervisionLine.Insert(true) then begin

//         //     // IF TemporarySupervisionLine.MODIFY(TRUE) THEN BEGIN

//         //     status := 'success*New Supervision Requirement Line Was Successfully Created!'
//         //     //    END ELSE BEGIN
//         //     //      status:='danger*Error while Creating the Supervision Requirement Line!'
//         //     //  END;
//         // end else begin
//         //     status := 'danger*Error while Creating the Supervision Requirement Line!'
//         // end
//     end;

//     procedure fnSubmitSiteAgentNomination(vendornumber: Code[20]; projectid: Code[30]; staffno: Code[20]; staffname: Text; email: Text; telephoneno: Code[20]; address: Code[100]; adress2: Code[100]; city: Text) status: Text
//     var
//         WEPContractorSubmission: Record "WEP Contractor Submission";
//     begin


//         WEPContractorSubmission.Init;
//         WEPContractorSubmission."Document Type" := WEPContractorSubmission."document type"::"Site Agent Nomination";
//         if WEPContractorSubmission.Insert(true) then begin
//             WEPContractorSubmission.Validate("Project No", projectid);

//             WEPContractorSubmission."Site Agent Staff No" := staffno;
//             WEPContractorSubmission."Site Agent Name" := staffname;
//             WEPContractorSubmission."Telephone No" := telephoneno;
//             WEPContractorSubmission."E-mail" := email;
//             WEPContractorSubmission.Address := address;
//             WEPContractorSubmission."Address 2" := adress2;
//             WEPContractorSubmission.City := city;
//             WEPContractorSubmission.Status := WEPContractorSubmission.Status::Open;
//             if WEPContractorSubmission.Modify(true) then begin

//                 status := 'success*' + WEPContractorSubmission."Document No" + '*New Site Agent Nomination Was Successfully Created!'
//             end else begin
//                 status := 'danger*Error while Creating the Site Agent Nomination!'
//             end;
//         end else begin
//             status := 'danger*Error while Creating the Site Agent Nomination!'
//         end
//     end;

//     procedure fnSubmitContractorPersonnelAppointment(vendornumber: Code[20]; projectid: Code[30]) status: Text
//     var
//         WEPContractorSubmission: Record "WEP Contractor Submission";
//         WEPContractorTeam: Record "WEP Contractor Team";
//         BidKeyStaff: Record "Bid Key Staff";
//     begin


//         WEPContractorSubmission.Init;
//         WEPContractorSubmission."Document Type" := WEPContractorSubmission."document type"::"Contractor Personnel Appointment";
//         if WEPContractorSubmission.Insert(true) then begin
//             WEPContractorSubmission.Validate("Project No", projectid);
//             WEPContractorSubmission.Status := WEPContractorSubmission.Status::Open;
//             if WEPContractorSubmission.Modify(true) then begin

//                 WEPContractorSubmission.Reset;
//                 WEPContractorSubmission.SetRange("Document Type", WEPContractorSubmission."Document Type");
//                 WEPContractorSubmission.SetRange("Document No", WEPContractorSubmission."Document No");
//                 if WEPContractorSubmission.FindSet then begin

//                     //suggest team from bidresponse
//                     //TESTFIELD("IFS Code");
//                     BidKeyStaff.Reset;
//                     BidKeyStaff.SetRange(BidKeyStaff."Vendor No.", WEPContractorSubmission."Contractor No");
//                     BidKeyStaff.SetRange(BidKeyStaff."No.", WEPContractorSubmission."Bid Response No");
//                     if BidKeyStaff.FindSet then begin
//                         repeat
//                             WEPContractorTeam.Init;
//                             WEPContractorTeam."Document Type" := WEPContractorSubmission."Document Type";
//                             WEPContractorTeam."Document No" := WEPContractorSubmission."Document No";
//                             WEPContractorTeam."Contractor No." := WEPContractorSubmission."Contractor No";
//                             WEPContractorTeam."Contractor Staff No." := BidKeyStaff."Staff No.";
//                             WEPContractorTeam."Entry No." := WEPContractorTeam.Count() + 1;
//                             WEPContractorTeam.Name := BidKeyStaff."Staff Name";
//                             WEPContractorTeam."Country/Region Code" := BidKeyStaff.Nationality;
//                             WEPContractorTeam.Email := BidKeyStaff."E-Mail";
//                             WEPContractorTeam.Telephone := BidKeyStaff."Phone No.";
//                             WEPContractorTeam."Staff Category" := BidKeyStaff."Staff Category";
//                             WEPContractorTeam.Designation := BidKeyStaff.Profession;
//                             WEPContractorTeam."Role Code" := BidKeyStaff."Proposed Project Role ID";
//                             if not WEPContractorTeam.Insert(true) then
//                                 WEPContractorTeam.Modify(true);
//                         until BidKeyStaff.Next = 0;
//                     end;
//                 end;
//                 //MESSAGE('Vendor staff suggested successfully');

//                 status := 'success*' + WEPContractorSubmission."Document No" + '*' + WEPContractorSubmission."Contract ID" + '*New Contractor Personnel Appointment Was Successfully Created!'
//             end else begin
//                 status := 'danger*Error while Creating the Contractor Personnel Appointment!'
//             end;
//         end else begin
//             status := 'danger*Error while Creating the Contractor Personnel Appointment!'
//         end
//     end;

//     procedure fnSubmitContractorStaffDisengagement(vendornumber: Code[20]; projectid: Code[30]; appointmentvoucherno: Code[30]) status: Text
//     var
//         WEPContractorSubmission: Record "WEP Contractor Submission";
//     begin


//         WEPContractorSubmission.Init;
//         WEPContractorSubmission."Document Type" := WEPContractorSubmission."document type"::"Contractor Staff Disengagement";
//         WEPContractorSubmission."Project No" := projectid;
//         WEPContractorSubmission."Appointment Voucher No" := appointmentvoucherno;
//         if WEPContractorSubmission.Insert(true) then begin
//             WEPContractorSubmission.Validate("Project No");
//             WEPContractorSubmission.Status := WEPContractorSubmission.Status::Open;
//             if WEPContractorSubmission.Modify(true) then begin

//                 status := 'success*' + WEPContractorSubmission."Document No" + '*New Contractor Staff Disengagement Was Successfully Created!'
//             end else begin
//                 status := 'danger*Error while Creating the Contractor Staff Disengagement!'
//             end;
//         end else begin
//             status := 'danger*Error while Creating the Contractor Staff Disengagement!'
//         end
//     end;

//     procedure fnSubmitContractorEquipmentRegister(vendornumber: Code[20]; projectid: Code[30]) status: Text
//     var
//         WEPContractorSubmission: Record "WEP Contractor Submission";
//         PurchaseHeader: Record "Purchase Header";
//         WEPContractorEquipment: Record "WEP Contractor Equipment";
//         BidEquipmentSpecification: Record "Bid Equipment Specification";
//         StandardPurchaseCode: Record "Standard Purchase Code";
//         StandardPurchaseLine: Record "Standard Purchase Line";
//     begin


//         WEPContractorSubmission.Init;
//         WEPContractorSubmission."Document Type" := WEPContractorSubmission."document type"::"Plan of Equipment Delivery to Site";
//         if WEPContractorSubmission.Insert(true) then begin
//             WEPContractorSubmission.Validate("Project No", projectid);

//             WEPContractorSubmission.Status := WEPContractorSubmission.Status::Open;
//             if WEPContractorSubmission.Modify(true) then begin

//                 //suggest equipment from bidresponse
//                 PurchaseHeader.Reset;
//                 PurchaseHeader.SetRange(PurchaseHeader."No.", WEPContractorSubmission."Bid Response No");
//                 PurchaseHeader.SetRange(PurchaseHeader."Document Type", PurchaseHeader."document type"::Quote);
//                 if PurchaseHeader.FindSet then begin
//                     PurchaseHeader.TestField("IFS Code");
//                     StandardPurchaseCode.Reset;
//                     StandardPurchaseCode.SetRange(StandardPurchaseCode.Code, PurchaseHeader."IFS Code");
//                     StandardPurchaseCode.SetRange(StandardPurchaseCode."Project ID", WEPContractorSubmission."Project No");
//                     if StandardPurchaseCode.FindSet then begin
//                         BidEquipmentSpecification.Reset;
//                         BidEquipmentSpecification.SetRange(BidEquipmentSpecification."No.", PurchaseHeader."No.");
//                         BidEquipmentSpecification.SetRange(BidEquipmentSpecification."Document Type", BidEquipmentSpecification."document type"::Quote);
//                         if BidEquipmentSpecification.FindSet then begin
//                             repeat
//                                 WEPContractorEquipment.Init;
//                                 WEPContractorEquipment."Document Type" := WEPContractorSubmission."Document Type";
//                                 WEPContractorEquipment."Document No." := WEPContractorSubmission."Document No";
//                                 WEPContractorEquipment."Contractor No." := WEPContractorSubmission."Contractor No";
//                                 WEPContractorEquipment."Equipment No." := BidEquipmentSpecification."Equipment Type Code";
//                                 WEPContractorEquipment.Description := BidEquipmentSpecification.Description;
//                                 WEPContractorEquipment."Ownership Type" := BidEquipmentSpecification."Ownership Type";
//                                 WEPContractorEquipment."Equipment Usability Code" := BidEquipmentSpecification."Equipment Usability Code";
//                                 WEPContractorEquipment."Equipment Serial No." := BidEquipmentSpecification."Equipment Serial";
//                                 WEPContractorEquipment."Project No" := WEPContractorSubmission."Project No";
//                                 WEPContractorEquipment."Equipment Condition Code" := BidEquipmentSpecification."Equipment Condition Code";
//                                 WEPContractorEquipment."Equipment Type Code" := BidEquipmentSpecification."Equipment Type Code";
//                                 WEPContractorEquipment.Validate("Equipment Type Code");
//                                 if not WEPContractorEquipment.Insert(true) then
//                                     WEPContractorEquipment.Modify(true);
//                             until BidEquipmentSpecification.Next = 0;
//                         end;
//                     end;
//                 end;
//                 //MESSAGE('Suggested successfully');


//                 status := 'success*' + WEPContractorSubmission."Document No" + '*New Contractor Equipment Register Was Successfully Created!'
//             end else begin
//                 status := 'danger*Error while Creating the Contractor Equipment Register!'
//             end;
//         end else begin
//             status := 'danger*Error while Creating the Contractor Equipment Register!'
//         end
//     end;

//     procedure fnSubmitREsOffice(vendornumber: Code[20]; Documentno: Code[50]; projectid: Code[30]) status: Text
//     var
//     //TemporarySupervision: Record "Temporary Supervision Requirem";
//     begin


//         // TemporarySupervision.Init;
//         // TemporarySupervision."Document Type" := TemporarySupervision."document type"::Vehicle;
//         // if TemporarySupervision.Insert(true) then begin
//         //     TemporarySupervision.Validate("Project No", projectid);
//         //     TemporarySupervision.Status := TemporarySupervision.Status::Open;
//         //     if TemporarySupervision.Modify(true) then begin

//         //         status := 'success*' + TemporarySupervision."Document No" + '*New REs Office Supervision Requirement Was Successfully Created!'
//         //     end else begin
//         //         status := 'danger*Error while Creating the REs Office Supervision Requirement!'
//         //     end;
//         // end else begin
//         //     status := 'danger*Error while Creating the REs Office Supervision Requirement!'
//         // end
//     end;

//     procedure fnCreateNewExtensionofTimeRequest(vendornumber: Code[20]; projectid: Code[50]; reasoncode: Code[50]; extensionperiod: Text; costclaimamount: Decimal) status: Text
//     var
//     //  EOTRequests: Record "Project Variation Header";
//     begin

//         // EOTRequests.Init;
//         // EOTRequests."Document Type" := EOTRequests."document type"::"Extension of Time Request";
//         // EOTRequests."Document No." := '';
//         // EOTRequests."Document Date" := Today;
//         // EOTRequests."Project ID" := projectid;
//         // EOTRequests."Cost Claim Amount" := costclaimamount;
//         // EOTRequests."Extension Reason Code" := reasoncode;
//         // if Format(dur) = '' then
//         //     Evaluate(dur, extensionperiod);
//         // EOTRequests."Requested Extension Period" := dur;

//         // if EOTRequests.Insert(true) then begin
//         //     EOTRequests.Validate("Project ID");
//         //     EOTRequests.Validate("Extension Reason Code");
//         //     EOTRequests.Validate("Requested Extension Period");
//         //     EOTRequests.Modify();
//         //     status := 'success*' + EOTRequests."Document No." + '*New Extension of Time Request Was Successfully Created!'
//         // end else begin
//         //     status := 'danger*Error while Creating the  Extension of Time Request!'
//         // end;
//         // //END;
//     end;

//     procedure fngetEOTRequestProjectNumber(documentno: Code[50]) ProjectNumber: Code[100]
//     var
//     //  EOTRequests: Record "Project Variation Header";
//     begin
//         // EOTRequests.Reset;
//         // EOTRequests.SetRange("Document No.", documentno);
//         // if EOTRequests.FindLast then begin
//         //     ProjectNumber := EOTRequests."Project ID";
//         // end else begin
//         //     ProjectNumber := '';
//         // end;
//     end;

//     procedure fnSubmitEOTRevisedActivitySchedule(DocumentNo: Code[20]; vendornumber: Code[20]; projectid: Code[30]; jobtaskno: Code[20]; lineno: Integer; originalplanningdate: DateTime; extensionperiod: Text; remarks: Text) status: Text
//     var
//     // ExtensionofTimeLine: Record "Extension of Time Line";
//     begin

//         // ExtensionofTimeLine.Init;
//         // ExtensionofTimeLine."Document No." := DocumentNo;
//         // ExtensionofTimeLine."Document Type" := ExtensionofTimeLine."document type"::"Extension of Time Request";
//         // // ExtensionofTimeLine."Job Task No.":=projectid;
//         // ExtensionofTimeLine."Job Task No." := jobtaskno;
//         // ExtensionofTimeLine."Line No." := lineno;

//         // //ExtensionofTimeLine.VALIDATE("Line No.",lineno);
//         // if Format(dur) = '' then
//         //     Evaluate(dur, extensionperiod);
//         // ExtensionofTimeLine.Validate("Extension Period (Days)", dur);
//         // if ExtensionofTimeLine.Insert(true) then begin



//         //     //IF ExtensionofTimeLine.MODIFY(TRUE) THEN BEGIN
//         //     status := 'success*New Revised Schudele Activity Was Successfully Created!'
//         //     //  END ELSE BEGIN
//         //     //    status:='danger*Error while Creating the Revised Schudele Activity!'
//         //     //END;
//         // end else begin
//         //     status := 'danger*Error while Creating the Revised Schudele Activity!'
//         // end
//     end;

//     procedure fnSubmitEOTGrounds(vendornumber: Code[20]; Documentno: Code[50]; eotrequesteddays: Integer; causeofdelay: Text) status: Text
//     var
//     // EOTGrounds: Record "Extension of Time Reason";
//     begin
//         // EOTGrounds.Init;
//         // EOTGrounds."Document No." := vendornumber;
//         // EOTGrounds."Document Type" := EOTGrounds."document type"::"Extension of Time Request";
//         // EOTGrounds."Cause of Delay" := causeofdelay;
//         // EOTGrounds."EOT Requested Days" := eotrequesteddays;
//         // if EOTGrounds.Insert(true) then begin
//         //     status := 'success*New Ground for EOT Was Successfully Created!';

//         // end else begin
//         //     status := 'danger*Error while Creating the Ground for EOT!';
//         // end
//     end;

//     procedure fnSubmitEOTProjectVariationSection(vendornumber: Code[20]; Documentno: Code[50]; section: Integer; description: Text) status: Text
//     var
//     // ProjectVariationSection: Record "Project Variation Section";
//     begin
//         // ProjectVariationSection.Init;
//         // ProjectVariationSection."Document No." := Documentno;
//         // ProjectVariationSection."Document Type" := ProjectVariationSection."document type"::"Extension of Time Request";
//         // ProjectVariationSection.Section := section;
//         // ProjectVariationSection.Description := description;
//         // if ProjectVariationSection.Insert(true) then begin
//         //     status := 'success*New Project Variation Section Was Successfully Created!';

//         // end else begin
//         //     status := 'danger*Error while Creating the Project Variation Section!';
//         // end
//     end;

//     procedure fnSubmitEOTProjectVariationCommittee(vendornumber: Code[20]; Documentno: Code[50]; resourceno: Code[20]) status: Text
//     var
//     //ProjectVariationCommittee: Record "Project Variation Committee";
//     begin
//         // ProjectVariationCommittee.Init;
//         // ProjectVariationCommittee."Document No." := Documentno;
//         // if ProjectVariationCommittee.Insert(true) then begin
//         //     ProjectVariationCommittee.Validate("Resource No.", resourceno);
//         //     if ProjectVariationCommittee.Modify(true) then begin
//         //         status := 'success*New Committee Was Successfully Created!'
//         //     end else begin
//         //         status := 'danger*Error while Creating the Committee!'
//         //     end;
//         // end else begin
//         //     status := 'danger*Error while Creating the Committee!'
//         // end
//     end;

//     procedure fnSubmitContractorVariationRequestLines(DocumentNo: Code[20]; vendornumber: Code[20]; projectid: Code[30]; jobtaskno: Code[20]; lineno: Integer; newquantity: Decimal) status: Text
//     var
//     // ProjectVaiationLines: Record "Project Variation Line";
//     begin
//         // ProjectVaiationLines.Init;
//         // ProjectVaiationLines."Document No." := DocumentNo;
//         // ProjectVaiationLines."Document Type" := ProjectVaiationLines."document type"::"Contractor Variation Request";
//         // ProjectVaiationLines."Job No." := projectid;
//         // ProjectVaiationLines."Job Task No." := jobtaskno;
//         // ProjectVaiationLines.Validate("Line No.", lineno);
//         // // ProjectVaiationLines."Line No.":=lineno;
//         // ProjectVaiationLines.Validate("New Quantity", newquantity);

//         // if ProjectVaiationLines.Insert(true) then begin
//         //     //IF ExtensionofTimeLine.MODIFY(TRUE) THEN BEGIN
//         //     status := 'success*New Proposed Varied Works Line Was Successfully Created!'
//         //     //  END ELSE BEGIN
//         //     //    status:='danger*Error while Creating the Revised Schudele Activity!'
//         //     //END;
//         // end else begin
//         //     status := 'danger*Error while Creating the Proposed Varied Works Line!'
//         // end
//     end;

//     procedure fnCreateNewContractorVariationRequest(vendornumber: Code[20]; projectid: Code[50]; variationreasoncode: Code[50]; costclaimamount: Decimal) status: Text
//     var
//     // ProjectVariationHeader: Record "Project Variation Header";
//     begin
//         // ProjectVariationHeader.Init;
//         // ProjectVariationHeader."Document Type" := ProjectVariationHeader."document type"::"Contractor Variation Request";
//         // ProjectVariationHeader."Document No." := '';
//         // ProjectVariationHeader."Document Date" := Today;
//         // ProjectVariationHeader."Cost Claim Amount" := costclaimamount;
//         // ProjectVariationHeader."Project ID" := projectid;
//         // ProjectVariationHeader."Variation Reason Code" := variationreasoncode;

//         // if ProjectVariationHeader.Insert(true) then begin
//         //     ProjectVariationHeader.Validate("Project ID");
//         //     ProjectVariationHeader.Validate("Variation Reason Code");
//         //     ProjectVariationHeader.Modify();
//         //     status := 'success*' + ProjectVariationHeader."Document No." + '*New Contractor Variation Request Was Successfully Created!'
//         // end else begin
//         //     status := 'danger*Error while Creating the Contractor Variation Request!'
//         // end;
//     end;

//     procedure fnSubmitCVRProjectVariationSection(vendornumber: Code[20]; Documentno: Code[50]; section: Integer; description: Text) status: Text
//     var
//     // ProjectVariationSection: Record "Project Variation Section";
//     begin
//         // ProjectVariationSection.Init;
//         // ProjectVariationSection."Document No." := Documentno;
//         // ProjectVariationSection."Document Type" := ProjectVariationSection."document type"::"Contractor Variation Request";
//         // ProjectVariationSection.Section := section;
//         // ProjectVariationSection.Description := description;
//         // if ProjectVariationSection.Insert(true) then begin
//         //     status := 'success*New Project Variation Section Was Successfully Created!';

//         // end else begin
//         //     status := 'danger*Error while Creating the Project Variation Section!';
//         // end
//     end;

//     procedure fnCreateNewCostClaim(vendornumber: Code[20]; projectid: Code[50]; costclaimreason: Code[50]) status: Text
//     var
//     // ProjectVariationHeader: Record "Project Variation Header";
//     begin
//         // ProjectVariationHeader.Init;
//         // ProjectVariationHeader."Document Type" := ProjectVariationHeader."document type"::"Cost Claim";
//         // ProjectVariationHeader."Document No." := '';
//         // ProjectVariationHeader."Document Date" := Today;
//         // ProjectVariationHeader."Project ID" := projectid;
//         // ProjectVariationHeader."Cost Claim Reason" := costclaimreason;

//         // if ProjectVariationHeader.Insert(true) then begin
//         //     ProjectVariationHeader.Validate("Project ID");
//         //     //ProjectVariationHeader.VALIDATE("Cost Claim Reason");
//         //     ProjectVariationHeader.Modify(true);
//         //     status := 'success*' + ProjectVariationHeader."Document No." + '*New Cost Claim Request Was Successfully Created!'
//         // end else begin
//         //     status := 'danger*Error while Creating the Cost Claim Request!'
//         // end;
//     end;

//     procedure fnSubmitCostClaimLineDetails(documentNumber: Code[50]; causeofoverun: Text; costclaimrequested: Decimal; entryno: Integer) status: Text
//     var
//     // CostClaimLines: Record "Cost Claim Lines";
//     begin

//         // CostClaimLines.Reset;
//         // CostClaimLines.SetRange("Document No.", documentNumber);
//         // CostClaimLines.SetRange("Line No", entryno);
//         // if CostClaimLines.FindSet then begin
//         //     CostClaimLines."Document Type" := CostClaimLines."document type"::"Cost Claim";
//         //     CostClaimLines."Document No." := documentNumber;
//         //     CostClaimLines."Cause of Overrun" := causeofoverun;
//         //     CostClaimLines."Cost Claim Requested Amount" := costclaimrequested;

//         //     if CostClaimLines.Modify(true) then begin
//         //         status := 'success*' + CostClaimLines."Document No." + '*Cost Claim Line Details Was Successfully Modified!';
//         //     end else begin
//         //         status := 'danger*Cost Claim Line Details Was Successfully Modified!';
//         //     end;
//         // end else begin
//         //     CostClaimLines.Init;
//         //     CostClaimLines."Document Type" := CostClaimLines."document type"::"Cost Claim";
//         //     CostClaimLines."Document No." := documentNumber;
//         //     CostClaimLines."Cause of Overrun" := causeofoverun;
//         //     CostClaimLines."Cost Claim Requested Amount" := costclaimrequested;
//         //     if CostClaimLines.Insert(true) then begin
//         //         status := 'success*' + CostClaimLines."Document No." + '*Cost Claim Line Details Was Successfully Submitted!';
//         //     end else begin
//         //         status := 'danger*Cost Claim Line Was Not Submitted!';
//         //     end;
//         // end;
//     end;

//     local procedure fngetRiskRatingScaleID(ratingtype: Integer) result: Code[100]
//     var
//         RiskRatingScale: Record "Risk Rating Scale";
//     begin

//         RiskRatingScale.Reset;
//         RiskRatingScale.SetRange(RiskRatingScale."Risk Rating Scale Type", ratingtype);
//         RiskRatingScale.SetRange(RiskRatingScale.Blocked, false);
//         if RiskRatingScale.FindSet then begin
//             result := RiskRatingScale."Rating Scale ID";

//         end
//         else begin
//             result := '';
//         end;
//     end;

//     procedure fnSubmitContractorRequestforCloseout(vendornumber: Code[20]; Documentno: Code[50]; projectid: Code[30]; closeoutjustification: Text) status: Text
//     var
//     // ContractorPaymentRequestHeader: Record "Measurement &  Payment Header";
//     begin

//         // ContractorPaymentRequestHeader.Init;
//         // ContractorPaymentRequestHeader."Document Type" := ContractorPaymentRequestHeader."document type"::"Contractor Request for Taking Over";
//         // if ContractorPaymentRequestHeader.Insert(true) then begin
//         //     ContractorPaymentRequestHeader.Validate("Project ID", projectid);
//         //     ContractorPaymentRequestHeader."Close-Out Justification" := closeoutjustification;
//         //     if ContractorPaymentRequestHeader.Modify(true) then begin
//         //         // Rec:=ContractorPaymentRequestHeader;
//         //         // RMSManagement.FnSuggesTasks_PlanLinesFromJob(ContractorRequestTask,ContractorRequestPlanLine,Rec);
//         //         status := 'success*' + ContractorPaymentRequestHeader."Document No." + '*New project Close Out Request Was Successfully Created!'
//         //     end else begin
//         //         status := 'danger*Error while Creating the project Close Out Request!'
//         //     end;
//         // end else begin
//         //     status := 'danger*Error while Creating the project Close Out Request!'
//         // end
//     end;

//     procedure fnSubmitContractorRequestforDLPInspection(vendornumber: Code[20]; Documentno: Code[50]; projectid: Code[30]) status: Text
//     var
//     // ContractorPaymentRequestHeader: Record "Measurement &  Payment Header";
//     begin

//         // ContractorPaymentRequestHeader.Init;
//         // ContractorPaymentRequestHeader."Document Type" := ContractorPaymentRequestHeader."document type"::"Contractor Request for End of DLP Inspection";
//         // if ContractorPaymentRequestHeader.Insert(true) then begin
//         //     ContractorPaymentRequestHeader.Validate("Project ID", projectid);
//         //     if ContractorPaymentRequestHeader.Modify(true) then begin
//         //         status := 'success*' + ContractorPaymentRequestHeader."Document No." + '*New Request for Post DLP Inspection Was Successfully Created!'
//         //     end else begin
//         //         status := 'danger*Error while Creating Request for Post DLP Inspection!'
//         //     end;
//         // end else begin
//         //     status := 'danger*Error while Creating Request for Post DLP Inspection!'
//         // end
//     end;

//     procedure UploadContractorSignature(applicationNo: Code[20]; path: Text[250]; description: Text[250]; fileName: Text[100]; vendorno: Code[20])
//     var
//         _record: Record "Purchase Header";
//         InputFile: File;
//         InPutStream: InStream;
//         OutPutStream: OutStream;
//         filepathurl: Text;
//     begin
//         filepathurl := FilePathUploads + fileName;
//         _record.Reset;
//         _record.SetRange(_record."No.", applicationNo);
//         _record.SetRange(_record."Buy-from Vendor No.", vendorno);
//         if (_record.Find('-')) then begin
//             _record.AddLink(filepathurl, fileName);

//             if (description = 'Signature') then begin
//                 // if _record."Contractor Signature".Hasvalue then Clear(_record."Contractor Signature");

//                 // if FILE.Exists(filepathurl) then begin
//                 //     InputFile.Open(filepathurl);
//                 //     InputFile.CreateInstream(InPutStream);
//                 //     _record."Contractor Signature".CreateOutstream(OutPutStream);
//                 //     CopyStream(OutPutStream, InPutStream);
//                 //     _record.Modify;
//                 //     InputFile.Close;
//                 // end;
//             end;
//         end;




//     end;

//     procedure FnGetContractMilestones(var VarAll: BigText; vendorNo: Code[20]; contractNo: Code[20])
//     var
//         ContractMilestones: Record "Purchase Contract Milestone";
//     begin
//         Clear(VarAll);
//         ContractMilestones.Reset;
//         ContractMilestones.SetRange(ContractMilestones."No.", contractNo);
//         if ContractMilestones.Find('-') then begin
//             repeat

//             // VarAll.AddText('::::' + ContractMilestones."Milestone Code" + '* ' + ContractMilestones.Description + '* ' + Format(ContractMilestones."Entry No") + '* ' +
//             // Format(ContractMilestones."Start Date") + '* ' + Format(ContractMilestones."End Date") + '* ' + ContractMilestones."Milestone Deliverables" + '* ' + ContractMilestones."Payment Instalment Code");
//             until ContractMilestones.Next = 0;

//         end;
//     end;

//     procedure FnGetContractBidSecurity(var VarAll: BigText; vendorNo: Code[20]; contractNo: Code[20])
//     var
//         ContractBidSecurityRegister: Record "Bid_Contract Security Register";
//     begin
//         Clear(VarAll);
//         ContractBidSecurityRegister.Reset;
//         ContractBidSecurityRegister.SetRange(ContractBidSecurityRegister."No.", contractNo);
//         if ContractBidSecurityRegister.Find('-') then begin
//             repeat

//             // VarAll.AddText('::::' + ContractBidSecurityRegister."Form of Security" + '* ' + Format(ContractBidSecurityRegister."Security Type") + '* ' + ContractBidSecurityRegister.Description
//             // + '* ' + Format(ContractBidSecurityRegister."Issuer Institution Type") + '* ' + ContractBidSecurityRegister."Vendor No." + '* ' + ContractBidSecurityRegister."Issuer/Guarantor Name" + '* ' +
//             // Format(ContractBidSecurityRegister."Security Amount (LCY)") + '* ' + Format(ContractBidSecurityRegister."Bid Security Effective Date") + '* ' +
//             // Format(ContractBidSecurityRegister."Bid Security Validity Expiry") + '* ' + Format(ContractBidSecurityRegister."Guarantee Expiry Notification"));
//             until ContractBidSecurityRegister.Next = 0;

//         end;
//     end;

//     procedure FnGetContractInsurance(var VarAll: BigText; vendorNo: Code[20]; contractNo: Code[20])
//     var
//         ContractInsurance: Record "Purchase Contract Insurance";
//     begin
//         Clear(VarAll);
//         ContractInsurance.Reset;
//         ContractInsurance.SetRange(ContractInsurance."No.", contractNo);
//         if ContractInsurance.Find('-') then begin
//             repeat

//             // VarAll.AddText('::::' + ContractInsurance."Insurance Type" + '* ' + Format(ContractInsurance."Policy Cover Type") + '* ' + ContractInsurance."Policy ID" + '* ' +
//             // Format(ContractInsurance."Policy Coverage (LCY)") + '* ' + ContractInsurance."Insurance Company" + '* ' + Format(ContractInsurance."Expiry Date") + '* ' +
//             // Format(ContractInsurance."Expiry Norification Date") + '* ' + ContractInsurance.Description);
//             until ContractInsurance.Next = 0;

//         end;
//     end;

//     procedure FnGetContractSignatories(var VarAll: BigText; vendorNo: Code[20]; contractNo: Code[20])
//     var
//     // ContractSignatory: Record "Purchase Contract Signatory";
//     begin
//         Clear(VarAll);
//         // ContractSignatory.Reset;
//         // ContractSignatory.SetRange(ContractSignatory.No, contractNo);
//         // if ContractSignatory.Find('-') then begin
//         //     repeat

//         //         VarAll.AddText('::::' + Format(ContractSignatory."Entry No") + '* ' + Format(ContractSignatory."Signatory Type") + '* ' + ContractSignatory."Contract Signing Role" + '* ' +
//         //         ContractSignatory."Executed on behalf of" + '* ' + Format(ContractSignatory."Execution Date") + '* ' + ContractSignatory.Email + '* ' + ContractSignatory."Representative Name");
//         //     until ContractSignatory.Next = 0;

//         // end;
//     end;

//     procedure FnGetContractRepresentative(var VarAll: BigText; vendorNo: Code[20]; contractNo: Code[20])
//     var
//         ContractRepresentative: Record "Contract Representative";
//     begin
//         Clear(VarAll);
//         ContractRepresentative.Reset;
//         ContractRepresentative.SetRange(ContractRepresentative."No.", contractNo);
//         if ContractRepresentative.Find('-') then begin
//             repeat

//                 VarAll.AddText('::::' + Format(ContractRepresentative."Entry No") + '* ' + Format(ContractRepresentative."Designation/Title") + '* ' + ContractRepresentative."Contract Signing Role" + '* ' +
//                 ContractRepresentative."Executed on behalf of" + '* ' + ContractRepresentative.Email + '* ' + ContractRepresentative."Representative Name");
//             until ContractRepresentative.Next = 0;

//         end;
//     end;

//     procedure FnGetContractPayments(var VarAll: BigText; vendorNo: Code[20]; contractNo: Code[20])
//     var
//         ContracPayments: Record "Purchase Contract Payment Term";
//     begin
//         Clear(VarAll);
//         ContracPayments.Reset;
//         ContracPayments.SetRange(ContracPayments."No.", contractNo);
//         if ContracPayments.Find('-') then begin
//             repeat

//             // VarAll.AddText('::::' + Format(ContracPayments."Contract Sum") + '* ' + ContracPayments."Instalment Code" + '* ' + Format(ContracPayments."Payment Certificate Type") + '* ' +
//             // Format(ContracPayments.Payee) + '* ' + Format(ContracPayments."Payment %") + '* ' + ContracPayments."Currency Code" + '* ' + Format(ContracPayments."Planned Amount") + '* ' +
//             // Format(ContracPayments."Planned Amount (LCY)") + '* ' + Format(ContracPayments."Paid Amount") + '* ' + Format(ContracPayments."Gross IPC Amount(FCY)"));
//             until ContracPayments.Next = 0;

//         end;
//     end;

//     procedure UploadDocumentWorkExecutionPlan(applicationNo: Code[20]; path: Text[250]; description: Text[250]; fileName: Text[100]) status: Text
//     var
//         _record: Record "Project Mobilization Header";
//         InputFile: File;
//         InPutStream: InStream;
//         OutPutStream: OutStream;
//     begin
//         _record.Reset;
//         _record.SetRange(_record."Document No.", applicationNo);
//         if (_record.Find('-')) then begin
//             _record.AddLink(path, fileName);
//             if _record.Modify(true) then begin
//                 status := 'success*Your document uploaded successfully!';
//             end else begin
//                 status := 'danger*System Unknown Error Occured!';
//             end

//         end;
//     end;

//     procedure FnGetInsuranceofWorks(var VarAll: BigText; vendorNo: Code[20]; projectno: Code[20]; documenttype: Integer)
//     var
//     // InsuranceofWorksHeader: Record "Insurance/Guarantee Header";
//     begin
//         Clear(VarAll);
//         // InsuranceofWorksHeader.Reset;
//         // //InsuranceofWorksHeader.SETRANGE(InsuranceofWorksHeader."Project ID",projectno);
//         // InsuranceofWorksHeader.SetRange(InsuranceofWorksHeader."Contractor ID", vendorNo);
//         // InsuranceofWorksHeader.SetRange(InsuranceofWorksHeader."Document Type", documenttype);
//         // InsuranceofWorksHeader.SetRange(InsuranceofWorksHeader.Status, InsuranceofWorksHeader.Status::Open);
//         // if InsuranceofWorksHeader.Find('-') then begin
//         //     repeat

//         //         VarAll.AddText('::::' + InsuranceofWorksHeader."Insurance Type" + '* ' + Format(InsuranceofWorksHeader."Policy Cover Type") + '* ' + InsuranceofWorksHeader."Policy/Guarantee No" + '* ' +
//         //         Format(InsuranceofWorksHeader."Amount Insured/Guaranteed") + '* ' + InsuranceofWorksHeader."Insurer/Guarantor Name" + '* ' + Format(InsuranceofWorksHeader."Expiry Date") + '* ' +
//         //         Format(InsuranceofWorksHeader."Expiry Notification Date") + '* ' + InsuranceofWorksHeader.Description + '* ' + InsuranceofWorksHeader."Document No." + '* ' +
//         //         Format(InsuranceofWorksHeader."Document Date") + '* ' + InsuranceofWorksHeader."Project ID" + '* ' + InsuranceofWorksHeader."Project Name");
//         //     until InsuranceofWorksHeader.Next = 0;

//         // end;
//     end;

//     procedure FnGetInsuranceofWorksDetails(var VarAll: BigText; vendorNo: Code[20]; projectno: Code[20]; documenttype: Integer)
//     var
//     // InsuranceofWorksHeader: Record "Insurance/Guarantee Header";
//     begin
//         Clear(VarAll);
//         // InsuranceofWorksHeader.Reset;
//         // InsuranceofWorksHeader.SetRange(InsuranceofWorksHeader."Document No.", projectno);
//         // InsuranceofWorksHeader.SetRange(InsuranceofWorksHeader."Contractor ID", vendorNo);
//         // InsuranceofWorksHeader.SetRange(InsuranceofWorksHeader."Document Type", documenttype);
//         // InsuranceofWorksHeader.SetRange(InsuranceofWorksHeader.Status, InsuranceofWorksHeader.Status::Open);
//         // if InsuranceofWorksHeader.Find('-') then begin
//         //     repeat

//         //         VarAll.AddText('::::' + InsuranceofWorksHeader."Insurance Type" + '* ' + Format(InsuranceofWorksHeader."Policy Cover Type") + '* ' + InsuranceofWorksHeader."Policy/Guarantee No" + '* ' +
//         //         Format(InsuranceofWorksHeader."Amount Insured/Guaranteed") + '* ' + InsuranceofWorksHeader."Insurer/Guarantor Name" + '* ' + Format(InsuranceofWorksHeader."Expiry Date") + '* ' +
//         //         Format(InsuranceofWorksHeader."Expiry Notification Date") + '* ' + InsuranceofWorksHeader.Description + '* ' + InsuranceofWorksHeader."Document No." + '* ' +
//         //         Format(InsuranceofWorksHeader."Document Date") + '* ' + InsuranceofWorksHeader."Project ID" + '* ' + InsuranceofWorksHeader."Project Name");
//         //     until InsuranceofWorksHeader.Next = 0;

//         // end;
//     end;

//     procedure FnGetInsuranceTypes(var VarAll: BigText)
//     var
//         InsuranceTypes: Record "Insurance Type";
//     begin
//         Clear(VarAll);
//         InsuranceTypes.Reset;
//         if InsuranceTypes.Find('-') then begin
//             repeat
//                 VarAll.AddText('::::' + InsuranceTypes.Code + '* ' + InsuranceTypes.Description);
//             until InsuranceTypes.Next = 0;

//         end;
//     end;

//     procedure FnGetTenderSecurityTypes(var VarAll: BigText; securitytype: Integer)
//     var
//         TenderSecurityTypes: Record "Tender Security Types";
//     begin
//         Clear(VarAll);
//         TenderSecurityTypes.Reset;
//         TenderSecurityTypes.SetRange("Security Type", securitytype);
//         if TenderSecurityTypes.Find('-') then begin
//             repeat
//                 VarAll.AddText('::::' + TenderSecurityTypes.Code + '* ' + TenderSecurityTypes.Description);
//             until TenderSecurityTypes.Next = 0;

//         end;
//     end;

//     procedure fnSubmitProfessionalIndmnity(documentNumber: Code[50]; projectno: Code[20]; vendorno: Code[20]; issuerinstitutiontype: Integer; insurancetype: Code[50]; policycovertype: Integer; policyno: Code[50]; insurername: Text[250]; issuerregisteredoffice: Text; effectivedate: Date; expirydate: Date; amountinsurered: Decimal) status: Text
//     var
//     // InsuranceofWorksHeader: Record "Insurance/Guarantee Header";
//     begin

//         // InsuranceofWorksHeader.Reset;
//         // InsuranceofWorksHeader.SetRange("Document No.", documentNumber);
//         // if InsuranceofWorksHeader.FindSet then begin
//         //     InsuranceofWorksHeader."Document No." := documentNumber;
//         //     InsuranceofWorksHeader."Project ID" := projectno;
//         //     InsuranceofWorksHeader."Document Type" := InsuranceofWorksHeader."document type"::"Professional Indemnity";
//         //     InsuranceofWorksHeader."Contractor ID" := vendorno;
//         //     InsuranceofWorksHeader."Insurance Type" := insurancetype;
//         //     InsuranceofWorksHeader."Issuer Institution Type" := issuerinstitutiontype;
//         //     InsuranceofWorksHeader."Policy Cover Type" := policycovertype;
//         //     InsuranceofWorksHeader."Policy/Guarantee No" := policyno;
//         //     InsuranceofWorksHeader."Insurer/Guarantor Name" := insurername;
//         //     InsuranceofWorksHeader."Issuer Registered Offices" := issuerregisteredoffice;
//         //     InsuranceofWorksHeader."Effective Date" := effectivedate;
//         //     InsuranceofWorksHeader."Expiry Date" := expirydate;
//         //     InsuranceofWorksHeader."Amount Insured/Guaranteed" := amountinsurered;
//         //     if InsuranceofWorksHeader.Modify(true) then begin
//         //         InsuranceofWorksHeader.Validate("Project ID");
//         //         InsuranceofWorksHeader.Validate("Contractor ID");
//         //         InsuranceofWorksHeader.Validate("Expiry Date");
//         //         InsuranceofWorksHeader.Modify;
//         //         status := 'success*' + InsuranceofWorksHeader."Document No." + '*Insurance of Works Details Was Successfully Modified!';
//         //     end else begin
//         //         status := 'danger*Insurance of Works Details Was Successfully Modified!';
//         //     end;
//         // end else begin
//         //     InsuranceofWorksHeader.Init;
//         //     InsuranceofWorksHeader."Document No." := documentNumber;
//         //     InsuranceofWorksHeader."Project ID" := projectno;
//         //     InsuranceofWorksHeader."Document Type" := InsuranceofWorksHeader."document type"::"Professional Indemnity";
//         //     InsuranceofWorksHeader."Contractor ID" := vendorno;
//         //     InsuranceofWorksHeader."Insurance Type" := insurancetype;
//         //     InsuranceofWorksHeader."Issuer Institution Type" := issuerinstitutiontype;
//         //     InsuranceofWorksHeader."Policy Cover Type" := policycovertype;
//         //     InsuranceofWorksHeader."Policy/Guarantee No" := policyno;
//         //     InsuranceofWorksHeader."Insurer/Guarantor Name" := insurername;
//         //     InsuranceofWorksHeader."Issuer Registered Offices" := issuerregisteredoffice;
//         //     InsuranceofWorksHeader."Effective Date" := effectivedate;
//         //     InsuranceofWorksHeader."Expiry Date" := expirydate;
//         //     InsuranceofWorksHeader."Amount Insured/Guaranteed" := amountinsurered;

//         //     if InsuranceofWorksHeader.Insert(true) then begin
//         //         InsuranceofWorksHeader.Validate("Project ID");
//         //         InsuranceofWorksHeader.Validate("Contractor ID");
//         //         InsuranceofWorksHeader.Validate("Expiry Date");
//         //         InsuranceofWorksHeader.Modify;
//         //         status := 'success*' + InsuranceofWorksHeader."Document No." + '*Insurance of Works Details Was Successfully Submitted!';
//         //     end else begin
//         //         status := 'danger*Insurance of Works Details Was Not Submitted!';
//         //     end;
//         // end;
//     end;

//     procedure fnSubmitInsuranceofWorks(documentNumber: Code[50]; projectno: Code[20]; vendorno: Code[20]; issuerinstitutiontype: Integer; insurancetype: Code[50]; policycovertype: Integer; policyno: Code[50]; insurername: Text[250]; issuerregisteredoffice: Text; effectivedate: Date; expirydate: Date; amountinsurered: Decimal; issueremail: Text) status: Text
//     var
//     // InsuranceofWorksHeader: Record "Insurance/Guarantee Header";
//     begin

//         // InsuranceofWorksHeader.Reset;
//         // InsuranceofWorksHeader.SetRange("Document No.", documentNumber);
//         // if InsuranceofWorksHeader.FindSet then begin
//         //     InsuranceofWorksHeader."Document No." := documentNumber;
//         //     InsuranceofWorksHeader."Project ID" := projectno;
//         //     InsuranceofWorksHeader."Document Type" := InsuranceofWorksHeader."document type"::"Insurance Of Works";
//         //     InsuranceofWorksHeader."Contractor ID" := vendorno;
//         //     InsuranceofWorksHeader."Insurance Type" := insurancetype;
//         //     InsuranceofWorksHeader."Issuer Institution Type" := issuerinstitutiontype;
//         //     InsuranceofWorksHeader."Policy Cover Type" := policycovertype;
//         //     InsuranceofWorksHeader."Policy/Guarantee No" := policyno;
//         //     InsuranceofWorksHeader."Insurer/Guarantor Name" := insurername;
//         //     InsuranceofWorksHeader."Verified Insurer Email Address" := issueremail;
//         //     InsuranceofWorksHeader."Issuer Registered Offices" := issuerregisteredoffice;
//         //     InsuranceofWorksHeader."Effective Date" := effectivedate;
//         //     InsuranceofWorksHeader."Expiry Date" := expirydate;
//         //     InsuranceofWorksHeader."Amount Insured/Guaranteed" := amountinsurered;
//         //     if InsuranceofWorksHeader.Modify(true) then begin
//         //         InsuranceofWorksHeader.Validate("Project ID");
//         //         InsuranceofWorksHeader.Validate("Contractor ID");
//         //         InsuranceofWorksHeader.Validate("Expiry Date");
//         //         InsuranceofWorksHeader.Modify;
//         //         status := 'success*' + InsuranceofWorksHeader."Document No." + '*Insurance of Works Details Was Successfully Modified!';
//         //     end else begin
//         //         status := 'danger*Insurance of Works Details Was Successfully Modified!';
//         //     end;
//         // end else begin
//         //     InsuranceofWorksHeader.Init;
//         //     InsuranceofWorksHeader."Document No." := documentNumber;
//         //     InsuranceofWorksHeader."Project ID" := projectno;
//         //     InsuranceofWorksHeader."Document Type" := InsuranceofWorksHeader."document type"::"Insurance Of Works";
//         //     InsuranceofWorksHeader."Contractor ID" := vendorno;
//         //     InsuranceofWorksHeader."Insurance Type" := insurancetype;
//         //     InsuranceofWorksHeader."Issuer Institution Type" := issuerinstitutiontype;
//         //     InsuranceofWorksHeader."Policy Cover Type" := policycovertype;
//         //     InsuranceofWorksHeader."Policy/Guarantee No" := policyno;
//         //     InsuranceofWorksHeader."Insurer/Guarantor Name" := insurername;
//         //     InsuranceofWorksHeader."Verified Insurer Email Address" := issueremail;
//         //     InsuranceofWorksHeader."Issuer Registered Offices" := issuerregisteredoffice;
//         //     InsuranceofWorksHeader."Effective Date" := effectivedate;
//         //     InsuranceofWorksHeader."Expiry Date" := expirydate;
//         //     InsuranceofWorksHeader."Amount Insured/Guaranteed" := amountinsurered;

//         //     if InsuranceofWorksHeader.Insert(true) then begin
//         //         InsuranceofWorksHeader.Validate("Project ID");
//         //         InsuranceofWorksHeader.Validate("Contractor ID");
//         //         InsuranceofWorksHeader.Validate("Expiry Date");
//         //         InsuranceofWorksHeader.Modify;
//         //         status := 'success*' + InsuranceofWorksHeader."Document No." + '*Insurance of Works Details Was Successfully Submitted!';
//         //     end else begin
//         //         status := 'danger*Insurance of Works Details Was Not Submitted!';
//         //     end;
//         // end;
//     end;

//     procedure fnSubmitAdvancePaymentsGuarantee(documentNumber: Code[50]; projectno: Code[20]; vendorno: Code[20]; issuerinstitutiontype: Integer; formofsecurity: Code[50]; guaranteeno: Code[50]; guarantorname: Text[250]; issuerregisteredoffice: Text; effectivedate: Date; expirydate: Date; amountguaranteed: Decimal; issueremail: Text) status: Text
//     var
//     // InsuranceofWorksHeader: Record "Insurance/Guarantee Header";
//     begin

//         // InsuranceofWorksHeader.Reset;
//         // InsuranceofWorksHeader.SetRange("Document No.", documentNumber);
//         // if InsuranceofWorksHeader.FindSet then begin
//         //     InsuranceofWorksHeader."Document No." := documentNumber;
//         //     InsuranceofWorksHeader.Validate("Project ID", projectno);
//         //     InsuranceofWorksHeader."Document Type" := InsuranceofWorksHeader."document type"::"Advance Payment Guarantee";
//         //     InsuranceofWorksHeader.Validate("Contractor ID", vendorno);
//         //     InsuranceofWorksHeader."Form of Security" := formofsecurity;
//         //     InsuranceofWorksHeader."Issuer Institution Type" := issuerinstitutiontype;
//         //     InsuranceofWorksHeader."Policy/Guarantee No" := guaranteeno;
//         //     InsuranceofWorksHeader."Policy/Guarantee No" := guaranteeno;
//         //     InsuranceofWorksHeader."Verified Insurer Email Address" := issueremail;
//         //     InsuranceofWorksHeader."Insurer/Guarantor Name" := guarantorname;
//         //     InsuranceofWorksHeader."Issuer Registered Offices" := issuerregisteredoffice;
//         //     InsuranceofWorksHeader."Effective Date" := effectivedate;
//         //     InsuranceofWorksHeader.Validate("Expiry Date", expirydate);
//         //     InsuranceofWorksHeader."Amount Insured/Guaranteed" := amountguaranteed;
//         //     if InsuranceofWorksHeader.Modify(true) then begin
//         //         InsuranceofWorksHeader.Validate("Project ID");
//         //         InsuranceofWorksHeader.Validate("Contractor ID");
//         //         InsuranceofWorksHeader.Validate("Expiry Date");
//         //         InsuranceofWorksHeader.Modify;
//         //         status := 'success*' + InsuranceofWorksHeader."Document No." + '*Advance Payment Guarantee Details Was Successfully Modified!';
//         //     end else begin
//         //         status := 'danger*Advance Payment Guarantee Details Was Successfully Modified!';
//         //     end;
//         // end else begin
//         //     InsuranceofWorksHeader.Init;
//         //     InsuranceofWorksHeader."Document No." := documentNumber;
//         //     InsuranceofWorksHeader."Project ID" := projectno;
//         //     InsuranceofWorksHeader."Document Type" := InsuranceofWorksHeader."document type"::"Advance Payment Guarantee";
//         //     InsuranceofWorksHeader."Contractor ID" := vendorno;
//         //     InsuranceofWorksHeader."Form of Security" := formofsecurity;
//         //     InsuranceofWorksHeader."Issuer Institution Type" := issuerinstitutiontype;
//         //     InsuranceofWorksHeader."Policy/Guarantee No" := guaranteeno;
//         //     InsuranceofWorksHeader."Insurer/Guarantor Name" := guarantorname;
//         //     InsuranceofWorksHeader."Verified Insurer Email Address" := issueremail;
//         //     InsuranceofWorksHeader."Issuer Registered Offices" := issuerregisteredoffice;
//         //     InsuranceofWorksHeader."Effective Date" := effectivedate;
//         //     InsuranceofWorksHeader."Expiry Date" := expirydate;
//         //     InsuranceofWorksHeader."Amount Insured/Guaranteed" := amountguaranteed;
//         //     if InsuranceofWorksHeader.Insert(true) then begin
//         //         InsuranceofWorksHeader.Validate("Project ID");
//         //         InsuranceofWorksHeader.Validate("Contractor ID");
//         //         InsuranceofWorksHeader.Validate("Expiry Date");
//         //         InsuranceofWorksHeader.Modify;
//         //         status := 'success*' + InsuranceofWorksHeader."Document No." + '*Advance Payment Guarantee Details Was Successfully Submitted!';
//         //     end else begin
//         //         status := 'danger*Advance Payment Guarantee Details Was Not Submitted!';
//         //     end;
//         // end;
//     end;

//     procedure fnSubmitPerformancesGuarantee(documentNumber: Code[50]; projectno: Code[20]; vendorno: Code[20]; issuerinstitutiontype: Integer; formofsecurity: Code[50]; guaranteeno: Code[50]; guarantorname: Text[250]; issuerregisteredoffice: Text; effectivedate: Date; expirydate: Date; amountguaranteed: Decimal; issueremail: Text) status: Text
//     var
//     // InsuranceofWorksHeader: Record "Insurance/Guarantee Header";
//     begin

//         // InsuranceofWorksHeader.Reset;
//         // InsuranceofWorksHeader.SetRange("Document No.", documentNumber);
//         // if InsuranceofWorksHeader.FindSet then begin
//         //     InsuranceofWorksHeader."Document No." := documentNumber;
//         //     InsuranceofWorksHeader."Project ID" := projectno;
//         //     InsuranceofWorksHeader."Document Type" := InsuranceofWorksHeader."document type"::"Advance Payment Guarantee";
//         //     InsuranceofWorksHeader."Contractor ID" := vendorno;
//         //     InsuranceofWorksHeader."Form of Security" := formofsecurity;
//         //     InsuranceofWorksHeader."Issuer Institution Type" := issuerinstitutiontype;
//         //     InsuranceofWorksHeader."Policy/Guarantee No" := guaranteeno;
//         //     InsuranceofWorksHeader."Insurer/Guarantor Name" := guarantorname;
//         //     InsuranceofWorksHeader."Verified Insurer Email Address" := issueremail;
//         //     InsuranceofWorksHeader."Issuer Registered Offices" := issuerregisteredoffice;
//         //     InsuranceofWorksHeader."Effective Date" := effectivedate;
//         //     InsuranceofWorksHeader."Expiry Date" := expirydate;
//         //     InsuranceofWorksHeader."Amount Insured/Guaranteed" := amountguaranteed;
//         //     if InsuranceofWorksHeader.Modify(true) then begin
//         //         InsuranceofWorksHeader.Validate("Project ID");
//         //         InsuranceofWorksHeader.Validate("Contractor ID");
//         //         InsuranceofWorksHeader.Validate("Expiry Date");
//         //         InsuranceofWorksHeader.Modify;
//         //         status := 'success*' + InsuranceofWorksHeader."Document No." + '*Performance Guarantee Details Was Successfully Modified!';
//         //     end else begin
//         //         status := 'danger*Performance Guarantee Details Was Successfully Modified!';
//         //     end;
//         // end else begin
//         //     InsuranceofWorksHeader.Init;
//         //     InsuranceofWorksHeader."Document No." := documentNumber;
//         //     InsuranceofWorksHeader."Project ID" := projectno;
//         //     InsuranceofWorksHeader."Document Type" := InsuranceofWorksHeader."document type"::"Performance Guarantee";
//         //     InsuranceofWorksHeader."Contractor ID" := vendorno;
//         //     InsuranceofWorksHeader."Form of Security" := formofsecurity;
//         //     InsuranceofWorksHeader."Issuer Institution Type" := issuerinstitutiontype;
//         //     InsuranceofWorksHeader."Policy/Guarantee No" := guaranteeno;
//         //     InsuranceofWorksHeader."Insurer/Guarantor Name" := guarantorname;
//         //     InsuranceofWorksHeader."Verified Insurer Email Address" := issueremail;
//         //     InsuranceofWorksHeader."Issuer Registered Offices" := issuerregisteredoffice;
//         //     InsuranceofWorksHeader."Effective Date" := effectivedate;
//         //     InsuranceofWorksHeader."Expiry Date" := expirydate;
//         //     InsuranceofWorksHeader."Amount Insured/Guaranteed" := amountguaranteed;
//         //     if InsuranceofWorksHeader.Insert(true) then begin
//         //         InsuranceofWorksHeader.Validate("Project ID");
//         //         InsuranceofWorksHeader.Validate("Contractor ID");
//         //         InsuranceofWorksHeader.Validate("Expiry Date");
//         //         InsuranceofWorksHeader.Modify();
//         //         status := 'success*' + InsuranceofWorksHeader."Document No." + '*Performance Guarantee Details Was Successfully Submitted!';
//         //     end else begin
//         //         status := 'danger*Performance Guarantee Details Was Not Submitted!';
//         //     end;
//         // end;
//     end;

//     procedure UploadDocumentInsuranceGuaranteeHeader(applicationNo: Code[20]; path: Text[250]; description: Text[250]; fileName: Text[100]) status: Text
//     var
//         // _record: Record "Insurance/Guarantee Header";
//         InputFile: File;
//         InPutStream: InStream;
//         OutPutStream: OutStream;
//     begin
//         // _record.Reset;
//         // _record.SetRange(_record."Document No.", applicationNo);
//         // if (_record.Find('-')) then begin
//         //     _record.AddLink(path, fileName);
//         //     if _record.Modify(true) then begin
//         //         status := 'success*Your document uploaded successfully!';
//         //     end else begin
//         //         status := 'danger*System Unknown Error Occured!';
//         //     end

//         // end;
//     end;

//     procedure fnSubmitSubContractorRequestDetails(documentNumber: Code[50]; projectcode: Code[20]; vendorno: Code[20]; requestjustification: Text) status: Text
//     var
//     // SubContractingHeader: Record "Subcontracting Header";
//     begin

//         // SubContractingHeader.Reset;
//         // SubContractingHeader.SetRange("Document No", documentNumber);
//         // if SubContractingHeader.FindSet then begin
//         //     SubContractingHeader."Document No" := documentNumber;
//         //     SubContractingHeader.Validate("Project Code", projectcode);
//         //     SubContractingHeader.Validate("Main Contractor No.", vendorno);
//         //     SubContractingHeader."Request Justification" := requestjustification;

//         //     if SubContractingHeader.Modify(true) then begin
//         //         status := 'success*' + SubContractingHeader."Document No" + '*Sub Contractor Request Details Was Successfully Modified!';
//         //     end else begin
//         //         status := 'danger*Sub Contractor Request Details Was Successfully Modified!';
//         //     end;
//         // end else begin
//         //     SubContractingHeader.Init;
//         //     SubContractingHeader."Document No" := documentNumber;
//         //     SubContractingHeader.Validate("Project Code", projectcode);
//         //     SubContractingHeader.Validate("Main Contractor No.", vendorno);
//         //     SubContractingHeader."Request Justification" := requestjustification;
//         //     SubContractingHeader."Required Documents Template ID" := 'TEMP002';
//         //     if SubContractingHeader.Insert(true) then begin
//         //         Rec := SubContractingHeader;
//         //         RMSManagement.FnSuggestSubContractorRequiredDocuments(Rec);
//         //         status := 'success*' + SubContractingHeader."Document No" + '*Sub Contractor Request Details Was Successfully Submitted!';
//         //     end else begin
//         //         status := 'danger*Sub Contractor Request Details Was Not Submitted!';
//         //     end;
//         // end;
//     end;

//     procedure fnSubmitSubcontractingLineDetails(documentNumber: Code[50]; projectcode: Code[20]; vendorno: Code[20]; scopeofsubcontracting: Text; subcontractorname: Text; subtype: Integer; krapinno: Code[20]; vendorgroup: Integer; suppliertype: Integer; descriptionofworks: Text) status: Text
//     var
//     // SubContractingLine: Record "Subcontracting Line";
//     begin

//         // SubContractingLine.Reset;
//         // SubContractingLine.SetRange("Document No", documentNumber);
//         // SubContractingLine.SetRange("Tax PIN No.", krapinno);
//         // if SubContractingLine.FindSet then begin
//         //     SubContractingLine."Document No" := documentNumber;
//         //     SubContractingLine."Project Code" := projectcode;
//         //     SubContractingLine."Main Contractor No." := vendorno;
//         //     SubContractingLine.Validate("Project Code");
//         //     SubContractingLine.Validate("Main Contractor No.");
//         //     SubContractingLine."Subcontractor Name" := subcontractorname;
//         //     SubContractingLine."Description Of Works" := descriptionofworks;
//         //     SubContractingLine.Type := subtype;
//         //     SubContractingLine."Tax PIN No." := krapinno;
//         //     SubContractingLine."Vendor Group" := vendorgroup;
//         //     SubContractingLine."Supplier Type" := suppliertype;
//         //     SubContractingLine."Scope of Subcontracting" := scopeofsubcontracting;
//         //     if SubContractingLine.Modify(true) then begin
//         //         status := 'success*' + SubContractingLine."Document No" + '*Sub Contractor Request Details Was Successfully Modified!';
//         //     end else begin
//         //         status := 'danger*Sub Contractor Request Details Was Successfully Modified!';
//         //     end;
//         // end else begin
//         //     SubContractingLine.Init;
//         //     SubContractingLine."Document No" := documentNumber;
//         //     SubContractingLine."Project Code" := projectcode;
//         //     SubContractingLine."Main Contractor No." := vendorno;
//         //     SubContractingLine.Validate("Project Code");
//         //     SubContractingLine.Validate("Main Contractor No.");
//         //     SubContractingLine."Subcontractor Name" := subcontractorname;
//         //     SubContractingLine."Description Of Works" := descriptionofworks;
//         //     SubContractingLine.Type := subtype;
//         //     SubContractingLine."Tax PIN No." := krapinno;
//         //     SubContractingLine."Vendor Group" := vendorgroup;
//         //     SubContractingLine."Supplier Type" := suppliertype;
//         //     SubContractingLine."Scope of Subcontracting" := scopeofsubcontracting;
//         //     if SubContractingLine.Insert(true) then begin
//         //         status := 'success*' + SubContractingLine."Document No" + '*Subcontracting Details Was Successfully Submitted!';
//         //     end else begin
//         //         status := 'danger*Subcontracting Was Not Submitted!';
//         //     end;
//         // end;
//     end;

//     procedure FnGetSubcontractingRequiredDoc(var VarAll: BigText; documentno: Code[20])
//     var
//     // SubcontractingRequiredDocs: Record "Subcontracting Required Doc";
//     begin
//         Clear(VarAll);
//         // SubcontractingRequiredDocs.Reset;
//         // SubcontractingRequiredDocs.SetRange(SubcontractingRequiredDocs."Document No.", documentno);
//         // if SubcontractingRequiredDocs.Find('-') then begin
//         //     repeat
//         //         VarAll.AddText('::::' + SubcontractingRequiredDocs."Document Type" + '* ' + SubcontractingRequiredDocs.Description + '* ' +
//         //        SubcontractingRequiredDocs."Guidelines/Instructions" + '* ' + Format(SubcontractingRequiredDocs."Due Date"));
//         //     until SubcontractingRequiredDocs.Next = 0;

//         // end;
//     end;

//     procedure UploadDocumentSubcontractor(applicationNo: Code[20]; path: Text[250]; description: Text[250]; fileName: Text[100]) status: Text
//     var
//         // _record: Record "Subcontracting Header";
//         InputFile: File;
//         InPutStream: InStream;
//         OutPutStream: OutStream;
//     begin
//         // _record.Reset;
//         // _record.SetRange(_record."Document No", applicationNo);
//         // if (_record.Find('-')) then begin
//         //     _record.AddLink(path, fileName);
//         //     if _record.Modify(true) then begin
//         //         status := 'success*Your document uploaded successfully!';
//         //     end else begin
//         //         status := 'danger*System Unknown Error Occured!';
//         //     end

//         // end;
//     end;

//     procedure FnGetFinalAccountTemplateID(var VarAll: BigText)
//     var
//     // ProjectChecklistTemplate: Record "Project Checklist  Template";
//     begin
//         Clear(VarAll);
//         // ProjectChecklistTemplate.Reset;
//         // ProjectChecklistTemplate.SetRange("Project Stage", ProjectChecklistTemplate."project stage"::"Final Account");
//         // if ProjectChecklistTemplate.Find('-') then begin
//         //     repeat
//         //         VarAll.AddText('::::' + ProjectChecklistTemplate."Template ID" + '* ' + ProjectChecklistTemplate.Description);
//         //     until ProjectChecklistTemplate.Next = 0;

//         // end;
//     end;

//     procedure fnSubmitFinalAccount(vendornumber: Code[20]; projectid: Code[30]; templateid: Code[20]) status: Text
//     var
//     // FinalAccount: Record "Final Account";
//     // FinalAccountLines: Record "Project Material Template Line";
//     // ContractorRequestTask: Record "Contractor Request Task";
//     begin

//         // FinalAccount.Init;
//         // FinalAccount."Document Date" := Today;
//         // if FinalAccount.Insert(true) then begin
//         //     FinalAccount.Validate("Project ID", projectid);
//         //     FinalAccount.Validate("Contractor No", vendornumber);
//         //     FinalAccount.Validate("Template ID", templateid);
//         //     if FinalAccount.Modify(true) then begin
//         //         status := 'success*' + FinalAccount."Document No" + '*Final Account Request Was Successfully Created!'
//         //     end else begin
//         //         status := 'danger*Error while Creating the Final Account!'
//         //     end;
//         // end else begin
//         //     status := 'danger*Error while Creating the Final Account!'
//         // end
//     end;

//     procedure fnSubmitFinalAccountLineDetails(documentno: Code[20]; projectno: Code[30]; lineno: Integer; responsestatus: Integer; comments: Text) Status: Text
//     var
//     // FinalAccountLine: Record "Final Account Line";
//     begin
//         // FinalAccountLine.Reset;
//         // FinalAccountLine.SetRange("Document No", documentno);
//         // FinalAccountLine.SetRange("Line No", lineno);
//         // if FinalAccountLine.FindSet then begin
//         //     FinalAccountLine."Response Type" := responsestatus;

//         //     if comments <> ' ' then
//         //         FinalAccountLine.Comments := comments;

//         //     if FinalAccountLine.Modify then
//         //         Status := 'success*Final Account Line Entry Details updated successfully!'
//         //     else
//         //         Status := 'danger*Error while updating..!'
//         // end
//         // else begin
//         //     Status := 'danger*Error while Creating the Final Account Line Entry!'
//         // end
//     end;

//     procedure FnGetExpiryStatusInsurance(vendorNo: Code[20]) status: Text
//     var
//         // InsuranceOfWorks: Record "Insurance/Guarantee Header";
//         daysremaining: Integer;
//     begin
//         // InsuranceOfWorks.Reset;
//         // InsuranceOfWorks.SetRange("Contractor ID", vendorNo);
//         // InsuranceOfWorks.SetRange("Document Type", InsuranceOfWorks."document type"::"Insurance Of Works");
//         // InsuranceOfWorks.SetRange(Expired, false);
//         // if InsuranceOfWorks.Find('-') then begin

//         //     daysremaining := InsuranceOfWorks."Expiry Date" - Today;
//         //     //IF (daysremaining <= 90) THEN BEGIN
//         //     status := Format(daysremaining) + '*' + InsuranceOfWorks."Project ID" + ' ' + InsuranceOfWorks."Project Name";

//         // end;
//     end;

//     procedure FnGetExpiryStatusAdvanceGuarantee(vendorNo: Code[20]) status: Text
//     var
//         // InsuranceOfWorks: Record "Insurance/Guarantee Header";
//         daysremaining: Integer;
//     begin
//         // InsuranceOfWorks.Reset;
//         // InsuranceOfWorks.SetRange("Contractor ID", vendorNo);
//         // InsuranceOfWorks.SetRange("Document Type", InsuranceOfWorks."document type"::"Advance Payment Guarantee");
//         // InsuranceOfWorks.SetRange(Expired, false);
//         // if InsuranceOfWorks.Find('-') then begin
//         //     daysremaining := InsuranceOfWorks."Expiry Date" - Today;
//         //     //IF (daysremaining <= 90) THEN BEGIN
//         //     status := Format(daysremaining) + '*' + InsuranceOfWorks."Project ID" + ' ' + InsuranceOfWorks."Project Name";


//         // end;
//     end;

//     procedure fnSubmitWorkPlan(vendornumber: Code[20]; projectid: Code[30]; documenttype: Integer) status: Text
//     var
//     // WorkPlanHeader: Record "Work Plan Header";
//     //  WorkPlanLine: Record "Work Plan Line";
//     // PlanningWorkPlanLine: Record "Planning Work Plan Line";
//     begin

//         // WorkPlanHeader.Init;
//         // WorkPlanHeader."Document Date" := Today;
//         // WorkPlanHeader."Document Type" := documenttype;
//         // WorkPlanHeader."Project ID" := projectid;
//         // WorkPlanHeader."Contractor No." := vendornumber;
//         // WorkPlanHeader."Portal Status" := WorkPlanHeader."portal status"::Draft;
//         // if WorkPlanHeader.Insert(true) then begin
//         //     WorkPlanHeader.Validate("Project ID");
//         //     WorkPlanHeader.Validate("Contractor No.");
//         //     if WorkPlanHeader.Modify(true) then begin

//         //         status := 'success*' + WorkPlanHeader."Document No." + '*Work Plan Was Successfully Created!'
//         //     end else begin
//         //         status := 'danger*Error while Creating the Work Plan!'
//         //     end;
//         // end else begin
//         //     status := 'danger*Error while Creating the Work Plan!'
//         // end
//     end;

//     procedure fnSubmitWorkPlanLine(documentNumber: Code[50]; vendorno: Code[20]; documentntype: Integer; activitycode: Code[50]; entryno: Integer; startdate: Date; enddate: Date) status: Text
//     var
//     // WorkPlanHeader: Record "Work Plan Header";
//     // //  WorkPlanLine: Record "Work Plan Line";
//     // PlanningWorkPlanLine: Record "Planning Work Plan Line";
//     begin
//         // WorkPlanLine.Reset;
//         // WorkPlanLine.SetRange("Line No.", entryno);
//         // if WorkPlanLine.FindSet then begin
//         //     WorkPlanLine."Document No." := documentNumber;
//         //     WorkPlanLine."Activity Code" := activitycode;
//         //     WorkPlanLine."Document Type" := documentntype;
//         //     WorkPlanLine."Start Date" := startdate;
//         //     WorkPlanLine."End Date" := enddate;
//         //     if WorkPlanLine.Modify(true) then begin
//         //         WorkPlanLine.Validate("Activity Code");
//         //         status := 'success*' + WorkPlanLine."Document No." + '*Work Plan Line Details Was Successfully Modified!';
//         //     end else begin
//         //         status := 'danger*Work Plan Line Details Was Successfully Modified!';
//         //     end;
//         // end else begin
//         //     WorkPlanLine.Init;
//         //     WorkPlanLine.Reset;
//         //     WorkPlanLine."Document No." := documentNumber;
//         //     WorkPlanLine."Document Type" := documentntype;
//         //     WorkPlanLine."Activity Code" := activitycode;
//         //     WorkPlanLine."Start Date" := startdate;
//         //     WorkPlanLine."End Date" := enddate;
//         //     if WorkPlanLine.Insert(true) then begin
//         //         //  WorkPlanLine.Validate("Activity Code");
//         //         if WorkPlanLine.Modify(true) then
//         //             status := 'success*' + WorkPlanLine."Document No." + '*Work Plan Line Details Was Successfully Modified!';
//         //     end else begin
//         //         status := 'danger*Work Plan Line Details Was Successfully Modified!';


//         //     end;
//     end;


//     /*WorkPlanLine.INIT;
//        WorkPlanLine.RESET;
//        WorkPlanLine."Document No.":=documentNumber;
//        WorkPlanLine."Document Type":=documentntype;
//       IF WorkPlanLine.INSERT(TRUE) THEN BEGIN
//         WorkPlanLine.VALIDATE("Activity Code",activitycode);
//         IF WorkPlanLine.MODIFY(TRUE) THEN
//         status:='success*'+WorkPlanLine."Document No."+'*Work Plan Line Details Was Successfully Modified!';
//       END ELSE BEGIN
//         status:='danger*Work Plan Line Details Was Successfully Modified!';


//     END;
//     */

//     // end;

//     procedure fnSubmitPlanningWorkPlanLine(documentNumber: Code[50]; vendorno: Code[20]; documentntype: Integer; activitycode: Code[50]; entryno: Integer; totaldonetodate: Decimal; workstartchainage: Decimal; workendchainage: Decimal; projectid: Code[20]; unitofmeasure: Code[20]; formarnid: Code[20]; lineno: Integer) status: Text
//     var
//     // WorkPlanHeader: Record "Work Plan Header";
//     // //WorkPlanLine: Record "Work Plan Line";
//     // PlanningWorkPlanLine: Record "Planning Work Plan Line";
//     begin
//         // PlanningWorkPlanLine.Reset;
//         // PlanningWorkPlanLine.SetRange("Entry No", entryno);
//         // if PlanningWorkPlanLine.FindSet then begin
//         //     PlanningWorkPlanLine."Document No." := documentNumber;
//         //     PlanningWorkPlanLine."Activity Code" := activitycode;
//         //     PlanningWorkPlanLine."Document Type" := documentntype;
//         //     PlanningWorkPlanLine."Line No." := lineno;
//         //     PlanningWorkPlanLine."Project ID" := projectid;
//         //     PlanningWorkPlanLine."Total Done Todate" := totaldonetodate;
//         //     PlanningWorkPlanLine."Works Start Chainage(KM)" := workstartchainage;
//         //     PlanningWorkPlanLine."Works End Chanage(KM)" := workendchainage;
//         //     PlanningWorkPlanLine."Unit Of Measure" := unitofmeasure;
//         //     PlanningWorkPlanLine."Foreman ID" := formarnid;

//         //     if PlanningWorkPlanLine.Modify(true) then begin
//         //         PlanningWorkPlanLine.Validate("Activity Code");
//         //         PlanningWorkPlanLine.Validate("Foreman ID");
//         //         status := 'success*' + PlanningWorkPlanLine."Document No." + '*Planning Work Plan Line Details Was Successfully Modified!';
//         //     end else begin
//         //         status := 'danger*Planning Work Plan Line Details Was Successfully Modified!';
//         //     end;
//         // end else begin
//         //     PlanningWorkPlanLine.Init;
//         //     PlanningWorkPlanLine.Reset;
//         //     PlanningWorkPlanLine."Document No." := documentNumber;
//         //     PlanningWorkPlanLine."Activity Code" := activitycode;
//         //     PlanningWorkPlanLine."Document Type" := documentntype;
//         //     PlanningWorkPlanLine."Line No." := lineno;
//         //     PlanningWorkPlanLine."Project ID" := projectid;
//         //     PlanningWorkPlanLine."Total Done Todate" := totaldonetodate;
//         //     PlanningWorkPlanLine."Works Start Chainage(KM)" := workstartchainage;
//         //     PlanningWorkPlanLine."Works End Chanage(KM)" := workendchainage;
//         //     PlanningWorkPlanLine."Unit Of Measure" := unitofmeasure;
//         //     PlanningWorkPlanLine."Foreman ID" := formarnid;

//         //     if PlanningWorkPlanLine.Insert(true) then begin
//         //         PlanningWorkPlanLine.Validate("Activity Code");
//         //         PlanningWorkPlanLine.Validate("Foreman ID");
//         //         status := 'success*' + PlanningWorkPlanLine."Document No." + '*Planning Work Plan Line Details Was Successfully Modified!';
//         //     end else begin
//         //         status := 'danger*Planning Work Plan Line Details Was Successfully Modified!';


//         //     end;
//         // end;
//     end;

//     procedure fnSubmitContractorInspectionRequest(documentNumber: Code[50]; vendorno: Code[20]; projectid: Code[50]; requireslabtest: Integer; workplanno: Code[20]; requiressurveychecks: Integer) status: Text
//     var
//     // ContractorInspectionRequest: Record "Contractor Inspection Request";
//     begin
//         // ContractorInspectionRequest.Reset;
//         // ContractorInspectionRequest.SetRange("Document No.", documentNumber);
//         // if ContractorInspectionRequest.FindSet then begin
//         //     ContractorInspectionRequest."Document No." := documentNumber;
//         //     ContractorInspectionRequest.Validate("Project ID", projectid);
//         //     ContractorInspectionRequest."Daily/Weekly/Monthly W/Plan No" := workplanno;
//         //     ContractorInspectionRequest.Validate("Daily/Weekly/Monthly W/Plan No");
//         //     if requireslabtest = 1 then
//         //         ContractorInspectionRequest."Requires Lab Test" := true;
//         //     if requiressurveychecks = 1 then
//         //         ContractorInspectionRequest."Requires Survey" := true;

//         //     if ContractorInspectionRequest.Modify(true) then begin
//         //         ContractorInspectionRequest.Validate("Daily/Weekly/Monthly W/Plan No");
//         //         status := 'success*' + ContractorInspectionRequest."Document No." + '*Work Plan Line Details Was Successfully Modified!';
//         //     end else begin
//         //         status := 'danger*Work Plan Line Details Was Successfully Modified!';
//         //     end;
//         // end else begin
//         //     ContractorInspectionRequest.Init;
//         //     ContractorInspectionRequest.Reset;
//         //     ContractorInspectionRequest."Document No." := documentNumber;
//         //     ContractorInspectionRequest.Validate("Project ID", projectid);
//         //     ContractorInspectionRequest."Daily/Weekly/Monthly W/Plan No" := workplanno;
//         //     ContractorInspectionRequest.Validate("Daily/Weekly/Monthly W/Plan No");
//         //     if requireslabtest = 1 then
//         //         ContractorInspectionRequest."Requires Lab Test" := true;
//         //     if requiressurveychecks = 1 then
//         //         ContractorInspectionRequest."Requires Survey" := true;

//         //     if ContractorInspectionRequest.Insert(true) then begin
//         //         ContractorInspectionRequest.Validate("Daily/Weekly/Monthly W/Plan No");
//         //         status := 'success*' + ContractorInspectionRequest."Document No." + '*Work Plan Line Details Was Successfully Modified!';
//         //     end else begin
//         //         status := 'danger*Work Plan Line Details Was Successfully Modified!';


//         //     end;
//         // end;
//     end;

//     procedure fnSubmitContractorInspectionActivities(workstartchainage: Decimal; workendchainage: Decimal; testsrequired: Text; entryno: Integer) status: Text
//     var
//     // TestRequestLine: Record "Test Request Line";
//     begin
//         // TestRequestLine.Reset;
//         // TestRequestLine.SetRange("Entry No", entryno);
//         // if TestRequestLine.FindSet then begin
//         //     TestRequestLine."Works Start Chainage(KM)" := workstartchainage;
//         //     TestRequestLine."Works End Chanage(KM)" := workendchainage;
//         //     TestRequestLine."Tests Required" := testsrequired;
//         //     if TestRequestLine.Modify(true) then begin
//         //         status := 'success*' + TestRequestLine."Document No." + '*Test Request Line Details Was Successfully Modified!';
//         //     end else begin
//         //         status := 'danger*Test Request Line Details Was Successfully Modified!';
//         //     end;
//         // end;
//     end;

//     procedure fnSubmitTestMaterialRecord(documentNumber: Code[50]; vendorno: Code[20]; projectid: Code[50]) status: Text
//     var
//     // MaterialTestRecord: Record "Material Test Record";
//     begin
//         /*   MaterialTestRecord.RESET;
//           MaterialTestRecord.SETRANGE(Code,documentNumber);
//           IF MaterialTestRecord.FINDSET THEN BEGIN
//              MaterialTestRecord."Document Type":= MaterialTestRecord."Document Type"::"Material Test Record";
//              MaterialTestRecord.Code:=documentNumber;
//             MaterialTestRecord."Contractor No.":=vendorno;
//             MaterialTestRecord."Project ID":=projectid;


//          IF MaterialTestRecord.MODIFY(TRUE) THEN BEGIN
//            MaterialTestRecord.VALIDATE("Project ID");
//            status:='success*'+MaterialTestRecord.Code+'*Material Test Record Details Was Successfully Modified!';
//          END ELSE BEGIN
//            status:='danger*Material Test Record Details Was Successfully Modified!';
//        END;
//        END ELSE BEGIN
//        */
//         // MaterialTestRecord.Init;
//         // MaterialTestRecord.Reset;
//         // MaterialTestRecord."Project ID" := projectid;
//         // MaterialTestRecord."Contractor No." := vendorno;
//         // MaterialTestRecord."Document Type" := MaterialTestRecord."document type"::"Material Test Certificate";

//         // if MaterialTestRecord.Insert(true) then begin
//         //     MaterialTestRecord.Validate("Project ID");
//         //     MaterialTestRecord.Modify;
//         //     status := 'success*' + MaterialTestRecord.Code + '*Material Test Record Details Was Successfully Modified!';
//         // end else begin
//         //     status := 'danger*Material Test Record Details Was Successfully Modified!';


//         // end;
//         //END;

//     end;

//     procedure fnSubmitMaterialTestLine(documentNumber: Code[50]; vendorno: Code[20]; projectid: Code[20]; materialid: Code[20]; materialdeliverydate: Date; testingdate: Date; manufacturer: Text; entryno: Integer; quantity: Decimal) status: Text
//     var
//     // MaterialTestRecordLine: Record "Material Test Record Line";
//     begin

//         // MaterialTestRecordLine.Reset;
//         // MaterialTestRecordLine.SetRange("Line No.", entryno);
//         // if MaterialTestRecordLine.FindSet then begin
//         //     MaterialTestRecordLine.Code := documentNumber;
//         //     MaterialTestRecordLine."Project ID" := projectid;
//         //     MaterialTestRecordLine."Material ID" := materialid;
//         //     MaterialTestRecordLine."Material Delivery Date" := materialdeliverydate;
//         //     MaterialTestRecordLine."Testing Date" := testingdate;
//         //     MaterialTestRecordLine.Manufacturer := manufacturer;
//         //     MaterialTestRecordLine.Quantity := quantity;

//         //     if MaterialTestRecordLine.Modify(true) then begin
//         //         MaterialTestRecordLine.Validate("Project ID");
//         //         MaterialTestRecordLine.Validate("Material ID");
//         //         //MaterialTestRecordLine.VALIDATE("Purchase Contract ID");
//         //         status := 'success*' + MaterialTestRecordLine.Code + '*Planning Work Plan Line Details Was Successfully Modified!';
//         //     end else begin
//         //         status := 'danger*Planning Work Plan Line Details Was Successfully Modified!';
//         //     end;
//         // end else begin
//         //     MaterialTestRecordLine.Init;
//         //     MaterialTestRecordLine.Reset;
//         //     MaterialTestRecordLine.Code := documentNumber;
//         //     MaterialTestRecordLine."Project ID" := projectid;
//         //     MaterialTestRecordLine."Material ID" := materialid;
//         //     MaterialTestRecordLine."Material Delivery Date" := materialdeliverydate;
//         //     MaterialTestRecordLine."Testing Date" := testingdate;
//         //     MaterialTestRecordLine.Manufacturer := manufacturer;
//         //     MaterialTestRecordLine.Quantity := quantity;

//         //     if MaterialTestRecordLine.Insert(true) then begin
//         //         MaterialTestRecordLine.Validate("Project ID");
//         //         MaterialTestRecordLine.Validate("Material ID");
//         //         // MaterialTestRecordLine.VALIDATE("Purchase Contract ID");
//         //         MaterialTestRecordLine.Modify;
//         //         status := 'success*' + MaterialTestRecordLine.Code + '*Planning Work Plan Line Details Was Successfully Modified!';
//         //     end else begin
//         //         status := 'danger*Planning Work Plan Line Details Was Successfully Modified!';


//         //     end;
//         // end;
//     end;

//     procedure FnGetMaterialTestTemplate(var VarAll: BigText)
//     var
//     // ProjectMaterialTemplate: Record "Project Material Template Head";
//     begin
//         Clear(VarAll);
//         // ProjectMaterialTemplate.Reset;
//         // ProjectMaterialTemplate.SetRange(Blocked, false);
//         // if ProjectMaterialTemplate.Find('-') then begin
//         //     repeat
//         //         VarAll.AddText('::::' + ProjectMaterialTemplate."Template ID" + '* ' + ProjectMaterialTemplate.Description + '* ' + ProjectMaterialTemplate."Project Type");
//         //     until ProjectMaterialTemplate.Next = 0;

//         // end;
//     end;

//     procedure FnGetWorkPlanNo(var VarAll: BigText; vendorno: Code[20]; projectid: Code[20])
//     var
//     // WorkPlanHeader: Record "Work Plan Header";
//     begin
//         Clear(VarAll);
//         // WorkPlanHeader.Reset;
//         // WorkPlanHeader.SetRange("Contractor No.", vendorno);
//         // WorkPlanHeader.SetRange("Project ID", projectid);
//         // if WorkPlanHeader.Find('-') then begin
//         //     repeat
//         //         VarAll.AddText('::::' + WorkPlanHeader."Document No." + '* ' + Format(WorkPlanHeader."Document Type") + '* ' + WorkPlanHeader."Project ID");
//         //     until WorkPlanHeader.Next = 0;

//         // end;
//     end;

//     procedure UploadDocumentMaterialTestRecord(applicationNo: Code[20]; path: Text[250]; description: Text[250]; fileName: Text[100]) status: Text
//     var
//         // _record: Record "Material Test Record";
//         InputFile: File;
//         InPutStream: InStream;
//         OutPutStream: OutStream;
//     begin
//         // _record.Reset;
//         // _record.SetRange(_record.Code, applicationNo);
//         // if (_record.Find('-')) then begin
//         //     _record.AddLink(path, fileName);
//         //     if _record.Modify(true) then begin
//         //         status := 'success*Your document uploaded successfully!';
//         //     end else begin
//         //         status := 'danger*System Unknown Error Occured!';
//         //     end

//         // end;
//     end;

//     procedure UploadDocumentWorkPlan(applicationNo: Code[20]; path: Text[250]; description: Text[250]; fileName: Text[100]) status: Text
//     var
//         // _record: Record "Work Plan Header";
//         InputFile: File;
//         InPutStream: InStream;
//         OutPutStream: OutStream;
//     begin
//         // _record.Reset;
//         // _record.SetRange(_record."Document No.", applicationNo);
//         // if (_record.Find('-')) then begin
//         //     _record.AddLink(path, fileName);
//         //     if _record.Modify(true) then begin
//         //         status := 'success*Your document uploaded successfully!';
//         //     end else begin
//         //         status := 'danger*System Unknown Error Occured!';
//         //     end

//         // end;
//     end;

//     procedure UploadDocumentTestRquest(applicationNo: Code[20]; path: Text[250]; description: Text[250]; fileName: Text[100]) status: Text
//     var
//         // _record: Record "Contractor Inspection Request";
//         InputFile: File;
//         InPutStream: InStream;
//         OutPutStream: OutStream;
//     begin
//         // _record.Reset;
//         // _record.SetRange(_record."Document No.", applicationNo);
//         // if (_record.Find('-')) then begin
//         //     _record.AddLink(path, fileName);
//         //     if _record.Modify(true) then begin
//         //         status := 'success*Your document uploaded successfully!';
//         //     end else begin
//         //         status := 'danger*System Unknown Error Occured!';
//         //     end

//         // end;
//     end;

//     procedure UploadDocumentSiteAgent(applicationNo: Code[20]; path: Text[250]; description: Text[250]; fileName: Text[100]) status: Text
//     var
//         _record: Record "WEP Contractor Submission";
//         InputFile: File;
//         InPutStream: InStream;
//         OutPutStream: OutStream;
//     begin
//         _record.Reset;
//         _record.SetRange(_record."Document No", applicationNo);
//         if (_record.Find('-')) then begin
//             _record.AddLink(path, fileName);
//             if _record.Modify(true) then begin
//                 status := 'success*Your document uploaded successfully!';
//             end else begin
//                 status := 'danger*System Unknown Error Occured!';
//             end

//         end;
//     end;

//     procedure UploadDocumentPaymentRequest(applicationNo: Code[20]; path: Text[250]; description: Text[250]; fileName: Text[100]) status: Text
//     var
//         // _record: Record "Measurement &  Payment Header";
//         InputFile: File;
//         InPutStream: InStream;
//         OutPutStream: OutStream;
//     begin
//         // _record.Reset;
//         // _record.SetRange(_record."Document No.", applicationNo);
//         // if (_record.Find('-')) then begin
//         //     _record.AddLink(path, fileName);
//         //     if _record.Modify(true) then begin
//         //         status := 'success*Your document uploaded successfully!';
//         //     end else begin
//         //         status := 'danger*System Unknown Error Occured!';
//         //     end

//         // end;
//     end;

//     procedure UploadDocumentEOT(applicationNo: Code[20]; path: Text[250]; description: Text[250]; fileName: Text[100]) status: Text
//     var
//         // _record: Record "Project Variation Header";
//         InputFile: File;
//         InPutStream: InStream;
//         OutPutStream: OutStream;
//     begin
//         // _record.Reset;
//         // _record.SetRange(_record."Document No.", applicationNo);
//         // if (_record.Find('-')) then begin
//         //     _record.AddLink(path, fileName);
//         //     if _record.Modify(true) then begin
//         //         status := 'success*Your document uploaded successfully!';
//         //     end else begin
//         //         status := 'danger*System Unknown Error Occured!';
//         //     end

//         // end;
//     end;

//     procedure UploadDocumentFinalAccount(applicationNo: Code[20]; path: Text[250]; description: Text[250]; fileName: Text[100]) status: Text
//     var
//         // _record: Record "Final Account";
//         InputFile: File;
//         InPutStream: InStream;
//         OutPutStream: OutStream;
//     begin
//         // _record.Reset;
//         // _record.SetRange(_record."Document No", applicationNo);
//         // if (_record.Find('-')) then begin
//         //     _record.AddLink(path, fileName);
//         //     if _record.Modify(true) then begin
//         //         status := 'success*Your document uploaded successfully!';
//         //     end else begin
//         //         status := 'danger*System Unknown Error Occured!';
//         //     end

//         // end;
//     end;

//     procedure UploadDocumentReportSubmission(applicationNo: Code[20]; path: Text[250]; description: Text[250]; fileName: Text[100]) status: Text
//     var
//         //  _record: Record "Report Submission Header";
//         InputFile: File;
//         InPutStream: InStream;
//         OutPutStream: OutStream;
//     begin
//         // _record.Reset;
//         // _record.SetRange(_record."Document No.", applicationNo);
//         // if (_record.Find('-')) then begin
//         //     _record.AddLink(path, fileName);
//         //     if _record.Modify(true) then begin
//         //         status := 'success*Your document uploaded successfully!';
//         //     end else begin
//         //         status := 'danger*System Unknown Error Occured!';
//         //     end

//     end;
//     //   end;

//     procedure fnDeleteInspectionActivity(documentno: Code[20]; vendorNo: Code[30]; entryno: Integer) deleteStatus: Text
//     var
//     // TestRequestLine: Record "Test Request Line";
//     begin
//         // TestRequestLine.Reset;
//         // TestRequestLine.SetRange("Document No.", documentno);
//         // TestRequestLine.SetRange("Contractor No.", vendorNo);
//         // TestRequestLine.SetRange("Entry No", entryno);
//         // if TestRequestLine.FindSet then begin
//         //     if TestRequestLine.Delete then
//         //         deleteStatus := 'success*Test Request Activity entry Removed successfully!'
//         //     else
//         //         deleteStatus := 'danger*Error while deleting..!'
//         // end
//         // else begin
//         //     Error('entry not found!');
//         // end
//     end;

//     procedure fnSubmitWorkplanMaterialsonSite(vendornumber: Code[20]; Documentno: Code[50]; materialid: Code[20]; activityno: Code[50]; quantity: Decimal; lineno: Integer; documenttype: Integer; approved: Integer) status: Text
//     var
//     // WorkPlanMaterial: Record "Workplan Material on Site";
//     begin

//         // WorkPlanMaterial.Init;
//         // WorkPlanMaterial."Document No" := Documentno;
//         // WorkPlanMaterial."Document Type" := documenttype;
//         // WorkPlanMaterial."Material Code" := materialid;
//         // WorkPlanMaterial."Activity No" := activityno;
//         // WorkPlanMaterial."Line No" := lineno;
//         // WorkPlanMaterial.Quantity := quantity;
//         // WorkPlanMaterial."Approved?" := approved;
//         // if WorkPlanMaterial.Insert(true) then begin
//         //     WorkPlanMaterial.Validate("Material Code");
//         //     status := 'success*New Material On Site Was Successfully Created!'

//         // end else begin
//         //     status := 'danger*Error while Creating the Material On Site!'
//         // end
//     end;

//     procedure fnSubmitWorkPlanEquipment(vendornumber: Code[20]; Documentno: Code[50]; projectid: Code[30]; equipmentno: Code[20]; activityno: Code[50]; lineno: Integer; documenttype: Integer; quantity: Decimal) status: Text
//     var
//     // WorkPlanEquipment: Record "Workplan Plant and Machinery";
//     begin

//         // WorkPlanEquipment.Init;
//         // WorkPlanEquipment."Document Type" := documenttype;
//         // WorkPlanEquipment."Document No" := Documentno;
//         // WorkPlanEquipment."Equipment No" := equipmentno;
//         // WorkPlanEquipment."Activity No" := activityno;
//         // WorkPlanEquipment."Line No" := lineno;
//         // if WorkPlanEquipment.Insert(true) then begin
//         //     WorkPlanEquipment.Validate("Equipment No");
//         //     status := 'success*New Equipment  Was Successfully Created!'

//         // end else begin
//         //     status := 'danger*Error while Creating the Key Team!'
//         // end
//     end;

//     procedure GenerateTemplate(filename: Text; Project_ID: Text; Document_No: Text)
//     var
//         "**mscorlib**": Integer;
//     // sb: dotnet StringBuilder;
//     // stream: dotnet StreamWriter;
//     // str: dotnet Stream;
//     // ascii: dotnet Encoder;
//     // "**System**": Integer;
//     // uriObj: dotnet Uri;
//     // lgRequest: dotnet HttpWebRequest;
//     // lgResponse: dotnet HttpWebResponse;
//     // reader: dotnet XmlTextReader;
//     // document: dotnet XmlDocument;
//     // credentials: dotnet CredentialCache;
//     begin


//         // sb := sb.StringBuilder();
//         // sb.Append('<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:tem="http://tempuri.org/">');
//         // sb.Append('<soapenv:Header/>');
//         // sb.Append('<soapenv:Body>');
//         // sb.Append('<tem:GenerateCert>');
//         // sb.Append('<tem:filename>' + filename + '</tem:filename>');
//         // sb.Append('<tem:Project_ID>' + Project_ID + '</tem:Project_ID>');
//         // sb.Append('<tem:Document_No>' + Document_No + '</tem:Document_No>');
//         // sb.Append('</tem:GenerateCert>');
//         // sb.Append('</soapenv:Body>');
//         // sb.Append('</soapenv:Envelope>');

//         // uriObj := uriObj.Uri('http://192.168.1.87:7048/JudiciaryExcel.asmx');
//         // lgRequest := lgRequest.CreateDefault(uriObj);
//         // lgRequest.Method := 'POST';
//         // lgRequest.ContentType := 'text/xml';
//         // lgRequest.Headers.Add('SOAPAction', 'http://tempuri.org/GenerateCert');
//         // lgRequest.Credentials := credentials.DefaultCredentials;
//         // lgRequest.Timeout := 120000;
//         // stream := stream.StreamWriter(lgRequest.GetRequestStream());
//         // stream.Write(sb.ToString());
//         // stream.Close();
//         //lgResponse := lgRequest.GetResponse();
//     end;

//     procedure GenerateTemplateNew(filename: Text; Project_ID: Text; Document_No: Text; mainContractor: Text; contractsum: Decimal; period: Integer; ipcnumber: Integer; settedamount: Decimal; projectstartdate: Date)
//     var
//         "**mscorlib**": Integer;
//         // sb: dotnet StringBuilder;
//         // stream: dotnet StreamWriter;
//         // str: dotnet Stream;
//         // ascii: dotnet Encoder;
//         // "**System**": Integer;
//         // uriObj: dotnet Uri;
//         // lgRequest: dotnet HttpWebRequest;
//         // lgResponse: dotnet HttpWebResponse;
//         // reader: dotnet XmlTextReader;
//         // document: dotnet XmlDocument;
//         // credentials: dotnet CredentialCache;
//         sbStr: Text;
//     begin
//         //CALCFIELDS("Settled Amount");
//         // sb := sb.StringBuilder();
//         // sb.Append('<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:tem="http://tempuri.org/">');
//         // sb.Append('<soapenv:Header/>');
//         // sb.Append('<soapenv:Body>');
//         // sb.Append('<tem:GenerateCert>');
//         // sb.Append('<tem:filename>' + filename + '</tem:filename>');
//         // sb.Append('<tem:Project_ID>' + Project_ID + '</tem:Project_ID>');
//         // sb.Append('<tem:Document_No>' + Document_No + '</tem:Document_No>');
//         // sb.Append('<tem:mainContractor>' + mainContractor + '</tem:mainContractor>');
//         // sb.Append('<tem:contractVal>' + Format(contractsum) + '</tem:contractVal>');
//         // sb.Append('<tem:contractNo>' + Document_No + '</tem:contractNo>');
//         // sb.Append('<tem:certNo>' + Format(ipcnumber) + '</tem:certNo>');
//         // sb.Append('<tem:date>' + Format(projectstartdate) + '</tem:date>');
//         // sb.Append('<tem:prev>' + Format(settedamount) + '</tem:prev>');
//         // sb.Append('</tem:GenerateCert>');
//         // sb.Append('</soapenv:Body>');
//         // sb.Append('</soapenv:Envelope>');
//         // sbStr := DelChr(sb.ToString(), '=', '&');


//         // uriObj := uriObj.Uri('http://192.168.1.87:7048/JudiciaryExcel.asmx');
//         // lgRequest := lgRequest.CreateDefault(uriObj);
//         // lgRequest.Method := 'POST';
//         // lgRequest.ContentType := 'text/xml';
//         // lgRequest.Headers.Add('SOAPAction', 'http://tempuri.org/GenerateCert');
//         // lgRequest.Credentials := credentials.DefaultCredentials;
//         // lgRequest.Timeout := 120000;
//         // stream := stream.StreamWriter(lgRequest.GetRequestStream());
//         // stream.Write(sbStr);
//         // stream.Close();
//         // lgResponse := lgRequest.GetResponse();
//     end;

//     procedure ImportTemplate_(filename: Text; Project_ID: Text; Document_No: Text)
//     var
//         "**mscorlib**": Integer;
//     // sb: dotnet StringBuilder;
//     // stream: dotnet StreamWriter;
//     // str: dotnet Stream;
//     // ascii: dotnet Encoder;
//     // "**System**": Integer;
//     // uriObj: dotnet Uri;
//     // lgRequest: dotnet HttpWebRequest;
//     // lgResponse: dotnet HttpWebResponse;
//     // reader: dotnet XmlTextReader;
//     // document: dotnet XmlDocument;
//     // credentials: dotnet CredentialCache;
//     begin
//         // sb := sb.StringBuilder();
//         // sb.Append('<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:tem="http://tempuri.org/">');
//         // sb.Append('<soapenv:Header/>');
//         // sb.Append('<soapenv:Body>');
//         // sb.Append('<tem:ReadDoc>');
//         // sb.Append('<tem:filename>' + filename + '</tem:filename>');
//         // sb.Append('<tem:Project_ID>' + Project_ID + '</tem:Project_ID>');
//         // sb.Append('<tem:Document_No>' + Document_No + '</tem:Document_No>');
//         // sb.Append('</tem:ReadDoc>');
//         // sb.Append('</soapenv:Body>');
//         // sb.Append('</soapenv:Envelope>');

//         // uriObj := uriObj.Uri('http://192.168.1.87:7048/JudiciaryExcel.asmx');
//         // lgRequest := lgRequest.CreateDefault(uriObj);
//         // lgRequest.Method := 'POST';
//         // lgRequest.ContentType := 'text/xml';
//         // lgRequest.Headers.Add('SOAPAction', 'http://tempuri.org/ReadDoc');
//         // lgRequest.Credentials := credentials.DefaultCredentials;
//         // lgRequest.Timeout := 120000;
//         // stream := stream.StreamWriter(lgRequest.GetRequestStream());
//         // stream.Write(sb.ToString());
//         // stream.Close();
//         // lgResponse := lgRequest.GetResponse();
//     end;

//     procedure FnGeneratePreviousIPC(VendorNumber: Code[20]; documentno: Code[20]; projectid: Code[20]; projectname: Text) status: Text
//     var
//         // ContractorRequestTask: Record "Contractor Request Task";
//         Name: Text;
//         ReturnValue: Boolean;
//         TempFile: File;
//         ToFile: Variant;
//         NewStream: InStream;
//         FilePath: label 'C:\QuickPay\ExcelTemplates\TempFiles\';
//         Filepath2: label 'C:\inetpub\wwwroot\Judiciaryrms\Downloads\';
//         contractperiod: Integer;
//         // ContractorRequestPlanLine: Record "Contractor Request Plan Line";
//         // MeasurementsPaymentsHeader: Record "Measurement &  Payment Header";
//         maincontractor: Text;
//         contractsum: Decimal;
//         ipcnumber: Integer;
//         settedamount: Decimal;
//         projectstartdate: Date;
//     begin

//         // ContractorRequestTask.Reset;
//         // ContractorRequestTask.SetRange(ContractorRequestTask."Job No.", projectid);
//         // ContractorRequestTask.SetRange(ContractorRequestTask."Document No.", documentno);
//         // if not ContractorRequestTask.Find('-') then
//         //     Error('No Bill Categories added');

//         // ContractorRequestPlanLine.Reset;
//         // ContractorRequestPlanLine.SetRange(ContractorRequestPlanLine."Job No.", projectid);
//         // ContractorRequestPlanLine.SetRange(ContractorRequestPlanLine."Document No.", documentno);
//         // if not ContractorRequestPlanLine.Find('-') then
//         //     Error('No Bill Items added');

//         // MeasurementsPaymentsHeader.Reset;
//         // MeasurementsPaymentsHeader.SetRange(MeasurementsPaymentsHeader."Project ID", projectid);
//         // if MeasurementsPaymentsHeader.Find('-') then
//         //     contractperiod := MeasurementsPaymentsHeader."Project End Date" - MeasurementsPaymentsHeader."Project Start Date";
//         // maincontractor := MeasurementsPaymentsHeader."Contractor Name";
//         // contractsum := MeasurementsPaymentsHeader."Contract Sum";
//         // ipcnumber := MeasurementsPaymentsHeader."IPC Number";
//         // settedamount := MeasurementsPaymentsHeader."Settled Amount";
//         // projectstartdate := MeasurementsPaymentsHeader."Project Start Date";

//         // GenerateTemplateNew(ContractorRequestTask."Document No." + '_' + projectname, projectid, documentno, maincontractor, contractsum, contractperiod, ipcnumber, settedamount, projectstartdate);
//         // //GenerateTemplate(ContractorRequestTask."Document No."+'_'+projectname, projectid, documentno);


//         // //TempFile.OPEN(FilePath+ContractorRequestTask."Document No."+'_'+projectname+'.xlsx');
//         // // TempFile.Open(FilePath + ContractorRequestTask."Document No." + '.xlsx');
//         // // TempFile.CreateInstream(NewStream);

//         // //ToFile:=ContractorRequestTask."Document No."+'_'+projectname+'.xlsx';
//         // ToFile := ContractorRequestTask."Document No." + '.xlsx';

//         // ReturnValue := DownloadFromStream(
//         //   NewStream,
//         //   'Save File to RoleTailored Client',
//         //   '',
//         //   'Excel Files (*.xlsx;*.xls)|*.xlsx;*.xls',
//         //   ToFile);

//         // //TempFile.Close();
//     end;

//     procedure ImportIPCDocument(applicationNo: Code[20]; path: Text[250]; description: Text[250]; fileName: Text[100]; vendorno: Code[20]; projectid: Code[50]; projectname: Text) status: Text
//     var
//         // ContractorRequestTask: Record "Contractor Request Task";
//         InputFile: File;
//         InPutStream: InStream;
//         OutPutStream: OutStream;
//         RecordIDNumber: RecordID;
//     // MeasurementPaymentHeader: Record "Measurement &  Payment Header";
//     begin
//         /*ContractorRequestTask.RESET;
//         ContractorRequestTask.SETRANGE(ContractorRequestTask."Document No.",applicationNo);
//         IF(ContractorRequestTask.FIND('-'))THEN BEGIN
//          // ContractorRequestTask.ADDLINK(path,fileName);

//           RecordIDNumber:=ContractorRequestTask.RECORDID;
//         UploadCPRExportedForImport(DMSDocuments."Document Type"::"Maintenance Requisition",applicationNo,'Contractor Payment Request',RecordIDNumber,ContractorRequestTask."Region ID",path,fileName);

//          // ImportTemplate_(fileName,projectid,applicationNo);
//          ContractorRequestTask.import
//           IF ContractorRequestTask.MODIFY(TRUE) THEN BEGIN
//             status:='success*Your document uploaded successfully!';
//           END ELSE BEGIN
//             status:='danger*System Unknown Error Occured!';
//           END

//         END;*/

//         // MeasurementPaymentHeader.Reset;
//         // MeasurementPaymentHeader.SetRange("Document No.", applicationNo);
//         // if MeasurementPaymentHeader.FindFirst() then begin
//         //     RecordIDNumber := MeasurementPaymentHeader.RecordId;
//         //     UploadCPRExportedForImport(DMSDocuments."document type"::"Maintenance Requisition", applicationNo, 'Contractor Payment Request', RecordIDNumber, ContractorRequestTask."Region ID", path, fileName);
//         //     MeasurementPaymentHeader.Import := true;
//         //     MeasurementPaymentHeader.Modify();
//         // end;

//     end;

//     procedure UploadCPRExportedForImport(DocumentType: Option; DocNo: Code[50]; DocDesc: Text; TabID: RecordID; region: Code[100]; filepath: Text; fname: Text): Boolean
//     var
//         DocType: Record "DMS Documents";
//         // DocLines: Record "DMS Document Lines";
//         FileName: Text[250];
//         //  xmlWriter: dotnet XmlTextWriter;
//         // EncodingText: dotnet Encoding;
//         Docname: Text;
//         Filer: Codeunit "File Management";
//         FileName2: Text;
//         DocLink: Record "Record Link";
//         FileDesc: Text;
//         FileWriter: OutStream;
//         File1: File;
//         XmlFileName: Text;
//         CashManagementSetup: Record "Cash Management Setup";
//     begin
//         CashManagementSetup.Get;
//         if CashManagementSetup.Find('-') then begin
//             //Uploade File to folder
//             Docname := DocNo;
//             Docname := ConvertStr(Docname, ':', '_');
//             Docname := ConvertStr(Docname, ':', '_');
//             // FileName:=Filer.OpenFileDialog('Select Document To Upload','Select Document To Upload','PDF Files (*.PDF)|*.PDF|All files (*.*)|*.*');
//             FileName := fname;
//             FileName2 := filepath;
//             FileDesc := Filer.GetFileName(FileName);
//             // Filer.CopyClientFile(FileName,FileName2,TRUE);
//             // Filer.MoveFile(FileName2,'C:\QuickPay\ExcelTemplates\TempFilesImport\'+FileDesc);
//             // CopyClientFile(FileName,'X:\'+FileName2,TRUE);
//             //Insert Link
//             DocLink.Init;
//             DocLink."Link ID" := 0;
//             DocLink.URL1 := CashManagementSetup."SharePoint Site Link" + '/' + CashManagementSetup."SharePoint Site Main Library" + '/' + CashManagementSetup."SharePoint Document Library" + '/' + region + '/' + CashManagementSetup."Imprest Surrender DMS Link" + '/'
//             + Docname + '/' + FileDesc;
//             DocLink.Description := FileDesc;
//             DocLink.Type := DocLink.Type::Link;
//             DocLink.Company := COMPANYNAME;
//             //  DocLink."Base URL" := '/' + CashManagementSetup."SharePoint Site Main Library" + '/' + CashManagementSetup."SharePoint Document Library" + '/' + region + '/' + CashManagementSetup."Imprest Surrender DMS Link";
//             //  DocLink."Document No" := DocNo;
//             // DocLink.LocalUrl := FileName2;
//             DocLink."User ID" := UserId;
//             //  DocLink."Fetch To Sharepoint" := true;
//             //  DocLink."Uploaded To SharePoint" := false;
//             //  DocLink."SP URL Returned" := '';
//             DocLink.Created := CreateDatetime(Today, Time);
//             DocLink."Record ID" := TabID;
//             DocLink.Insert(true);

//             //Create Xml Document
//             /* CashManagementSetup.RESET;
//              CashManagementSetup.GET;
//                IF DocLines.FIND('-') THEN BEGIN
//                  XmlFileName:='C:\QuickPay\ExcelTemplates\TempFilesImport\'+FileDesc+'.xml';
//                  FileName :='C:\QuickPay\ExcelTemplates\TempFilesImport'+FileDesc+'.xml';
//                  //FileName :=Docname+'.xml';
//                   IF ISNULL(xmlWriter) THEN
//                  xmlWriter := xmlWriter.XmlTextWriter(XmlFileName, EncodingText.UTF8);
//                  xmlWriter.WriteStartDocument();
//                  //Create Parent element
//                  xmlWriter.WriteStartElement('Columns');
//                  xmlWriter.WriteStartElement('Params');
//                  xmlWriter.WriteElementString('Library',CashManagementSetup."SharePoint Site Main Library");
//                  xmlWriter.WriteElementString('Region',region);
//                  xmlWriter.WriteElementString('Folder',CashManagementSetup."SharePoint Document Library"+'/'+region+'/'+CashManagementSetup."Staff Claims DMS Link"+'/'+Docname);
//                  xmlWriter.WriteEndElement();
//                  xmlWriter.WriteStartElement('Files');
//                  xmlWriter.WriteElementString('Filename',FileDesc);
//                  xmlWriter.WriteEndElement();
//                   //Region Metadata
//                  xmlWriter.WriteStartElement('Column');
//                  // REPEAT
//                  //Create Child elements
//                  xmlWriter.WriteElementString('Title','Region');
//                  xmlWriter.WriteElementString('Value',region);
//                  //End writing top element and XML document
//                  xmlWriter.WriteEndElement();
//                 //Constituency Metadata
//                  xmlWriter.WriteStartElement('Column');
//                  xmlWriter.WriteElementString('Title','Constituency');
//                  xmlWriter.WriteElementString('Value','');
//                  xmlWriter.WriteEndElement();
//                  //Employee Metadata
//                  xmlWriter.WriteStartElement('Column');
//                  xmlWriter.WriteElementString('Title','Employee');
//                  xmlWriter.WriteElementString('Value',USERID);
//                  xmlWriter.WriteEndElement();
//                  xmlWriter.WriteEndDocument();
//                  xmlWriter.Close();
//                  END;*/
//             // Filer.CopyClientFile(FileName,'X:\'+Docname+'.xml',TRUE);
//             //   Filer.MoveFiles(FileName2,'C:\QuickPay\ExcelTemplates\TempFilesImport\'+FileDesc+'.xml');
//         end;


//         Message('Documents Uploaded Successffully');


//     end;

//     procedure FnGetMaximumAdvanceAmount(contractid: Code[50]) amount: Decimal
//     var
//         PurchaseHeader: Record "Purchase Header";
//     // PurchaseContractSignatory: Record "Purchase Contract Signatory";
//     begin
//         PurchaseHeader.Reset;
//         PurchaseHeader.SetRange(PurchaseHeader."No.", contractid);
//         if PurchaseHeader.FindSet then begin

//         end;
//         // PurchaseContractSignatory.Reset;
//         // PurchaseContractSignatory.SetRange(PurchaseContractSignatory.No, contractid);
//         // if PurchaseContractSignatory.FindSet then begin

//         //     amount := (PurchaseHeader."Advance Payment Rate" / 100) * (PurchaseHeader."Award Tender Sum Inc Taxes");
//         // end;
//     end;

//     procedure fnSubmitEquipmentRepair(documentNumber: Code[50]; vendorno: Code[20]; projectid: Code[50]) status: Text
//     var
//     // EquipmentRepair: Record "Equipment Repair Tracking";
//     begin
//         // EquipmentRepair.Reset;
//         // EquipmentRepair.SetRange("Document No", documentNumber);
//         // if EquipmentRepair.FindSet then begin
//         //     EquipmentRepair."Document No" := documentNumber;
//         //     EquipmentRepair."Document Type" := EquipmentRepair."document type"::"Repair and Maintainance";
//         //     EquipmentRepair."Contractor No" := vendorno;
//         //     EquipmentRepair."Project No" := projectid;


//         //     if EquipmentRepair.Modify(true) then begin
//         //         EquipmentRepair.Validate("Project No");
//         //         status := 'success*' + EquipmentRepair."Document No" + '*Equipment Repair Tracking Details Was Successfully Modified!';
//         //     end else begin
//         //         status := 'danger*Equipment Repair Tracking Details Was Successfully Modified!';
//         //     end;
//         // end else begin
//         //     EquipmentRepair.Init;
//         //     EquipmentRepair.Reset;
//         //     EquipmentRepair."Project No" := projectid;
//         //     EquipmentRepair."Contractor No" := vendorno;
//         //     EquipmentRepair."Document Type" := EquipmentRepair."document type"::"Repair and Maintainance";

//         //     if EquipmentRepair.Insert(true) then begin
//         //         EquipmentRepair.Validate("Project No");
//         //         EquipmentRepair.Modify;
//         //         status := 'success*' + EquipmentRepair."Document No" + '*Equipment Repair Tracking Details Was Successfully Modified!';
//         //     end else begin
//         //         status := 'danger*Equipment Repair Tracking Details Was Successfully Modified!';


//         //     end;
//         // end;
//     end;

//     procedure fnSubmitEquipmentRepairLine(documentNumber: Code[50]; vendorno: Code[20]; equipmentno: Code[50]; maintenancedate: Date; returndate: Date; additionalremarks: Text; entryno: Integer) status: Text
//     var
//     // EquipmentRepairLine: Record "Equipment Repair Line";
//     begin

//         // EquipmentRepairLine.Reset;
//         // EquipmentRepairLine.SetRange("Line No.", entryno);
//         // EquipmentRepairLine.SetRange("Document No.", documentNumber);
//         // if EquipmentRepairLine.FindSet then begin
//         //     // EquipmentRepairLine."Document No.":=documentNumber;
//         //     //  EquipmentRepairLine."Document Type":=EquipmentRepairLine."Document Type"::"Repair and Maintainance";
//         //     //  EquipmentRepairLine."Equipment No.":=equipmentno;
//         //     // EquipmentRepairLine."Maintenance Start Date":=maintenancedate;
//         //     EquipmentRepairLine."Expected Return Date" := returndate;
//         //     EquipmentRepairLine."Additional Remarks" := additionalremarks;

//         //     if EquipmentRepairLine.Modify(true) then begin
//         //         //EquipmentRepairLine.VALIDATE("Equipment No.");
//         //         status := 'success*' + EquipmentRepairLine."Document No." + '*Equipment Repair Line Details Was Successfully Modified!';
//         //     end else begin
//         //         status := 'danger*Equipment Repair Line Details could not be Modified!';
//         //     end;
//         // end else begin
//         //     EquipmentRepairLine.Init;
//         //     EquipmentRepairLine.Reset;
//         //     EquipmentRepairLine."Document No." := documentNumber;
//         //     EquipmentRepairLine."Document Type" := EquipmentRepairLine."document type"::"Repair and Maintainance";
//         //     EquipmentRepairLine."Equipment No." := equipmentno;
//         //     EquipmentRepairLine."Maintenance Start Date" := maintenancedate;
//         //     EquipmentRepairLine."Expected Return Date" := returndate;
//         //     EquipmentRepairLine."Additional Remarks" := additionalremarks;

//         //     if EquipmentRepairLine.Insert(true) then begin
//         //         EquipmentRepairLine.Validate("Equipment No.");
//         //         EquipmentRepairLine.Modify;
//         //         status := 'success*' + EquipmentRepairLine."Document No." + '*Equipment Repair Line Details Was Successfully Modified!';
//         //     end else begin
//         //         status := 'danger*Equipment Repair Line Details Was Successfully Modified!';


//         //     end;
//         // end;
//     end;

//     procedure FnGetLoginType(vendorNo: Code[20]; authenticationemail: Text) status: Text
//     var
//         PortalUser: Record "Dynasoft Portal User";
//     begin
//         PortalUser.Reset;
//         PortalUser.SetRange("Record ID", vendorNo);
//         PortalUser.SetRange("Authentication Email", authenticationemail);
//         if PortalUser.Find('-') then begin
//             // status := Format(PortalUser."Login Type");
//         end;
//     end;

//     procedure FnGetReportSubmissions(var VarAll: BigText; vendorNo: Code[20]; projectno: Code[20]; documenttype: Integer)
//     var
//     // ReportSubmissionHeader: Record "Report Submission Header";
//     begin
//         Clear(VarAll);
//         // ReportSubmissionHeader.Reset;
//         // ReportSubmissionHeader.SetRange(ReportSubmissionHeader."Consultant No.", vendorNo);
//         // ReportSubmissionHeader.SetRange(ReportSubmissionHeader.Status, ReportSubmissionHeader.Status::Open);
//         // if ReportSubmissionHeader.Find('-') then begin
//         //     repeat

//         //         VarAll.AddText('::::' + ReportSubmissionHeader."Document No." + '* ' + Format(ReportSubmissionHeader."Report Type") + '* ' +
//         //         Format(ReportSubmissionHeader."Contract Sum") + '* ' + Format(ReportSubmissionHeader."Study/Survey Type") + '* ' +
//         //         Format(ReportSubmissionHeader.Status) + '* ' + ReportSubmissionHeader."Committee No." + '* ' + ReportSubmissionHeader."Purchase Contract ID" + '* ' +
//         //         Format(ReportSubmissionHeader."Document Date") + '* ' + ReportSubmissionHeader."Project ID" + '* ' + ReportSubmissionHeader."Project Name");
//         //     until ReportSubmissionHeader.Next = 0;

//         // end;
//     end;

//     procedure FnGetReportSubmissionsDetails(var VarAll: BigText; vendorNo: Code[20]; documentno: Code[20])
//     var
//     //  ReportSubmissionHeader: Record "Report Submission Header";
//     begin
//         Clear(VarAll);
//         // ReportSubmissionHeader.Reset;
//         // ReportSubmissionHeader.SetRange(ReportSubmissionHeader."Consultant No.", vendorNo);
//         // ReportSubmissionHeader.SetRange(ReportSubmissionHeader."Document No.", documentno);
//         // if ReportSubmissionHeader.Find('-') then begin
//         //     repeat

//         //         VarAll.AddText('::::' + ReportSubmissionHeader."Document No." + '* ' + Format(ReportSubmissionHeader."Report Type") + '* ' +
//         //         Format(ReportSubmissionHeader."Contract Sum") + '* ' + Format(ReportSubmissionHeader."Study/Survey Type") + '* ' +
//         //         Format(ReportSubmissionHeader.Status) + '* ' + ReportSubmissionHeader."Committee No." + '* ' + ReportSubmissionHeader."Purchase Contract ID" + '* ' +
//         //         Format(ReportSubmissionHeader."Document Date") + '* ' + ReportSubmissionHeader."Project ID" + '* ' + ReportSubmissionHeader."Project Name");
//         //     until ReportSubmissionHeader.Next = 0;

//         // end;
//     end;

//     procedure fnSubmitReportSubmissions(documentNumber: Code[50]; vendorno: Code[20]; projectid: Code[50]; reporttype: Code[50]) status: Text
//     var
//     //  ReportSubmissionHeader: Record "Report Submission Header";
//     begin
//         // ReportSubmissionHeader.Reset;
//         // ReportSubmissionHeader.SetRange("Document No.", documentNumber);
//         // if ReportSubmissionHeader.FindSet then begin
//         //     ReportSubmissionHeader."Document No." := documentNumber;
//         //     ReportSubmissionHeader."Report Type" := reporttype;
//         //     ReportSubmissionHeader."Consultant No." := vendorno;
//         //     ReportSubmissionHeader."Project ID" := projectid;


//         //     if ReportSubmissionHeader.Modify(true) then begin
//         //         ReportSubmissionHeader.Validate("Project ID");
//         //         ReportSubmissionHeader.Validate("Consultant No.");
//         //         status := 'success*' + ReportSubmissionHeader."Document No." + '*Report Submission Details Was Successfully Modified!';
//         //     end else begin
//         //         status := 'danger*Report Submission Details Was Successfully Modified!';
//         //     end;
//         // end else begin
//         //     ReportSubmissionHeader.Init;
//         //     ReportSubmissionHeader.Reset;
//         //     ReportSubmissionHeader."Project ID" := projectid;
//         //     ReportSubmissionHeader."Report Type" := reporttype;
//         //     ReportSubmissionHeader."Consultant No." := vendorno;


//         //     if ReportSubmissionHeader.Insert(true) then begin
//         //         ReportSubmissionHeader.Validate("Project ID");
//         //         ReportSubmissionHeader.Validate("Consultant No.");
//         //         ReportSubmissionHeader.Modify;
//         //         status := 'success*' + ReportSubmissionHeader."Document No." + '*Report Submission Details Was Successfully Modified!';
//         //     end else begin
//         //         status := 'danger*Report Submission Details Was Successfully Modified!';


//         //     end;
//         //  end;
//     end;

//     procedure FnGetReportTypes(var VarAll: BigText; projecttype: Integer)
//     var
//     // ReportTypes: Record "Studies/Surveys&Design Report";
//     begin
//         Clear(VarAll);
//         // ReportTypes.Reset;
//         // ReportTypes.SetRange(ReportTypes."Project Type", projecttype);
//         // if ReportTypes.Find('-') then begin
//         //     repeat
//         //         VarAll.AddText('::::' + ReportTypes."Report Type" + '* ' + ReportTypes.Description);
//         //     until ReportTypes.Next = 0;

//         // end;
//     end;

//     procedure FnGetCostClaimLines(var VarAll: BigText; vendorNo: Code[20]; documentno: Code[20]; documenttype: Integer)
//     var
//     // CostClaimLines: Record "Cost Claim Lines";
//     begin
//         Clear(VarAll);
//         // CostClaimLines.Reset;
//         // CostClaimLines.SetRange(CostClaimLines."Document No.", documentno);
//         // if CostClaimLines.Find('-') then begin
//         //     repeat

//         //         VarAll.AddText('::::' + CostClaimLines."Document No." + '* ' + Format(CostClaimLines."Document Type") + '* ' +
//         //         Format(CostClaimLines."Line No") + '* ' + CostClaimLines."Cause of Overrun" + '* ' +
//         //         Format(CostClaimLines."Cost Claim Requested Amount") + '* ' + Format(CostClaimLines."Cost Claim Approved Amount") + '* ' + Format(CostClaimLines.Status));
//         //     until CostClaimLines.Next = 0;

//         // end;
//     end;

//     procedure FnGetQualityManagementPlans(var VarAll: BigText; vendorNo: Code[20]; projectno: Code[20]; documenttype: Integer)
//     var
//     // ReportSubmissionHeader: Record "Report Submission Header";
//     begin
//         Clear(VarAll);
//         // ReportSubmissionHeader.Reset;
//         // ReportSubmissionHeader.SetRange(ReportSubmissionHeader."Consultant No.", vendorNo);
//         // ReportSubmissionHeader.SetRange(ReportSubmissionHeader.Status, ReportSubmissionHeader.Status::Open);
//         // if ReportSubmissionHeader.Find('-') then begin
//         //     repeat

//         //         VarAll.AddText('::::' + ReportSubmissionHeader."Document No." + '* ' + Format(ReportSubmissionHeader."Report Type") + '* ' +
//         //         Format(ReportSubmissionHeader."Contract Sum") + '* ' + Format(ReportSubmissionHeader."Study/Survey Type") + '* ' +
//         //         Format(ReportSubmissionHeader.Status) + '* ' + ReportSubmissionHeader."Committee No." + '* ' + ReportSubmissionHeader."Purchase Contract ID" + '* ' +
//         //         Format(ReportSubmissionHeader."Document Date") + '* ' + ReportSubmissionHeader."Project ID" + '* ' + ReportSubmissionHeader."Project Name");
//         //     until ReportSubmissionHeader.Next = 0;

//         // end;
//     end;

//     procedure fnSubmitQualityManagementPlan(documentNumber: Code[50]; vendorno: Code[20]; projectid: Code[50]) status: Text
//     var
//     // EquipmentRepair: Record "Equipment Repair Tracking";
//     begin
//         // EquipmentRepair.Reset;
//         // EquipmentRepair.SetRange("Document No", documentNumber);
//         // if EquipmentRepair.FindSet then begin
//         //     EquipmentRepair."Document No" := documentNumber;
//         //     EquipmentRepair."Document Type" := EquipmentRepair."document type"::"Repair and Maintainance";
//         //     EquipmentRepair."Contractor No" := vendorno;
//         //     EquipmentRepair."Project No" := projectid;


//         //     if EquipmentRepair.Modify(true) then begin
//         //         EquipmentRepair.Validate("Project No");
//         //         status := 'success*' + EquipmentRepair."Document No" + '*Equipment Repair Tracking Details Was Successfully Modified!';
//         //     end else begin
//         //         status := 'danger*Equipment Repair Tracking Details Was Successfully Modified!';
//         //     end;
//         // end else begin
//         //     EquipmentRepair.Init;
//         //     EquipmentRepair.Reset;
//         //     EquipmentRepair."Project No" := projectid;
//         //     EquipmentRepair."Contractor No" := vendorno;
//         //     EquipmentRepair."Document Type" := EquipmentRepair."document type"::"Repair and Maintainance";

//         //     if EquipmentRepair.Insert(true) then begin
//         //         EquipmentRepair.Validate("Project No");
//         //         EquipmentRepair.Modify;
//         //         status := 'success*' + EquipmentRepair."Document No" + '*Equipment Repair Tracking Details Was Successfully Modified!';
//         //     end else begin
//         //         status := 'danger*Equipment Repair Tracking Details Was Successfully Modified!';


//         //     end;
//         // end;
//     end;

//     procedure fnSubmitInsuranceForNotification(vendornumber: Code[20]; Documentno: Code[50]) status: Text
//     var
//     // InsuranceGuaranteeHeader: Record "Insurance/Guarantee Header";
//     begin

//         // InsuranceGuaranteeHeader.Init;
//         // InsuranceGuaranteeHeader.SetRange(InsuranceGuaranteeHeader."Document No.", Documentno);
//         // if InsuranceGuaranteeHeader.Find('-') then begin

//         //     Rec := InsuranceGuaranteeHeader;
//         //     ProcurementProcessing.FnSendInsurerNotification(Rec);
//         //     status := 'success*' + InsuranceGuaranteeHeader."Document No." + '*Document Was Successfully Submitted!';
//         // end else begin
//         //     status := 'danger*Error while Submitting the Document!';

//         // end
//     end;

//     procedure fnSubmitNotificationtoRERequestForTakingOver(vendornumber: Code[20]; Documentno: Code[50]) status: Text
//     var
//     // MeasurementsPaymentsHeader: Record "Measurement &  Payment Header";
//     begin

//         // MeasurementsPaymentsHeader.Init;
//         // MeasurementsPaymentsHeader.SetRange(MeasurementsPaymentsHeader."Document No.", Documentno);
//         // if MeasurementsPaymentsHeader.Find('-') then begin
//         //     MeasurementsPaymentsHeader."Portal Status" := MeasurementsPaymentsHeader."portal status"::Submitted;
//         //     MeasurementsPaymentsHeader.Modify();

//         //     Rec := MeasurementsPaymentsHeader;
//         //     //Notify The RE that the Contractor has submitted a request for completion
//         //     ProcurementProcessing.FnNotifyRERequestForTakingOver(Rec);

//         //     status := 'success*' + MeasurementsPaymentsHeader."Document No." + '*Document Was Successfully Submitted!';
//         // end else begin
//         //     status := 'danger*Error while Submitting the Document!';

//         // end
//     end;

//     procedure fnSubmitNotificationtoREMaterialTestRecord(vendornumber: Code[20]; Documentno: Code[50]) status: Text
//     var
//     // MaterialTestRecord: Record "Material Test Record";
//     begin

//         // MaterialTestRecord.Init;
//         // MaterialTestRecord.SetRange(MaterialTestRecord.Code, Documentno);
//         // if MaterialTestRecord.Find('-') then begin
//         //     MaterialTestRecord."Portal Status" := MaterialTestRecord."portal status"::Submitted;

//         //     MaterialTestRecord.Modify();

//         //     Rec := MaterialTestRecord;
//         //     //Notify The RE that the Contractor has submitted a request for completion
//         //     ProcurementProcessing.FnNotifyRETestMaterialCert(Rec);

//         //     status := 'success*' + MaterialTestRecord.Code + '*Document Was Successfully Submitted!';
//         // end else begin
//         //     status := 'danger*Error while Submitting the Document!';

//         // end
//     end;

//     procedure fnSubmitNotificationtoRESiteAgentNomination(vendornumber: Code[20]; Documentno: Code[50]) status: Text
//     var
//         WEPContractorSubmission: Record "WEP Contractor Submission";
//     begin

//         WEPContractorSubmission.Init;
//         WEPContractorSubmission.SetRange(WEPContractorSubmission."Document No", Documentno);
//         if WEPContractorSubmission.Find('-') then begin
//             WEPContractorSubmission."Portal Status" := WEPContractorSubmission."portal status"::Submitted;

//             WEPContractorSubmission.Modify();

//             Rec := WEPContractorSubmission;
//             //Notify The RE that the Contractor has submitted a request for completion
//             //  ProcurementProcessing.FnNotifyRESiteAgentNomination(Rec);

//             status := 'success*' + WEPContractorSubmission."Document No" + '*Document Was Successfully Submitted!';
//         end else begin
//             status := 'danger*Error while Submitting the Document!';

//         end
//     end;

//     procedure fnSubmitNotificationtoREContractorPersonnelAppointment(vendornumber: Code[20]; Documentno: Code[50]) status: Text
//     var
//         WEPContractorSubmission: Record "WEP Contractor Submission";
//     begin

//         WEPContractorSubmission.Init;
//         WEPContractorSubmission.SetRange(WEPContractorSubmission."Document No", Documentno);
//         if WEPContractorSubmission.Find('-') then begin
//             WEPContractorSubmission."Portal Status" := WEPContractorSubmission."portal status"::Submitted;

//             WEPContractorSubmission.Modify();

//             Rec := WEPContractorSubmission;
//             //Notify The RE that the Contractor has submitted a request for completion
//             // ProcurementProcessing.FnNotifyREContractorPersonnelAppointment(Rec);

//             status := 'success*' + WEPContractorSubmission."Document No" + '*Document Was Successfully Submitted!';
//         end else begin
//             status := 'danger*Error while Submitting the Document!';

//         end
//     end;

//     procedure fnSubmitNotificationtoREPlanofEquipmentDeliverytoSite(vendornumber: Code[20]; Documentno: Code[50]) status: Text
//     var
//         WEPContractorSubmission: Record "WEP Contractor Submission";
//     begin

//         WEPContractorSubmission.Init;
//         WEPContractorSubmission.SetRange(WEPContractorSubmission."Document No", Documentno);
//         if WEPContractorSubmission.Find('-') then begin
//             WEPContractorSubmission."Portal Status" := WEPContractorSubmission."portal status"::Submitted;
//             WEPContractorSubmission.Modify();
//             Rec := WEPContractorSubmission;

//             //Notify The RE that the Contractor has submitted a request for completion
//             // ProcurementProcessing.FnNotifyREPlanOfEquipmentDeliveryToSite(Rec);

//             status := 'success*' + WEPContractorSubmission."Document No" + '*Document Was Successfully Submitted!';
//         end else begin
//             status := 'danger*Error while Submitting the Document!';

//         end
//     end;

//     procedure FnGetTakingOverSections(var VarAll: BigText; vendorNo: Code[20]; documentno: Code[30])
//     var
//     // TakeOverSections: Record "Taking Over Section";
//     begin
//         Clear(VarAll);
//         // TakeOverSections.Reset;
//         // TakeOverSections.SetRange(TakeOverSections."Inspection No", documentno);
//         // if TakeOverSections.Find('-') then begin
//         //     repeat

//         //         VarAll.AddText('::::' + TakeOverSections."Inspection No" + '* ' + Format(TakeOverSections."Document Type") + '* ' +
//         //         Format(TakeOverSections."Line No") + '* ' + TakeOverSections."Road Code" + '* ' + TakeOverSections."Road Section No" + '* ' +
//         //         TakeOverSections."Link Name" + '* ' + TakeOverSections."Section Name" + '* ' + Format(TakeOverSections."Start Chainage") + '* ' +
//         //         Format(TakeOverSections."End Chainage") + '* ' + Format(TakeOverSections."Workplannned Length"));

//         //     until TakeOverSections.Next = 0;

//         // end;
//     end;

//     procedure FnGetTakingOverSectionsLines(var VarAll: BigText; vendorNo: Code[20]; documentno: Code[30]; lineno: Integer)
//     var
//     // TakeOverSectionLines: Record "Taking Over Section Line";
//     begin
//         Clear(VarAll);
//         // TakeOverSectionLines.Reset;
//         // TakeOverSectionLines.SetRange(TakeOverSectionLines."Document No", documentno);
//         // TakeOverSectionLines.SetRange(TakeOverSectionLines."Line No", lineno);
//         // if TakeOverSectionLines.Find('-') then begin
//         //     repeat

//         //         VarAll.AddText('::::' + TakeOverSectionLines."Document No" + '* ' + Format(TakeOverSectionLines."Document Type") + '* ' +
//         //         Format(TakeOverSectionLines."Line No") + '* ' + Format(TakeOverSectionLines."Taking Over Start Chainage") + '* ' +
//         //         Format(TakeOverSectionLines."Taking Over End Chainage") + '* ' + Format(TakeOverSectionLines."Taking Over Length") + '* ' + TakeOverSectionLines.Comments);

//         //     until TakeOverSectionLines.Next = 0;

//         // end;
//     end;

//     procedure fnSubmitTakingOverSection(documentNumber: Code[50]; lineno: Integer; entryno: Integer; startchainage: Decimal; endchainage: Decimal; comments: Text) status: Text
//     var
//     // TakeOverSectionLines: Record "Taking Over Section Line";
//     begin

//         // TakeOverSectionLines.Reset;
//         // TakeOverSectionLines.SetRange("Document No", documentNumber);
//         // TakeOverSectionLines.SetRange("Line No", lineno);
//         // TakeOverSectionLines.SetRange("Entry No.", entryno);
//         // if TakeOverSectionLines.FindSet then begin
//         //     TakeOverSectionLines."Line No" := lineno;
//         //     TakeOverSectionLines."Document No" := documentNumber;
//         //     TakeOverSectionLines."Document Type" := TakeOverSectionLines."document type"::"Contractor Request for Taking Over";
//         //     TakeOverSectionLines."Taking Over Start Chainage" := startchainage;
//         //     TakeOverSectionLines."Taking Over End Chainage" := endchainage;
//         //     TakeOverSectionLines.Comments := comments;


//         //     if TakeOverSectionLines.Modify(true) then begin
//         //         TakeOverSectionLines.Validate("Taking Over End Chainage");
//         //         status := 'success*' + TakeOverSectionLines."Document No" + '*Taken Over Section Details Was Successfully Modified!';
//         //     end else begin
//         //         status := 'danger*Taken Over Section Details Was Successfully Modified!';
//         //     end;
//         // end else begin
//         //     TakeOverSectionLines.Init;
//         //     TakeOverSectionLines.Reset;
//         //     TakeOverSectionLines."Document No" := documentNumber;
//         //     TakeOverSectionLines."Line No" := lineno;
//         //     TakeOverSectionLines."Document Type" := TakeOverSectionLines."document type"::"Contractor Request for Taking Over";
//         //     TakeOverSectionLines."Taking Over Start Chainage" := startchainage;
//         //     TakeOverSectionLines."Taking Over End Chainage" := endchainage;
//         //     // IF comments = '' THEN
//         //     TakeOverSectionLines.Comments := comments;

//         //     if TakeOverSectionLines.Insert(true) then begin
//         //         TakeOverSectionLines.Validate("Taking Over End Chainage");
//         //         TakeOverSectionLines.Modify;
//         //         status := 'success*' + TakeOverSectionLines."Document No" + '*Taken Over Section Details Was Successfully Modified!';
//         //     end else begin
//         //         status := 'danger*Taken Over Section Details Was Successfully Modified!';


//         //     end;
//         // end;
//     end;

//     procedure FnGetInspectionSnagList(var VarAll: BigText; vendorNo: Code[20]; documentno: Code[30])
//     var
//     // InspectionSnagList: Record "Inspection Snag List";
//     begin
//         Clear(VarAll);
//         // InspectionSnagList.Reset;
//         // InspectionSnagList.SetRange(InspectionSnagList."Inspection No", documentno);
//         // if InspectionSnagList.Find('-') then begin
//         //     repeat

//         //         VarAll.AddText('::::' + InspectionSnagList."Inspection No" + '* ' + Format(InspectionSnagList."Inspection Type") + '* ' +
//         //         Format(InspectionSnagList."Item No") + '* ' + InspectionSnagList."Bill Item Code" + '* ' + Format(InspectionSnagList."Plan Line No") + '* ' +
//         //         InspectionSnagList."Bill No" + '* ' + InspectionSnagList."Bill Description" + '* ' + Format(InspectionSnagList."Works Start Chainage") + '* ' +
//         //         Format(InspectionSnagList."Works End Chainage") + '* ' + Format(InspectionSnagList."Due Date") + '* ' + InspectionSnagList."Additional Comments" + '* ' +
//         //         Format(InspectionSnagList.Status) + '* ' + InspectionSnagList."Contractor Comments" + '* ' + InspectionSnagList."Project ID");

//         //     until InspectionSnagList.Next = 0;

//         // end;
//     end;

//     procedure fnSubmitInspectionSnagList(documentNumber: Code[50]; planlineno: Integer; itemno: Integer; billitemcode: Code[50]; startchainage: Decimal; endchainage: Decimal; contractorcomments: Text; additionalcomments: Text; duedate: Date; projectid: Code[50]) status: Text
//     var
//     // InspectionSnagList: Record "Inspection Snag List";
//     begin

//         // InspectionSnagList.Reset;
//         // InspectionSnagList.SetRange("Inspection No", documentNumber);
//         // InspectionSnagList.SetRange("Plan Line No", planlineno);
//         // if InspectionSnagList.FindSet then begin
//         //     InspectionSnagList."Plan Line No" := planlineno;
//         //     InspectionSnagList."Inspection No" := documentNumber;
//         //     InspectionSnagList."Inspection Type" := InspectionSnagList."inspection type"::"End of DLP Inspection";
//         //     InspectionSnagList."Works Start Chainage" := startchainage;
//         //     InspectionSnagList."Works End Chainage" := endchainage;
//         //     InspectionSnagList."Contractor Comments" := contractorcomments;
//         //     InspectionSnagList."Additional Comments" := additionalcomments;
//         //     InspectionSnagList."Due Date" := duedate;


//         //     if InspectionSnagList.Modify(true) then begin
//         //         InspectionSnagList.Validate("Plan Line No");
//         //         status := 'success*' + InspectionSnagList."Inspection No" + '*Inspection Snag List Details Was Successfully Modified!';
//         //     end else begin
//         //         status := 'danger*Inspection Snag List Details Was Successfully Modified!';
//         //     end;
//         // end else begin
//         //     InspectionSnagList.Init;
//         //     InspectionSnagList.Reset;
//         //     InspectionSnagList."Plan Line No" := planlineno;
//         //     InspectionSnagList."Inspection No" := documentNumber;
//         //     InspectionSnagList."Inspection Type" := InspectionSnagList."inspection type"::"End of DLP Inspection";
//         //     InspectionSnagList."Works Start Chainage" := startchainage;
//         //     InspectionSnagList."Works End Chainage" := endchainage;
//         //     InspectionSnagList."Contractor Comments" := contractorcomments;
//         //     InspectionSnagList."Additional Comments" := additionalcomments;
//         //     InspectionSnagList."Due Date" := duedate;

//         //     if InspectionSnagList.Insert(true) then begin
//         //         InspectionSnagList.Validate("Plan Line No");
//         //         InspectionSnagList.Modify;
//         //         status := 'success*' + InspectionSnagList."Inspection No" + '*Inspection Snag List Details Was Successfully Modified!';
//         //     end else begin
//         //         status := 'danger*Inspection Snag List Details Was Successfully Modified!';


//         //     end;
//         // end;
//     end;

//     procedure FnGetProjectRoadLinks(var VarAll: BigText; vendorNo: Code[20]; projectid: Code[50])
//     var
//     // ProjectRoadLinks: Record "Project Road Link";
//     begin
//         Clear(VarAll);
//         // ProjectRoadLinks.Reset;
//         // ProjectRoadLinks.SetRange(ProjectRoadLinks."Judiciary Budget Code", DelChr(projectid, '<>'));
//         // ProjectRoadLinks.SetRange(ProjectRoadLinks."Global Budget Book Code", projectid);
//         // if ProjectRoadLinks.Find('-') then begin
//         //     repeat

//         //         VarAll.AddText('::::' + ProjectRoadLinks."Road Code" + '* ' + ProjectRoadLinks."Judiciary Road Code" + '* ' + ProjectRoadLinks."Link Name" + '* ' +
//         //         Format(ProjectRoadLinks."Start Chainage(KM)") + '* ' + Format(ProjectRoadLinks."End Chainage(KM)") + '* ' + Format(ProjectRoadLinks."Workplanned Length(KM)") + '* ' +
//         //         Format(ProjectRoadLinks."Authentic Road Reserve Width") + '* ' + Format(ProjectRoadLinks."Actual Road Reserve Width") + '* ' + ProjectRoadLinks."Road Class" + '* ' +
//         //         ProjectRoadLinks."Current Pavement Surface Type" + '* ' + ProjectRoadLinks."New Pavement Surface Type" + '* ' + ProjectRoadLinks."Global Budget Book Code" + '* ' + ProjectRoadLinks."Judiciary Budget Code");

//         //     until ProjectRoadLinks.Next = 0;

//         // end;
//     end;

//     local procedure fnInsertLinks(bidresponse: Code[10]; sharepointlink: Text; filename: Text)
//     var
//         DocumentAttachment: Record "Document Attachment";
//         RecordLink: Record "Record Link";
//         PurchaseHeader: Record "Purchase Header";
//     begin
//         // Record Links Attachment on the Applications -Obadiah Korir
//         if RecordLink."Link ID" = 0 then begin
//             RecordLink.URL1 := sharepointlink;
//             RecordLink.Description := filename;
//             RecordLink.Type := RecordLink.Type::Link;
//             RecordLink.Company := COMPANYNAME;
//             RecordLink."User ID" := UserId;
//             RecordLink.Created := CreateDatetime(Today, Time);
//             PurchaseHeader.Reset;
//             PurchaseHeader."No." := bidresponse;
//             if PurchaseHeader.Find('=') then
//                 RecordIDNumber := PurchaseHeader.RecordId;
//             RecordLink."Record ID" := RecordIDNumber;
//             RecordLink.Insert(true);
//         end;
//     end;

//     procedure fnInsertRFIResponseResponsibilityCenter(documentNo: Code[30]; procurementCategory: Code[30]; vendorNo: Code[30]; regionCode: Code[50]; ConstituencyCode: Code[50]) insertstatus: Text
//     var
//         IFPResponceLineRC: Record "IFP Response Line RC";
//     begin
//         IFPResponceLineRC.Reset;
//         // IFPResponceLineRC.SETRANGE("Procurement Category", procurementCategory);
//         // IFPResponceLineRC.SETRANGE("Document Type",IFPResponceLineRC."Document Type"::"IFP Response");
//         // IFPResponceLineRC."Document No.":=documentNo;
//         // IFPResponceLineRC.SETRANGE("Vendor No", vendorNo);
//         // IF IFPResponceLineRC.FINDSET THEN BEGIN
//         // //IFPResponceLineRC."Document No.":=documentNo;
//         // //IFPResponceLineRC."Vendor No":=vendorNo;
//         // IFPResponceLineRC."Responsibility Center Code":=regionCode;
//         // IFPResponceLineRC.VALIDATE("Responsibility Center Code");
//         // IF IFPResponceLineRC.MODIFY(TRUE) THEN BEGIN
//         //  insertstatus:='success*Responsibility Center successfully modified!';
//         // END;
//         // END ELSE BEGIN
//         IFPResponceLineRC.Init;
//         IFPResponceLineRC."Document Type" := IFPResponceLineRC."document type"::"IFP Response";
//         IFPResponceLineRC."Document No." := documentNo;
//         IFPResponceLineRC."Responsibility Center Code" := regionCode;
//         IFPResponceLineRC.Validate("Responsibility Center Code");
//         IFPResponceLineRC."Procurement Category" := procurementCategory;
//         IFPResponceLineRC.Validate("Procurement Category");
//         // IFPResponceLineRC."Vendor No" := vendorNo;
//         // IFPResponceLineRC."Constituency Code" := ConstituencyCode;
//         // IFPResponceLineRC.Validate("Constituency Code");
//         if IFPResponceLineRC.Insert(true) then
//             insertstatus := 'success*Responsibility Center was successfully inserted!'
//         else
//             insertstatus := 'danger*Responsibility center exists.!';
//     end;

//     procedure FnSupplierBusinessProfile(industryGroup: Text; companysize: Code[20]; nominalCap: Decimal; Vision: Text; Mission: Text; locationAddress: Code[50]; maxbizvalue: Decimal; mobileNo: Code[20]; natureofBiz: Code[250]; vendorNo: Code[20]) insertstatus: Text
//     begin
//         objVendor.Reset;
//         objVendor.SetRange("No.", vendorNo);
//         if objVendor.FindSet then begin

//             //objVendor.SETRANGE("Registrn Submitted onPortal", TRUE);
//             if objVendor.FindSet then begin
//                 // objVendor."Business Type":=businessType;
//                 //objVendor."Supplier Type":=vendorType;
//                 // objVendor."Dealer Type":=dealerType;
//                 //  objVendor."Registration/Incorporation No.":=certofIncopNo;
//                 //  objVendor."Ownership Type":=ownershipType;
//                 //  objVendor."Reg/Incorporation Date":=dateofIncorporation;
//                 //  objVendor."Operations Start Date":=dateofOps;
//                 //  objVendor."Language Code":=languageCode;
//                 objVendor."Industry Group" := industryGroup;
//                 objVendor."Vision Statement" := Vision;
//                 objVendor."Mission Statement" := Mission;
//                 //  objVendor.Address:=poAddress;
//                 objVendor."Address 2" := locationAddress;
//                 //  objVendor."Post Code":=postacode;
//                 //  objVendor.City:=postaCity;
//                 //  objVendor."Country/Region Code":=countryofOrigin;
//                 //  objVendor."Website Url":=webUrl;
//                 //  objVendor.Tel:=telephoneNo;
//                 //  objVendor."Building/House No":=buildingNo;
//                 //  objVendor.Floor:=floorNo;
//                 //  objVendor."Plot No":=plotNo;
//                 //  objVendor.Street:=streetorRoad;
//                 //  objVendor."Fax No.":=faxNo;
//                 objVendor."Company Size" := companysize;
//                 objVendor."Nominal Capital LCY" := nominalCap;
//                 objVendor."Max Value of Business" := maxbizvalue;
//                 objVendor."Phone No." := mobileNo;
//                 objVendor."Nature of Business" := natureofBiz;
//                 objVendor."Profile Complete" := true;
//                 if objVendor.Modify(true) then begin
//                     insertstatus := 'success*Your information submitted successfully!';
//                 end else begin
//                     insertstatus := 'danger*System Unknown Error Occured!';
//                 end;
//             end
//             else begin
//                 // objVendor."Business Type":=businessType;
//                 //objVendor."Supplier Type":=vendorType;
//                 // objVendor."Dealer Type":=dealerType;
//                 //  objVendor."Registration/Incorporation No.":=certofIncopNo;
//                 //  objVendor."Ownership Type":=ownershipType;
//                 //  objVendor."Reg/Incorporation Date":=dateofIncorporation;
//                 //  objVendor."Operations Start Date":=dateofOps;
//                 //  objVendor."Language Code":=languageCode;
//                 objVendor."Industry Group" := industryGroup;
//                 objVendor."Vision Statement" := Vision;
//                 objVendor."Mission Statement" := Mission;
//                 //  objVendor.Address:=poAddress;
//                 objVendor."Address 2" := locationAddress;
//                 //  objVendor."Post Code":=postacode;
//                 //  objVendor.City:=postaCity;
//                 //  objVendor."Country/Region Code":=countryofOrigin;
//                 //  objVendor."Website Url":=webUrl;
//                 //  objVendor.Tel:=telephoneNo;
//                 //  objVendor."Building/House No":=buildingNo;
//                 //  objVendor.Floor:=floorNo;
//                 //  objVendor."Plot No":=plotNo;
//                 //  objVendor.Street:=streetorRoad;
//                 //  objVendor."Fax No.":=faxNo;
//                 objVendor."Company Size" := companysize;
//                 objVendor."Nominal Capital LCY" := nominalCap;
//                 objVendor."Max Value of Business" := maxbizvalue;
//                 objVendor."Phone No." := mobileNo;
//                 objVendor."Nature of Business" := natureofBiz;
//                 objVendor."Profile Complete" := true;
//                 if objVendor.Modify(true) then begin
//                     insertstatus := 'success*Your information submitted successfully!';
//                 end else begin
//                     insertstatus := 'danger*System Unknown Error Occured!';
//                 end

//             end
//         end
//         else begin
//             insertstatus := 'danger*Vendor does not exist!';
//         end
//     end;

//     procedure FnSupplierCommunicationDetails(postacode: Code[20]; countryofOrigin: Code[20]; poAddress: Code[20]; postaCity: Text; webUrl: Text; telephoneNo: Code[20]; buildingNo: Code[20]; floorNo: Code[10]; plotNo: Code[10]; streetorRoad: Text; faxNo: Code[50]; vendorNo: Code[20]) insertstatus: Text
//     begin
//         objVendor.Reset;
//         objVendor.SetRange("No.", vendorNo);
//         if objVendor.FindSet then begin
//             objVendor.SetRange("Registrn Submitted onPortal", true);
//             if objVendor.FindSet then begin

//                 objVendor.Address := poAddress;
//                 //objVendor."Address 2":=locationAddress;
//                 objVendor."Post Code" := postacode;
//                 objVendor.City := postaCity;
//                 objVendor."Country/Region Code" := countryofOrigin;
//                 objVendor."Website Url" := webUrl;
//                 objVendor.Tel := telephoneNo;
//                 objVendor."Building/House No" := buildingNo;
//                 objVendor.Floor := floorNo;
//                 objVendor."Plot No" := plotNo;
//                 objVendor.Street := streetorRoad;
//                 objVendor."Fax No." := faxNo;
//                 //objVendor."Company Size":=companysize;
//                 //objVendor."Nominal Capital LCY":=nominalCap;
//                 //objVendor."Max Value of Business":=maxbizvalue;
//                 objVendor."Phone No." := telephoneNo;
//                 //objVendor."Nature of Business":=natureofBiz;
//                 objVendor."Profile Complete" := true;
//                 if objVendor.Modify(true) then begin
//                     insertstatus := 'success*Your information was successfully modified!';
//                 end;

//                 //insertstatus:='danger*You have already submitted your application, consider editing it!';
//             end
//             else begin
//                 // objVendor."Business Type":=businessType;
//                 //objVendor."Supplier Type":=vendorType;
//                 // objVendor."Dealer Type":=dealerType;
//                 //  objVendor."Registration/Incorporation No.":=certofIncopNo;
//                 //  objVendor."Ownership Type":=ownershipType;
//                 //  objVendor."Reg/Incorporation Date":=dateofIncorporation;
//                 //  objVendor."Operations Start Date":=dateofOps;
//                 //  objVendor."Language Code":=languageCode;
//                 //  objVendor."Industry Group":=industryGroup;
//                 //  objVendor."Vision Statement":=vision;
//                 //  objVendor."Mission Statement":=mision;
//                 objVendor.Address := poAddress;
//                 //objVendor."Address 2":=locationAddress;
//                 objVendor."Post Code" := postacode;
//                 objVendor.City := postaCity;
//                 objVendor."Country/Region Code" := countryofOrigin;
//                 objVendor."Website Url" := webUrl;
//                 objVendor.Tel := telephoneNo;
//                 objVendor."Building/House No" := buildingNo;
//                 objVendor.Floor := floorNo;
//                 objVendor."Plot No" := plotNo;
//                 objVendor.Street := streetorRoad;
//                 objVendor."Fax No." := faxNo;
//                 //objVendor."Company Size":=companysize;
//                 //objVendor."Nominal Capital LCY":=nominalCap;
//                 //objVendor."Max Value of Business":=maxbizvalue;
//                 objVendor."Phone No." := telephoneNo;
//                 //objVendor."Nature of Business":=natureofBiz;
//                 objVendor."Profile Complete" := true;
//                 if objVendor.Modify(true) then begin
//                     insertstatus := 'success*Your information submitted successfully!';
//                 end else begin
//                     insertstatus := 'danger*System Unknown Error Occured!';
//                 end

//             end
//         end
//         else begin
//             insertstatus := 'danger*Vendor does not exist!';
//         end
//     end;

//     [NonDebuggable]
//     procedure fnDeleteResponsibilityCenter(vendorNo: Code[50]; regionCode: Code[50]) status: Text
//     var
//         IFPResponceLineRC: Record "IFP Response Line RC";
//     begin
//         /*status :='Could not delete bank';
//         IFPResponceLineRC.RESET;
//         IFPResponceLineRC.SETRANGE("Vendor No.",vendorNo);
//         //VendorBankAccount.SETRANGE(Code, bankCode);
//         IF IFPResponceLineRC.FINDSET THEN BEGIN
//             IF objVendorBank.DELETE(TRUE) THEN BEGIN
//               status:='success*You bank Account details have been successfully deleted!'
//               END ELSE BEGIN
//               status:='danger*You bank Account details could not be deleted!'
//               END
//           END;*/
//         IFPResponceLineRC.Reset;
//         // IFPResponceLineRC.SetRange("Vendor No", vendorNo);
//         IFPResponceLineRC.SetRange("Responsibility Center Code", regionCode);
//         if IFPResponceLineRC.FindSet then begin
//             if IFPResponceLineRC.Delete(true) then begin
//                 status := 'success*Your Responsibility center details have been successfully deleted!'
//             end else begin
//                 status := 'danger*Your Responsibility center could not be deleted!.Kindly Try Again Later'
//             end
//         end;

//     end;

//     procedure FnInsertRFregresponseHeader(vendorNo: Code[20]; rfiDocumentNo: Code[12]) insertstatus: Text
//     var
//         rfiApplNo: Code[12];
//     begin
//         objVendor.Reset;
//         objVendor.SetRange("No.", vendorNo);
//         objVendor.SetRange("Profile Complete", true);
//         if objVendor.FindSet then begin

//             objRFIResponse.Reset;
//             objRFIResponse.SetRange("Vendor No.", vendorNo);
//             objRFIResponse.SetRange("RFI Document No.", rfiDocumentNo);
//             objRFIResponse.SetRange("Document Type", objRFIResponse."document type"::"IFR Response");
//             if objRFIResponse.FindSet then begin
//                 //edit entry
//                 insertstatus := 'success*' + fnGetLastDocumentNoRegistration(vendorNo, rfiDocumentNo);
//             end
//             else begin
//                 //fresh insert
//                 objRFIResponse.Init;
//                 objRFIResponse."Document Type" := objRFIResponse."document type"::"IFR Response";
//                 //objRFIResponse."Document Type":=DocumentType;

//                 ProcurementSetup.Get;
//                 if objRFIResponse."Document Type" = objRFIResponse."document type"::"IFR Response" then begin
//                     ProcurementSetup.TestField("IFP Response Nos");
//                     NoMgt.InitSeries(ProcurementSetup."IFP Response Nos", objRFIResponse."No. Series", 0D, objRFIResponse."Document No.", objRFIResponse."No. Series");
//                 end;

//                 objRFIResponse."RFI Document No." := rfiDocumentNo;
//                 objRFIResponse."Document Date" := Today;
//                 objRFIResponse."Vendor No." := vendorNo;
//                 objRFIResponse."Document Status" := objRFIResponse."document status"::Draft;
//                 objRFIResponse.Validate("Vendor No.");
//                 if objRFIResponse.Insert() then
//                     insertstatus := 'success*' + fnGetLastDocumentNoRegistration(vendorNo, rfiDocumentNo)
//                 else
//                     insertstatus := 'danger*Unknown error occured!';
//             end
//         end else begin
//             insertstatus := 'profileincomplete*Supplier Profile was not successfully completed';
//         end;
//     end;

//     [NonDebuggable]
//     procedure FnDelBidRespDocument(vendorNo: Code[50]; entryNo: Integer) status: Text
//     var
//         VendorFiledRegDocument: Record "Bid Filed Document";
//     begin

//         VendorFiledRegDocument.Reset;
//         VendorFiledRegDocument.SetRange("Vendor No", vendorNo);
//         VendorFiledRegDocument.SetRange("Entry No", entryNo);
//         if VendorFiledRegDocument.FindSet then begin
//             VendorFiledRegDocument.Delete(true);

//         end;
//     end;

//     [NonDebuggable]
//     procedure FnDelDocument(vendorNo: Code[50]; entryNo: Integer) status: Text
//     var
//         VendorFiledRegDocument: Record "Vendor Filed Reg Document";
//     begin

//         VendorFiledRegDocument.Reset;
//         VendorFiledRegDocument.SetRange("Vendor No", vendorNo);
//         VendorFiledRegDocument.SetRange("Entry No", entryNo);
//         if VendorFiledRegDocument.FindSet then begin
//             VendorFiledRegDocument.Delete(true);

//         end;
//     end;

//     procedure FnPerformanceGiarantee(DocumentoNo: Code[50]; purchaseContactId: Code[50]; projectId: Code[50]; contaractorId: Code[50]; insurerName: Text; policyNo: Text; AmountInsured: Decimal; FormOfSecurity: Code[50]; IssuerInstitutionType: Option; IssuerRegOffice: Text; EmailAddress: Text; EffectiveDate: Date; ExpiryDate: Date) status: Text
//     var
//     // InsuranceGuaranteeHeader: Record "Insurance/Guarantee Header";
//     begin

//         // if DocumentoNo = '' then begin
//         //     RoadManagementSetup.Get();
//         //     RoadManagementSetup.TestField(RoadManagementSetup."Performance Guarantee Nos");
//         //     InsuranceGuaranteeHeader.Init;
//         //     NoSeriesManagement.InitSeries(RoadManagementSetup."Performance Guarantee Nos", InsuranceGuaranteeHeader."No. Series", Today, InsuranceGuaranteeHeader."Document No.", InsuranceGuaranteeHeader."No. Series");
//         //     InsuranceGuaranteeHeader."Document Type" := InsuranceGuaranteeHeader."document type"::"Performance Guarantee";
//         //     InsuranceGuaranteeHeader."Security Type" := InsuranceGuaranteeHeader."security type"::"Performance/Contract Security";
//         //     InsuranceGuaranteeHeader."Purchase Contract ID" := purchaseContactId;
//         //     InsuranceGuaranteeHeader.Validate("Purchase Contract ID");
//         //     InsuranceGuaranteeHeader."Project ID" := projectId;
//         //     InsuranceGuaranteeHeader.Validate("Project ID");
//         //     InsuranceGuaranteeHeader."Contractor ID" := contaractorId;
//         //     InsuranceGuaranteeHeader.Validate("Contractor ID");
//         //     InsuranceGuaranteeHeader."Insurer/Guarantor Name" := insurerName;
//         //     InsuranceGuaranteeHeader."Policy/Guarantee No" := policyNo;
//         //     InsuranceGuaranteeHeader."Amount Insured/Guaranteed" := AmountInsured;
//         //     InsuranceGuaranteeHeader."Form of Security" := FormOfSecurity;
//         //     InsuranceGuaranteeHeader."Issuer Institution Type" := IssuerInstitutionType;
//         //     InsuranceGuaranteeHeader."Issuer Registered Offices" := IssuerRegOffice;
//         //     InsuranceGuaranteeHeader."Verified Insurer Email Address" := EmailAddress;
//         //     InsuranceGuaranteeHeader."Effective Date" := EffectiveDate;
//         //     InsuranceGuaranteeHeader."Expiry Date" := ExpiryDate;
//         //     InsuranceGuaranteeHeader.Validate("Expiry Date");
//         //     if InsuranceGuaranteeHeader.Insert(true) then begin
//         //         //Notify the Insurer and let them confirm via another email
//         //         //ProcurementProcessing.FnSendInsurerNotification(InsuranceGuaranteeHeader);
//         //         // MESSAGE(FORMAT("Document Type")+' %1 Submitted Successfully',"Document No.");
//         //         status := 'success*Your information was submitted successfully!*' + InsuranceGuaranteeHeader."Document No.";
//         //     end else begin
//         //         status := 'danger*System Unknown Error Occured!';
//         //     end;
//         // end else
//         //     InsuranceGuaranteeHeader.Reset;
//         // InsuranceGuaranteeHeader.SetRange("Document No.", DocumentoNo);
//         // if InsuranceGuaranteeHeader.FindSet then begin
//         //     InsuranceGuaranteeHeader."Document Type" := InsuranceGuaranteeHeader."document type"::"Performance Guarantee";
//         //     InsuranceGuaranteeHeader."Purchase Contract ID" := purchaseContactId;
//         //     InsuranceGuaranteeHeader.Validate("Purchase Contract ID");
//         //     InsuranceGuaranteeHeader."Project ID" := projectId;
//         //     InsuranceGuaranteeHeader.Validate("Project ID");
//         //     InsuranceGuaranteeHeader."Contractor ID" := contaractorId;
//         //     InsuranceGuaranteeHeader.Validate("Contractor ID");
//         //     InsuranceGuaranteeHeader."Insurer/Guarantor Name" := insurerName;
//         //     InsuranceGuaranteeHeader."Policy/Guarantee No" := policyNo;
//         //     InsuranceGuaranteeHeader."Amount Insured/Guaranteed" := AmountInsured;
//         //     InsuranceGuaranteeHeader."Form of Security" := FormOfSecurity;
//         //     InsuranceGuaranteeHeader."Issuer Institution Type" := IssuerInstitutionType;
//         //     InsuranceGuaranteeHeader."Issuer Registered Offices" := IssuerRegOffice;
//         //     InsuranceGuaranteeHeader."Verified Insurer Email Address" := EmailAddress;
//         //     InsuranceGuaranteeHeader."Effective Date" := EffectiveDate;
//         //     InsuranceGuaranteeHeader."Expiry Date" := ExpiryDate;
//         //     InsuranceGuaranteeHeader.Validate("Expiry Date");

//         //     if InsuranceGuaranteeHeader.Modify(true) then begin
//         //         status := 'success*Your information was modified successfully!*' + InsuranceGuaranteeHeader."Document No.";
//         //     end else begin
//         //         status := 'danger*System Unknown Error Occured!';
//         //     end;
//         // end;
//     end;

//     procedure FnInsertPerfGuarantDocuments(vendorNo: Code[50]; filename: Code[50]; responseNo: Text; sharepointlink: Text) status: Text
//     var
//         DocumentAttachment: Record "Document Attachment";
//         RecordLink: Record "Record Link";
//     // InsuranceGuaranteeHeader: Record "Insurance/Guarantee Header";
//     begin
//         RecordLink.Reset;
//         if RecordLink."Link ID" = 0 then begin
//             RecordLink.URL1 := sharepointlink;
//             RecordLink.Description := filename;
//             RecordLink.Type := RecordLink.Type::Link;
//             RecordLink.Company := COMPANYNAME;
//             RecordLink."User ID" := UserId;
//             RecordLink.Created := CreateDatetime(Today, Time);
//             // InsuranceGuaranteeHeader.Reset;
//             // InsuranceGuaranteeHeader."Document No." := responseNo;
//             // if InsuranceGuaranteeHeader.Find('=') then
//             //     RecordIDNumber := InsuranceGuaranteeHeader.RecordId;
//             // RecordLink."Record ID" := RecordIDNumber;
//             if RecordLink.Insert(true) then
//                 status := 'success*Document saved successfully!';
//         end;
//     end;

//     procedure FnSubmitPerformanceGiarantee(DocumentoNo: Code[50]) status: Text
//     var
//     // InsuranceGuaranteeHeader: Record "Insurance/Guarantee Header";
//     begin


//         // InsuranceGuaranteeHeader.Reset;
//         // InsuranceGuaranteeHeader.SetRange("Document No.", DocumentoNo);
//         // if InsuranceGuaranteeHeader.FindSet then begin
//         //     //  ProcurementProcessing.FnSendInsurerNotification(InsuranceGuaranteeHeader);
//         //     InsuranceGuaranteeHeader."Email Notification" := true;
//         //     if InsuranceGuaranteeHeader.Modify(true) then begin
//         //         status := 'success*Your Performance Guarantee was successfully submitted!';
//         //     end else begin
//         //         status := 'danger*System Unknown Error Occured!';
//         //     end;
//         // end;
//     end;

//     procedure fnInsertFiledetailsPerformanceGuarantee(vendorNo: Code[30]; type: Code[50]; responseNo: Code[50]; filepath: Text) insertstatus: Text
//     var
//     // ContractIssuanceRequirements: Record "Contract Issuance Requirements";
//     begin
//         // ContractIssuanceRequirements.Reset;
//         // ContractIssuanceRequirements.SetRange("Document ID", responseNo);
//         // ContractIssuanceRequirements.SetRange("Procurement Document Type", type);
//         // if ContractIssuanceRequirements.FindSet then begin
//         //     ContractIssuanceRequirements."Document Link" := filepath;
//         //     if ContractIssuanceRequirements.Modify(true) then begin
//         //         insertstatus := 'success*Document saved successfully!';
//         //     end
//         //     else begin
//         //         insertstatus := 'danger*Error occured!';
//         //     end;
//         // end;
//     end;

//     procedure CreateInvitationNotice(Purch: Record "Purchase Header")
//     var
//         UserSetup: Record "User Setup";
//         IFS: Record "Standard Purchase Code";
//         ProcSetup: Record "Procurement Setup";
//         PurchLines: Record "Purchase Line";
//         IFSPurchLines: Record "Standard Purchase Line";
//         IFSMajorWorkDeliverable: Record "IFS Major Work_Deliverable";
//         PRNMajorWorkDeliverable: Record "PRN Major Work Deliverable";
//         IFSKeyStaff: Record "IFS Key Staff";
//         PRNPersonnelSpecification: Record "PRN Personnel Specification";
//         IFSStaffQualification: Record "IFS Staff Min Qualification";
//         PRNStaffQualification: Record "PRN Personnel Qualification";
//         PRNPersonnelExperience: Record "PRN Personnel Experience";
//         IFSPersonnelExperience: Record "IFS Staff Min Experience";
//         PRNEquipmentsSpecification: Record "PRN Equipment Specification";
//         IFSEquipmentsSpecification: Record "IFS Required Equipment";
//         EmailNotification: Codeunit "Email Notifications";
//         CompInfo: Record "Company Information";
//         IFSS: Record "Standard Purchase Code";
//         UserSetup2: Record "User Setup";
//     begin
//         if Purch."PRN Conversion Procedure" <> Purch."prn conversion procedure"::"Invitation For Supply" then
//             Error('The PRN %1  must be one that supports direct creation of Invitation Notices', Purch."No.");
//         ProcSetup.Get;
//         //Check Procurement User
//         UserSetup.Reset;
//         UserSetup.SetRange("User ID", UserId);
//         if UserSetup.FindSet then begin
//             // UserSetup.TESTFIELD("Purchase Resp. Ctr. Filter");
//             if UserSetup."Authorize IFS Creator" = false then
//                 Error('You Must be an Authorized IFS Creator in the User Setup, Kindly contact system administrator');
//             // IF UserSetup."Purchase Resp. Ctr. Filter"<>Purch."Responsibility Center" THEN
//             //   ERROR('You are not authorized to create IFS for this resonsibility center %1',Purch."Responsibility Center");
//         end;

//         //check if the PRN has associated IFS Notice
//         if (Purch."Ordered PRN" = true) or (Purch."Linked IFS No." <> '') then
//             Error('The PRN %1 has been already ordered', Purch."No.");

//         //The total value of the PRN request must be within the available procurement budget
//         if Purch."Total PRN Amount (LCY)" > Purch."PP Total Available Budget" then
//             Error('The total value of the PRN request must be within the available procurement budget');

//         //Testfields no blanks allowed
//         Purch.TestField("PP  Invitation Notice Type");
//         Purch.TestField("PP Solicitation Type");
//         Purch.TestField("PP Procurement Method");

//         //Action should automatically create an Invitation For Supply (IFS)
//         IFS.Reset;
//         IFS.SetRange("PRN No.", Purch."No.");
//         if not IFS.FindSet then begin
//             IFS.Init;
//             if Purch."PP Procurement Method" = Purch."PP Procurement Method"::"Framework Agreement" then begin
//                 IFS.Code := NoSeriesManagement.GetNextNo(ProcSetup."Framework ITT No. Series", Today, true);
//             end else
//                 if Purch."PP Procurement Method" = Purch."PP Procurement Method"::"Direct Procurement" then begin
//                     IFS.Code := NoSeriesManagement.GetNextNo(ProcSetup."Direct Prcmnt Nos", Today, true);
//                 end else
//                     if Purch."PP Procurement Method" = Purch."PP Procurement Method"::RFQ then begin
//                         IFS.Code := NoSeriesManagement.GetNextNo(ProcSetup."Request for Quotation Nos.", Today, true);
//                     end
//                     else begin
//                         IFS.Code := NoSeriesManagement.GetNextNo(ProcSetup."ITT No. Series", Today, true);
//                     end;
//             IFS.Validate("Invitation Notice Type", Purch."PP  Invitation Notice Type");
//             IFS.Validate(Description, Purch.Description);
//             IFS.Validate("Tender Name", Purch.Description);
//             IFS.Validate(Name, Purch.Description);
//             IFS.Validate("Tender Summary", Purch.Description);

//             //IFS."Location Code":=Purch."Location Code";
//             IFS.Validate("Location Code", Purch."Location Code");
//             IFS.Validate("Requisition Product Group", Purch."Requisition Product Group");
//             IFS.Validate("Document Date", Today);
//             IFS.Validate("PRN No.", Purch."No.");
//             IFS.Validate("Responsibility Center", Purch."Responsibility Center");
//             IFS.Validate("Requisition Product Group", Purch."Requisition Product Group");
//             IFS.Validate("Requisition Template ID", Purch."Requisition Template ID");
//             IFS.Validate("Solicitation Type", Purch."PP Solicitation Type");
//             IFS.Validate("Bid Selection Method", Purch."PP Bid Selection Method");
//             IFS.Validate("Procurement Method", Purch."PP Procurement Method");
//             IFS."Invitation Notice Type" := Purch."PP  Invitation Notice Type";
//             if IFS."Invitation Notice Type" = IFS."invitation notice type"::"Single  Stage Tender" then
//                 IFS.Validate("Tender Validity Duration", ProcSetup."Default Single Stage Tender");
//             if IFS."Invitation Notice Type" = IFS."invitation notice type"::"Two Stage Tender" then
//                 IFS.Validate("Tender Validity Duration", ProcSetup."Default Two Stage Tender valid");
//             if IFS."Invitation Notice Type" = IFS."invitation notice type"::RFQ then
//                 IFS.Validate("Tender Validity Duration", ProcSetup."Default RFQ Validity Duration");
//             if IFS."Invitation Notice Type" = IFS."invitation notice type"::"Low Value Procurement" then
//                 IFS.Validate("Tender Validity Duration", ProcSetup."Default LVP Validity Duration");
//             IFS.Validate("Purchaser Code", Purch."Purchaser Code");
//             IFS.Validate("Language Code", ProcSetup."Default Language Code");
//             IFS.Validate("Appointer of Bid Arbitrator", ProcSetup."Default Arbitrator Appointer");
//             IFS.Validate("Requesting Region", Purch.Region);
//             IFS.Validate("Global Dimension 1 Code", Purch."Shortcut Dimension 1 Code");
//             IFS.Validate("Global Dimension 2 Code", Purch."Shortcut Dimension 2 Code");
//             //MESSAGE('"Directorate Code" %1',Purch."Directorate Code");
//             IFS.Validate("Department Code", Purch."Department Code");
//             IFS.Validate("Procurement Plan ID", Purch."Procurement Plan ID");
//             IFS.Validate("Procurement Plan Entry No", Purch."Procurement Plan Entry No");
//             IFS.Validate(Job, Purch.Job);
//             IFS.Validate("Job Task No.", Purch."Job Task No.");
//             IFS.Validate("PP Planning Category", Purch."PP Planning Category");
//             //IFS.VALIDATE("PP Funding Source ID",Purch."PP Funding Source ID");
//             IFS.Validate("PP Total Budget", Purch."PP Total Budget");
//             IFS.Validate("PP Total Actual Costs", Purch."PP Total Actual Costs");
//             IFS.Validate("PP Total Commitments", Purch."PP Total Commitments");
//             IFS.Validate("PP Total Available Budget", Purch."PP Total Available Budget");
//             IFS.Validate("PP Preference/Reservation Code", Purch."PP Preference/Reservation Code");
//             //IFS.VALIDATE("Financial Year Code",ProcSetup.
//             IFS.Validate("Works Category", Purch."Works Category");
//             IFS.Validate("Road Code", Purch."Road Code");
//             IFS.Validate("Road Link Name", Purch."Link Name");
//             IFS.Validate("Constituency ID", Purch.Consitituency);
//             //IFS.VALIDATE("Procurement Type",Purch."Procurement Type");
//             IFS.Validate("Procurement Category ID", Purch."PP Planning Category");
//             IFS.Validate("Project ID", Purch.Job);
//             //IFS.Validate("Requesting Directorate",Purch."Directorate Code");
//             IFS.Validate("Requesting Department", Purch."Department Code");

//             CompInfo.Get;
//             IFS.Address := CompInfo.Address;
//             IFS."Procuring Entity Name/Contact" := CompInfo.Name;
//             IFS."Address 2" := CompInfo."Address 2";
//             IFS."Post Code" := CompInfo."Post Code";
//             IFS.City := CompInfo.City;
//             IFS."External Document No" := IFS.Code;
//             IFS."Country/Region Code" := CompInfo."Country/Region Code";
//             IFS."Phone No." := CompInfo."Phone No.";
//             IFS."E-Mail" := CompInfo."E-Mail";
//             IFS."Primary Tender Submission" := CompInfo.Address;
//             IFS."Primary Engineer Contact" := CompInfo.Address;
//             IFS."Created by" := USERID;
//             IFS."Created Date/Time" := CURRENTDATETIME;


//             if IFS.Insert(true) then begin
//                 PurchLines.Reset;
//                 PurchLines.SetRange("Document No.", Purch."No.");
//                 PurchLines.SetRange("Document Type", Purch."Document Type");
//                 if PurchLines.FindSet then begin
//                     repeat
//                         //2.IFS Purchase Lines (T174)-Default values shall be inherited from PRN Lines (T39)
//                         IFSPurchLines.Init;
//                         IFSPurchLines.Validate("Standard Purchase Code", IFS.Code);
//                         IFSPurchLines.Validate("Line No.", PurchLines."Line No.");
//                         IFSPurchLines.Validate(Type, PurchLines.Type);
//                         IFSPurchLines.Validate("No.", PurchLines."No.");
//                         IFSPurchLines.Validate(Description, PurchLines.Description);
//                         // IFSPurchLines.VALIDATE(Quantity,PurchLines.Quantity);
//                         IFSPurchLines.Quantity := PurchLines.Quantity;
//                         IFSPurchLines.Validate("Unit of Measure Code", PurchLines."Unit of Measure Code");
//                         IFSPurchLines.Validate("Shortcut Dimension 1 Code", PurchLines."Shortcut Dimension 1 Code");
//                         IFSPurchLines.Validate("Shortcut Dimension 2 Code", PurchLines."Shortcut Dimension 2 Code");
//                         IFSPurchLines.Validate("Variant Code", PurchLines."Variant Code");
//                         IFSPurchLines.Validate("Dimension Set ID", PurchLines."Dimension Set ID");
//                         IFSPurchLines.Validate("Item Category", PurchLines."Item Category Code");
//                         IFSPurchLines.Validate("Directorate Code", PurchLines."Directorate Code");
//                         //MESSAGE('"Directorate Code" %1',Purch."Directorate Code");
//                         IFSPurchLines.Validate("Department Code", PurchLines."Department Code");
//                         IFSPurchLines.Validate("Procurement Plan ID", PurchLines."Procurement Plan ID");
//                         IFSPurchLines."Procurement Plan Entry No" := PurchLines."Procurement Plan Entry No";
//                         IFSPurchLines.Validate("Job No.", PurchLines."Job No.");
//                         IFSPurchLines.Validate("Job Task No.", PurchLines."Job Task No.");
//                         IFSPurchLines.Validate("PP Planning Category", PurchLines."PP Planning Category");
//                         IFSPurchLines.Validate("PP Funding Source ID", PurchLines."PP Funding Source ID");
//                         IFSPurchLines.Validate("PP Total Budget", PurchLines."PP Total Budget");
//                         IFSPurchLines.Validate("Technical Specifications", PurchLines."Technical Specifications");
//                         IFSPurchLines.Validate("PP Total Actual Costs", PurchLines."PP Total Actual Costs");
//                         IFSPurchLines.Validate("PP Total Commitments", PurchLines."PP Total Commitments");
//                         IFSPurchLines.Validate("PP Total Available Budget", PurchLines."PP Total Available Budget");
//                         IFSPurchLines.Validate("PP Preference/Reservation Code", PurchLines."PP Preference/Reservation Code");
//                         IFSPurchLines.Insert(true);
//                     until PurchLines.Next = 0;
//                 end;

//                 //3.IFS Major Work Deliverables table-Default values shall be inherited from the PRN Major Work Deliverable table
//                 PRNMajorWorkDeliverable.Reset;
//                 PRNMajorWorkDeliverable.SetRange("Document No.", Purch."No.");
//                 if PRNMajorWorkDeliverable.FindSet then begin
//                     repeat
//                         IFSMajorWorkDeliverable.Init;
//                         IFSMajorWorkDeliverable.Validate("Document No", IFS.Code);
//                         IFSMajorWorkDeliverable.Validate("Entry No", PRNMajorWorkDeliverable."Entry No");
//                         IFSMajorWorkDeliverable.Validate("Major Activity Description", PRNMajorWorkDeliverable.Description);
//                         IFSMajorWorkDeliverable.Insert(true);
//                     until PRNMajorWorkDeliverable.Next = 0;
//                 end;

//                 //4.IFS Key Staff table-Default values shall be inherited from the PRN Personnel Specification IFS Key Staff Table FieldsMapping Rules
//                 PRNPersonnelSpecification.Reset;
//                 PRNPersonnelSpecification.SetRange("Document No.", Purch."No.");
//                 if PRNPersonnelSpecification.FindSet then begin
//                     repeat
//                         IFSKeyStaff.Init;
//                         IFSKeyStaff."IFS Code" := IFS.Code;
//                         IFSKeyStaff."Staff Role Code" := PRNPersonnelSpecification."Staff Role Code";
//                         IFSKeyStaff."Title/Designation Description" := PRNPersonnelSpecification."Title/Designation Description";
//                         IFSKeyStaff."Staff Category" := PRNPersonnelSpecification."Staff Category";
//                         IFSKeyStaff."Min No. of Recomm Staff" := PRNPersonnelSpecification."Min No. of Recomm Staff";
//                         IFSKeyStaff.Insert(true);
//                     until PRNPersonnelSpecification.Next = 0;
//                 end;

//                 //5.IFS Staff Min Qualification-Default values shall be inherited from the PRN Personnel Qualification
//                 PRNStaffQualification.Reset;
//                 PRNStaffQualification.SetRange("Document No.", Purch."No.");
//                 if PRNStaffQualification.FindSet then begin
//                     repeat
//                         IFSStaffQualification.Init;
//                         IFSStaffQualification."IFS Code" := IFS.Code;
//                         IFSStaffQualification."Project Role Code" := PRNStaffQualification."Staff Role Code";
//                         IFSStaffQualification."Entry No" := PRNStaffQualification."Entry No";
//                         IFSStaffQualification."Qualification Category" := PRNStaffQualification."Qualification Category";
//                         IFSStaffQualification."Minimum Qualification Req" := PRNStaffQualification."Minimum Qualification Req";
//                         IFSStaffQualification.Insert(true);
//                     until PRNStaffQualification.Next = 0;
//                 end;

//                 //6.IFS Staff Min Experience -Default values shall be inherited from the PRN Personnel Experience
//                 PRNPersonnelExperience.Reset;
//                 PRNPersonnelExperience.SetRange("Document No.", Purch."No.");
//                 if PRNPersonnelExperience.FindSet then begin
//                     repeat
//                         IFSPersonnelExperience.Init;
//                         IFSPersonnelExperience."IFS Code" := IFS.Code;
//                         IFSPersonnelExperience."Project Role Code" := PRNPersonnelExperience."Staff Role Code";
//                         IFSPersonnelExperience."Experience Category" := PRNPersonnelExperience."Experience Category";
//                         IFSPersonnelExperience."Entry No" := PRNPersonnelExperience."Entry No";
//                         IFSPersonnelExperience."Minimum Years of Experience" := PRNPersonnelExperience."Minimum Years of Experience";
//                         IFSPersonnelExperience."Minimum Experience Req" := PRNPersonnelExperience."Minimum Experience Req";
//                         IFSPersonnelExperience.Insert(true);

//                     until PRNPersonnelExperience.Next = 0;
//                 end;

//                 //7.IFS Required Equipment- Default values shall be inherited from the PRN Equipment Specification
//                 PRNEquipmentsSpecification.Reset;
//                 PRNEquipmentsSpecification.SetRange("Document No.", Purch."No.");
//                 if PRNEquipmentsSpecification.FindSet then begin
//                     repeat

//                         IFSEquipmentsSpecification.Init;
//                         IFSEquipmentsSpecification."Document No" := IFS.Code;
//                         IFSEquipmentsSpecification."Equipment Type Code" := PRNEquipmentsSpecification."Equipment Type";
//                         IFSEquipmentsSpecification.Category := PRNEquipmentsSpecification.Category;
//                         IFSEquipmentsSpecification.Description := PRNEquipmentsSpecification.Description;
//                         IFSEquipmentsSpecification."Minimum Required Qty" := PRNEquipmentsSpecification."Minimum Required Qty";
//                         IFSEquipmentsSpecification.Insert(true);
//                     until PRNEquipmentsSpecification.Next = 0;
//                 end;
//             end;
//             Message('Purchase Requisition No: %1 has successfully been converted to Invitation Notice No: %2. Please check', Purch."No.", IFS.Code);
//             // if IFS."Procurement Method" = IFS."procurement method"::"Open Tender" then begin
//             //     Page.Run(75078, IFS);
//             // end;
//             // if IFS."Procurement Method" = IFS."procurement method"::RFQ then begin
//             //     Page.Run(75121, IFS);
//             // end;
//             Purch."Ordered PRN" := true;
//             Purch."PRN Order Date/Time" := CurrentDatetime;
//             Purch."Linked IFS No." := IFS.Code;
//             Purch.Modify(true);
//             //Back Email Notification to requestor.
//             // EmailNotification.SendPRNApprovedMailAfterIFSCreation(Purch);

//         end;
//     end;
// }

