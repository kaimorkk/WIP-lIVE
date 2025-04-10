codeunit 70111 procurementQueries
{
    trigger OnRun()
    begin


    end;

    var
        tbl_standardPurchaseCode: Record "Standard Purchase Code";
        tbl_requestForInformation: Record "Request For Information";
        tbl_standardVendorPurchaseCode: Record "Standard Vendor Purchase Code";
        tbl_tenderSourceDocument: Record "Tender Document Source";
        // tbl_calendarYearCodeList: Record "Calendar Year Code";
        // tbl_workEquipmentType: Record "Works Equipment Type";
        tbl_purchaseHeader: Record "Purchase Header";
        tbl_job: Record Job;
        tbl_tenderSecurityTypes: Record "Tender Security Types";
        tbl_projectRoleCode: Record "Project Role Code";
        tbl_rfiCategoryRequirement: Record "RFI Category Requirement";
        tbl_ifpResponseLineRC: Record "IFP Response Line RC";
        tbl_ifpResponseLine: Record "IFP Response Line";
        tbl_countries: Record "Country/Region";
        tbl_bidScoreRequirement: Record "Bid Score Requirement";
        tbl_ifsRequiredEquipment: Record "IFS Required Equipment";
        tbl_ifsKeyStaff: Record "IFS Key Staff";
        tbl_ifsRequiredDocument: Record "IFS Required Document";
        tbl_standardpurchaseLine: Record "Standard Purchase Line";
        // tbl_contractRequirements: Record "Contract Issuance Requirements";
        tbl_ifsSecurity: Record "IFS Securities";
        tbl_tenderAddedNotice: Record "Tender Addendum Notice";
        tbl_rfiResponse: Record "RFI Response";
        tbl_purchaseLine: Record "Purchase Line";
        tbl_rfiResponseFiledDocument: Record "RFI Response Filed Document";
        tbl_vendorLedgerEntry: Record "Vendor Ledger Entry";
        tbl_vendorFiledRegDocument: Record "Vendor Filed Reg Document";
        tbl_bidFiledDocument: Record "Bid Filed Document";
        tbl_rfiRequiredDocument: Record "RFI Required Document";
        tbl_procurementSetup: Record "Procurement Setup";
        tbl_procurementDocTemplateLine: Record "Procurement Doc Template Line";
        tbl_vendorProfessionalStaff: Record "Vendor Professional Staff";
        tbl_bidKeyStaffQualification: Record "Bid Key Staff Qualification";
        tbl_bidKeyStaffExperience: Record "Bid Key Staff Experience";
        tbl_vendorBankAccount: Record "Vendor Bank Account";
        tbl_vendorBeneficiaries: Record "Vendor Beneficiaries";
        tbl_vendorBusinessOwner: Record "Vendor Business Owner";
        tbl_vendorLitigationHistory: Record "Vendor Litigation History";
        tbl_vendorPastExperience: Record "Vendor Past Experience";
        tbl_bidEquipmentSpecification: Record "Bid Equipment Specification";
        tbl_bidPastExperience: Record "Bid Past Experience";
        tbl_bidContractSecurityRegister: Record "Bid_Contract Security Register";
        tbl_bidAuditedIncomeStatement: Record "Bid Audited Income Statement";
        tbl_bidAuditedBalanceSheet: Record "Bid Audited Balance Sheet";
        tbl_vendorAuditedBalanceSheet: Record "Vendor Audited Balance Sheet";
        tbl_vendorAuditedIncome: Record "Vendor Audited Income Statemen";
        btl_bidScoreRequirement: Record "Bid Score Requirement";
        tbl_tenderAddednumAmendment: Record "Tender Addendum Amendment";
        tbl_vendor: Record Vendor;
        tbl_rfiPrequalificationCategory: Record "RFI Prequalification Category";
        tbl_vendorPrequalificationEntry: Record "Vendor Prequalification Entry";
        tbl_companySizeCodes: Record "Company Size Code";
        tbl_postCodes: Record "Post Code";
        tbl_responsibilityCenter: Record "Responsibility Center";
        // tbl_employeeBankAccount: Record "Employee Bank AccountX";
        // tbl_insuranceGuaranteeHeader: Record "Insurance/Guarantee Header";
        tbl_vendorDepartmentEntry: Record "Vendor Debarment Entry";
        tbl_language: Record Language;
        tbl_specialGroupCategory: Record "Special Vendor Category";
        tbl_supplierCategory: Record "Supplier Category";
        tbl_industryGroup: Record "Industry Group";
        tbl_businessType: Record "Business Types";
        // tbl_bankList: Record "Bank list";
        tbl_currency: Record Currency;
        // tbl_regions: Record County1;
        tbl_supplierRegistrationPeriods: Record "Supplier Registration Periods";
        tbl_dynasoftPortalUser: Record "Dynasoft Portal User";
        tbl_jobTasks: Record "Job Task";
        // tbl_WEPContractorTeam: record "WEP Contractor Team";
        // tbl_WEPContractorEquipment: Record "WEP Contractor Equipment";
        // tbl_WEPExecutionSchedule: Record "WEP Execution Schedule";
        // tbl_projectMobilizationHeader: Record "Project Mobilization Header";
        // tbl_staffRoleCode: Record "Project Staff Role Code";
        tbl_jobPlanningLines: Record "Job Planning Line";
        // tbl_pcoRequiredDocument: Record "PCO Required Document";
        // tbl_pcoPlannedMeeting: Record "PCO Planned Meeting";
        // tbl_pcoInternalProjectTeam: Record "PCO Internal Project Team";
        // tbl_roadInventory: Record "Road Inventory";
        // tbl_pavementSurfaceEntry: Record "Pavement Surface Entry";
        // tbl_roadSections: Record "Road Section";
        // tbl_roadEnvironEntry: Record "Road Environ Entry";
        // tbl_measurements: Record "Measurement &  Payment Header";
        tbl_bidScoringTemplate: Record "Bid Scoring Template";
        tbl_bidLitigationHistory: Record "Bid Litigation History";
        tbl_bidKeyStaff: Record "Bid Key Staff";
    // tbl_employeeBankList: Record "Employee Bank AccountX";

    procedure fnGetInviteTender(vendorNumber: Code[20]) data: Text
    begin
        if vendorNumber = '' then begin
            tbl_standardPurchaseCode.Reset();
            // tbl_standardPurchaseCode.SetRange(Published, true);
            // tbl_standardPurchaseCode.SetRange("Document Status", tbl_standardPurchaseCode."Document Status"::Published);
            // if tbl_standardPurchaseCode.FindSet(true) then
            //, 0, '<Month,1>/<Day,2>/<Year4>'
            repeat
                data += tbl_standardPurchaseCode.Code + '*' + Format(tbl_standardPurchaseCode."Solicitation Type") + '*' + tbl_standardPurchaseCode."External Document No" + '*' + Format(tbl_standardPurchaseCode."Procurement Type") + '*' + tbl_standardPurchaseCode."Procurement Category ID" + '*' + tbl_standardPurchaseCode."Project ID" + '*' + tbl_standardPurchaseCode."Tender Name" + '*' + tbl_standardPurchaseCode."Tender Summary" + '*' + tbl_standardPurchaseCode.Description + '*' + Format(tbl_standardPurchaseCode."Document Date") + '*' + Format(tbl_standardPurchaseCode.Status) + '*' + tbl_standardPurchaseCode.Name + '*' + FORMAT(tbl_standardPurchaseCode."Submission End Date") + '*' + Format(tbl_standardPurchaseCode."Submission Start Date") + '*' + Format(tbl_standardPurchaseCode."Procurement Method") + '*' + Format(tbl_standardPurchaseCode."Target Bidder Group") + '*' + Format(tbl_standardPurchaseCode."Bid Scoring Template") + '*' + Format(tbl_standardPurchaseCode."Document Status") + '*' + Format(tbl_standardPurchaseCode."Invitation Notice Type") + '*' + Format(tbl_standardPurchaseCode."Responsibility Center") + '*' + Format(tbl_standardPurchaseCode."Tender Validity Duration") + '*' + Format(tbl_standardPurchaseCode."Tender Validity Expiry Date") + '*' + Format(tbl_standardPurchaseCode."Bid Selection Method") + '*' + Format(tbl_standardPurchaseCode."Location Code") + '*' + Format(tbl_standardPurchaseCode."Requisition Product Group") + '*' + Format(tbl_standardPurchaseCode."Language Code") + '*' + Format(tbl_standardPurchaseCode."PP Preference/Reservation Code") + '*' + '' + '*' + Format(tbl_standardPurchaseCode."Lot No.") + '*' + Format(tbl_standardPurchaseCode."Submission End Time") + '*' + Format(tbl_standardPurchaseCode."Created Date/Time") + '*' + Format(tbl_standardPurchaseCode."Mandatory Pre-bid Visit Date") + '*' + Format(tbl_standardPurchaseCode."Mandatory Special Group Reserv") + '*' + Format(tbl_standardPurchaseCode."Prebid Meeting Address") + '*' + Format(tbl_standardPurchaseCode."Phone No.") + '*' + Format(tbl_standardPurchaseCode."Bid Opening Time") + '*' + Format(tbl_standardPurchaseCode."Procuring Entity Name/Contact") + '*' + Format(tbl_standardPurchaseCode."Bid/Tender Security Required") + '*' + Format(tbl_standardPurchaseCode."Primary Tender Submission") + '*' + Format(tbl_standardPurchaseCode."Appointer of Bid Arbitrator") + '*' + Format(tbl_standardPurchaseCode."Bid Envelop Type") + '*' + Format(tbl_standardPurchaseCode."Bid Security Expiry Date") + '*' + Format(tbl_standardPurchaseCode."Bid Opening Date") + '*' + Format(tbl_standardPurchaseCode."Sealed Bids") + '*' + Format(tbl_standardPurchaseCode.Address) + '*' + Format(tbl_standardPurchaseCode."Post Code") + '*' + Format(tbl_standardPurchaseCode.City) + '*' + Format(tbl_standardPurchaseCode."Country/Region Code") + '*' + Format(tbl_standardPurchaseCode."Tender Box Location Code") + '*' + Format(tbl_standardPurchaseCode."Bid Opening Venue") + '*' + Format(tbl_standardPurchaseCode."Bank Account Name") + '*' + Format(tbl_standardPurchaseCode."Bid Charge Bank Code") + '*' + Format(tbl_standardPurchaseCode."Bid Charge Bank Branch") + '*' + Format(tbl_standardPurchaseCode."Address 2") + '*' + Format(tbl_standardPurchaseCode."Advance Payment Security %") + '*' + Format(tbl_standardPurchaseCode."Bid Charge Code") + '*' + Format(tbl_standardPurchaseCode."Bid Charge (LCY)") + '*' + Format(tbl_standardPurchaseCode."Bank Name") + '*' + Format(tbl_standardPurchaseCode."Bid Charge Bank A/C No") + '*' + Format(tbl_standardPurchaseCode."Bid Security %") + '*' + Format(tbl_standardPurchaseCode."Performance Security %") + '*' + Format(tbl_standardPurchaseCode."Bid Security Amount (LCY)") + '*' + Format(tbl_standardPurchaseCode."Advance Amount Limit %") + '*' + Format(tbl_standardPurchaseCode."Advance Payment Security Req") + '*' + Format(tbl_standardPurchaseCode."Bid Security Validity Duration") + '*' + Format(tbl_standardPurchaseCode."Insurance Cover Required") + '::::';
            until tbl_standardPurchaseCode.Next = 0;
            exit(data);
        end else begin
            tbl_standardPurchaseCode.Reset();
            tbl_standardPurchaseCode.SetRange(Published, true);
            // get single tender details
            tbl_standardPurchaseCode.SetRange(code, vendorNumber);
            tbl_standardPurchaseCode.SetRange("Document Status", tbl_standardPurchaseCode."Document Status"::Published);
            if tbl_standardPurchaseCode.FindSet(true) then
                repeat
                    data += tbl_standardPurchaseCode.Code + '*' + Format(tbl_standardPurchaseCode."Solicitation Type") + '*' + tbl_standardPurchaseCode."External Document No" + '*' + Format(tbl_standardPurchaseCode."Procurement Type") + '*' + tbl_standardPurchaseCode."Procurement Category ID" + '*' + tbl_standardPurchaseCode."Project ID" + '*' + tbl_standardPurchaseCode."Tender Name" + '*' + tbl_standardPurchaseCode."Tender Summary" + '*' + tbl_standardPurchaseCode.Description + '*' + Format(tbl_standardPurchaseCode."Document Date") + '*' + Format(tbl_standardPurchaseCode.Status) + '*' + tbl_standardPurchaseCode.Name + '*' + Format(tbl_standardPurchaseCode."Submission End Date") + '*' + Format(tbl_standardPurchaseCode."Submission Start Date") + '*' + Format(tbl_standardPurchaseCode."Procurement Method") + '*' + Format(tbl_standardPurchaseCode."Target Bidder Group") + '*' + Format(tbl_standardPurchaseCode."Bid Scoring Template") + '*' + Format(tbl_standardPurchaseCode."Document Status") + '*' + Format(tbl_standardPurchaseCode."Invitation Notice Type") + '*' + Format(tbl_standardPurchaseCode."Responsibility Center") + '*' + Format(tbl_standardPurchaseCode."Tender Validity Duration") + '*' + Format(tbl_standardPurchaseCode."Tender Validity Expiry Date") + '*' + Format(tbl_standardPurchaseCode."Bid Selection Method") + '*' + Format(tbl_standardPurchaseCode."Location Code") + '*' + Format(tbl_standardPurchaseCode."Requisition Product Group") + '*' + Format(tbl_standardPurchaseCode."Language Code") + '*' + Format(tbl_standardPurchaseCode."PP Preference/Reservation Code") + '*' + '' + '*' + Format(tbl_standardPurchaseCode."Lot No.") + '*' + Format(tbl_standardPurchaseCode."Submission End Time") + '*' + Format(tbl_standardPurchaseCode."Created Date/Time") + '*' + Format(tbl_standardPurchaseCode."Mandatory Pre-bid Visit Date") + '*' + Format(tbl_standardPurchaseCode."Mandatory Special Group Reserv") + '*' + Format(tbl_standardPurchaseCode."Prebid Meeting Address") + '*' + Format(tbl_standardPurchaseCode."Phone No.") + '*' + Format(tbl_standardPurchaseCode."Bid Opening Time") + '*' + Format(tbl_standardPurchaseCode."Procuring Entity Name/Contact") + '*' + Format(tbl_standardPurchaseCode."Bid/Tender Security Required") + '*' + Format(tbl_standardPurchaseCode."Primary Tender Submission") + '*' + Format(tbl_standardPurchaseCode."Appointer of Bid Arbitrator") + '*' + Format(tbl_standardPurchaseCode."Bid Envelop Type") + '*' + Format(tbl_standardPurchaseCode."Bid Security Expiry Date") + '*' + Format(tbl_standardPurchaseCode."Bid Opening Date") + '*' + Format(tbl_standardPurchaseCode."Sealed Bids") + '*' + Format(tbl_standardPurchaseCode.Address) + '*' + Format(tbl_standardPurchaseCode."Post Code") + '*' + Format(tbl_standardPurchaseCode.City) + '*' + Format(tbl_standardPurchaseCode."Country/Region Code") + '*' + Format(tbl_standardPurchaseCode."Tender Box Location Code") + '*' + Format(tbl_standardPurchaseCode."Bid Opening Venue") + '*' + Format(tbl_standardPurchaseCode."Bank Account Name") + '*' + Format(tbl_standardPurchaseCode."Bid Charge Bank Code") + '*' + Format(tbl_standardPurchaseCode."Bid Charge Bank Branch") + '*' + Format(tbl_standardPurchaseCode."Address 2") + '*' + Format(tbl_standardPurchaseCode."Advance Payment Security %") + '*' + Format(tbl_standardPurchaseCode."Bid Charge Code") + '*' + Format(tbl_standardPurchaseCode."Bid Charge (LCY)") + '*' + Format(tbl_standardPurchaseCode."Bank Name") + '*' + Format(tbl_standardPurchaseCode."Bid Charge Bank A/C No") + '*' + Format(tbl_standardPurchaseCode."Bid Security %") + '*' + Format(tbl_standardPurchaseCode."Performance Security %") + '*' + Format(tbl_standardPurchaseCode."Bid Security Amount (LCY)") + '*' + Format(tbl_standardPurchaseCode."Advance Amount Limit %") + '*' + Format(tbl_standardPurchaseCode."Advance Payment Security Req") + '*' + Format(tbl_standardPurchaseCode."Bid Security Validity Duration") + '*' + Format(tbl_standardPurchaseCode."Insurance Cover Required") + '::::';
                until tbl_standardPurchaseCode.Next = 0;
            exit(data);
        end;


    end;

    procedure fnGetInvitationForPrequalification() data: Text
    begin
        tbl_requestForInformation.Reset();
        tbl_requestForInformation.SetRange(Published, true);
        tbl_requestForInformation.SetRange("RFI Document Status", tbl_requestForInformation."RFI Document Status"::Published);
        tbl_requestForInformation.SetRange(Status, tbl_requestForInformation.Status::Released);
        // tbl_requestForInformation.SetRange(Type, tbl_requestForInformation.Type::"Sub IFP");
        if tbl_requestForInformation.FindSet(true) then begin
            repeat
                data += Format(tbl_requestForInformation."Submission End Date") + '*' + tbl_requestForInformation.Code + '*' + tbl_requestForInformation.Description + '*' + tbl_requestForInformation."Tender Summary" + '*' + tbl_requestForInformation."External Document No" + '*' + tbl_requestForInformation."Procurement Type" + '*' + tbl_requestForInformation.Name + '*' + Format(tbl_requestForInformation."Submission Start Date") + '*' + Format(tbl_requestForInformation."Submission Start Time") + '*' + Format(tbl_requestForInformation."Document Date") + '*' + Format(tbl_requestForInformation.Status) + '*' + Format(tbl_requestForInformation."RFI Document Status") + '*' + Format(tbl_requestForInformation."Document Type") + '*' + /*Format(tbl_requestForInformation."Responsibility Centre")*/'' + '*' + Format(tbl_requestForInformation."RFI Scoring Template") + '*' + '::::';
            until tbl_requestForInformation.Next = 0;
        end;
        exit(data);
    end;

    procedure fnGetStandardPurchaseLine(documentNumber: Code[30]) data: Text
    begin
        tbl_standardpurchaseLine.Reset();
        tbl_standardpurchaseLine.SetRange("Standard Purchase Code", documentNumber);
        if tbl_standardpurchaseLine.FindSet(true) then begin
            repeat
                data += tbl_standardpurchaseLine."Standard Purchase Code" + '*' + Format(tbl_standardpurchaseLine."Line No.") + '*' + Format(tbl_standardpurchaseLine.Type) + '*' + Format(tbl_standardpurchaseLine."No.") + '*' + tbl_standardpurchaseLine.Description + '*' + Format(tbl_standardpurchaseLine.Quantity) + '*' + Format(tbl_standardpurchaseLine."Amount Excl. VAT") + '*' + tbl_standardpurchaseLine."Item Category" + '*' + Format(tbl_standardpurchaseLine."Unit of Measure Code") + ':';
            until tbl_standardpurchaseLine.Next = 0;
        end;
        exit(data);

    end;

    procedure fnGetContractRequirements(tenderNumber: Code[30]) data: Text
    begin
        // tbl_contractRequirements.Reset();
        // tbl_contractRequirements.SetRange("Document ID", tenderNumber);
        // if tbl_contractRequirements.FindSet(true) then begin
        //     repeat
        //         data += Format(tbl_contractRequirements."Document ID") + '*' + Format(tbl_contractRequirements."Procurement Document Type") + '*' + tbl_contractRequirements.Description + '*' + Format(tbl_contractRequirements."Track Certificate Expiry") + '*' + Format(tbl_contractRequirements."PRN No") + '*' + tbl_contractRequirements."IFS Code" + '*' + Format(tbl_contractRequirements."Process Area") + '*' + Format(tbl_contractRequirements."Guidelines/Instruction") + '*' + Format(tbl_contractRequirements."Requirement Type") + '*' + Format(tbl_contractRequirements."Document Link") + '::::';

        //     until tbl_contractRequirements.Next = 0;
        // end;
        exit(data);
    end;

    procedure fnGetIFSKeyStaff(documentNumber: Code[30]) data: Text
    begin
        tbl_ifsKeyStaff.Reset();
        tbl_ifsKeyStaff.SetRange("IFS Code", documentNumber);
        if tbl_ifsKeyStaff.FindSet(true) then begin
            repeat
                data += Format(tbl_ifsKeyStaff."Staff Role Code") + '*' + Format(tbl_ifsKeyStaff."Title/Designation Description") + '*' + Format(tbl_ifsKeyStaff."Min No. of Recomm Staff") + '*' + Format(tbl_ifsKeyStaff."Requirement Type") + '*' + Format(tbl_ifsKeyStaff."Staff Category") + ':';
            until tbl_ifsKeyStaff.Next = 0;
        end;
    end;

    procedure fnGetIFSSecurity(ifsCode: Code[20]) data: Text
    begin
        tbl_ifsSecurity.Reset();
        tbl_ifsSecurity.SetRange("IFS Code", ifsCode);
        if tbl_ifsSecurity.FindSet(true) then begin
            repeat
                data += Format(tbl_ifsSecurity."Form of Security") + '*' + Format(tbl_ifsSecurity."Security Type") + '*' + Format(tbl_ifsSecurity."Required at Bid Submission") + '*' + tbl_ifsSecurity.Description + '*' + Format(tbl_ifsSecurity."Security Amount (LCY)") + '*' + Format(tbl_ifsSecurity."Bid Security Validity Expiry") + '*' + Format(tbl_ifsSecurity."Nature of Security") + ':';
            until tbl_ifsSecurity.Next = 0;
        end;
        exit(data);

    end;

    procedure fnGetTenderAddedNotice(tenderNo: Code[30]) data: Text
    begin
        tbl_tenderAddedNotice.Reset();
        if tenderNo = '' then begin
            repeat
                data += tbl_tenderAddedNotice."Addendum Notice No." + '*' + tbl_tenderAddedNotice."Invitation Notice No." + '*' + Format(tbl_tenderAddedNotice."Document Date") + '*' + tbl_tenderAddedNotice."Addendum Instructions" + '*' + tbl_tenderAddedNotice."Primary Addendum Type ID" + '*' + tbl_tenderAddedNotice."Addendum Type Description" + '*' + tbl_tenderAddedNotice.Description + '*' + tbl_tenderAddedNotice."Tender Description" + '*' + Format(tbl_tenderAddedNotice."Responsibility Center") + '*' + Format(tbl_tenderAddedNotice."New Submission Start Date") + '*' + Format(tbl_tenderAddedNotice.Status) + '*' + Format(tbl_tenderAddedNotice."Original Submission Start Date") + '*' + Format(tbl_tenderAddedNotice."Original Bid Opening Date") + '*' + Format(tbl_tenderAddedNotice."New Bid Opening Date") + '*' + Format(tbl_tenderAddedNotice."Original Bid Opening Time") + '*' + Format(tbl_tenderAddedNotice."Original Prebid Meeting Date") + '*' + Format(tbl_tenderAddedNotice."New Prebid Meeting Date") + '*' + Format(tbl_tenderAddedNotice."Original Bid Opening Date") + '*' + Format(tbl_tenderAddedNotice."Tender No") + '*' + Format(tbl_tenderAddedNotice."New Submission End Time") + '*' + Format(tbl_tenderAddedNotice."Original Bid Opening Time") + '*' + Format(tbl_tenderAddedNotice."Original Submission End Date") + '*' + Format(tbl_tenderAddedNotice."Document Status") + '*' + Format(tbl_tenderAddedNotice."New Submission End Date") + '*' + Format(tbl_tenderAddedNotice."New Bid Opening Time") + '*' + Format(tbl_tenderAddedNotice."Original Submission End Time") + '::::';
            until tbl_tenderAddedNotice.Next = 0;
            exit(data);
        end
        else begin
            tbl_tenderAddedNotice.SetRange("Invitation Notice No.", tenderNo);
            if tbl_tenderAddedNotice.FindSet(true) then begin
                repeat
                    data += tbl_tenderAddedNotice."Addendum Notice No." + '*' + tbl_tenderAddedNotice."Invitation Notice No." + '*' + Format(tbl_tenderAddedNotice."Document Date") + '*' + tbl_tenderAddedNotice."Addendum Instructions" + '*' + tbl_tenderAddedNotice."Primary Addendum Type ID" + '*' + tbl_tenderAddedNotice."Addendum Type Description" + '*' + tbl_tenderAddedNotice.Description + '*' + tbl_tenderAddedNotice."Tender Description" + '*' + Format(tbl_tenderAddedNotice."Responsibility Center") + '*' + Format(tbl_tenderAddedNotice."New Submission Start Date") + '*' + Format(tbl_tenderAddedNotice.Status) + '*' + Format(tbl_tenderAddedNotice."Original Submission Start Date") + '*' + Format(tbl_tenderAddedNotice."Original Bid Opening Date") + '*' + Format(tbl_tenderAddedNotice."New Bid Opening Date") + '*' + Format(tbl_tenderAddedNotice."Original Bid Opening Time") + '*' + Format(tbl_tenderAddedNotice."Original Prebid Meeting Date") + '*' + Format(tbl_tenderAddedNotice."New Prebid Meeting Date") + '*' + Format(tbl_tenderAddedNotice."Original Bid Opening Date") + '*' + Format(tbl_tenderAddedNotice."Tender No") + '*' + Format(tbl_tenderAddedNotice."New Submission End Time") + '*' + Format(tbl_tenderAddedNotice."Original Bid Opening Time") + '*' + Format(tbl_tenderAddedNotice."Original Submission End Date") + '*' + Format(tbl_tenderAddedNotice."Document Status") + '*' + Format(tbl_tenderAddedNotice."New Submission End Date") + '*' + Format(tbl_tenderAddedNotice."New Bid Opening Time") + '*' + Format(tbl_tenderAddedNotice."Original Submission End Time") + '::::';
                until tbl_tenderAddedNotice.Next = 0;
            end;
            exit(data);
        end;


    end;

    procedure fnGetInvitationPrequalification(documentType: Text) data: Text
    begin
        if documentType = 'Invitation For Prequalification' then begin
            tbl_requestForInformation.Reset();
            tbl_requestForInformation.SetRange("Document Type", tbl_requestForInformation."Document Type"::"Invitation For Prequalification");
            tbl_requestForInformation.SetRange(Published, true);
            tbl_requestForInformation.SetRange(Status, tbl_requestForInformation.Status::Released);
            if tbl_requestForInformation.FindSet(true) then begin
                repeat
                    data += tbl_requestForInformation.Code + '*' + tbl_requestForInformation.Description + '*' + tbl_requestForInformation."Tender Box Location Code" + '*' + tbl_requestForInformation."External Document No" + '*' + tbl_requestForInformation."Tender Summary" + '*' + Format(tbl_requestForInformation."Submission End Date") + '*' + Format(tbl_requestForInformation."Submission Start Date") + '*' + tbl_requestForInformation.Address + '*' + Format(tbl_requestForInformation."Primary Target Vendor Cluster") + '*' + Format(tbl_requestForInformation."Address 2") + '*' + Format(tbl_requestForInformation."Document Date") + '*' + Format(tbl_requestForInformation."Period End Date") + '*' + Format(tbl_requestForInformation."Period Start Date") + '*' + /*Format(tbl_requestForInformation."Responsibility Centre")*/ '' + '*' + /*tbl_requestForInformation.Constituency*/'' + ':';
                until tbl_requestForInformation.Next = 0
            end;
            exit(data);
        end else
            if documentType = 'Invitation for Registation' then begin
                tbl_requestForInformation.Reset();
                // tbl_requestForInformation.SetRange("Document Type", tbl_requestForInformation."Document Type"::"Invitation for Registation");
                tbl_requestForInformation.SetRange(Published, true);
                tbl_requestForInformation.SetRange(Status, tbl_requestForInformation.Status::Released);
                if tbl_requestForInformation.FindSet(true) then begin
                    repeat
                        data += tbl_requestForInformation.Code + '*' + tbl_requestForInformation.Description + '*' + tbl_requestForInformation."Tender Box Location Code" + '*' + tbl_requestForInformation."External Document No" + '*' + tbl_requestForInformation."Tender Summary" + '*' + Format(tbl_requestForInformation."Submission End Date") + '*' + Format(tbl_requestForInformation."Submission Start Date") + '*' + tbl_requestForInformation.Address + '*' + Format(tbl_requestForInformation."Primary Target Vendor Cluster") + '*' + Format(tbl_requestForInformation."Address 2") + '*' + Format(tbl_requestForInformation."Document Date") + '*' + Format(tbl_requestForInformation."Period End Date") + '*' + Format(tbl_requestForInformation."Period Start Date") + '*' +/*Format(tbl_requestForInformation."Responsibility Centre")*/ '' + '*' + /*tbl_requestForInformation.Constituency*/'' + ':';
                    until tbl_requestForInformation.Next = 0
                end;
                exit(data);
            end;

    end;

    procedure fnGetRFIResponse(vendorNumber: Code[20]; documentNumber: Code[20]) data: Text
    begin
        tbl_rfiResponse.Reset();
        if documentNumber = '' then begin
            tbl_rfiResponse.SetRange("Vendor No.", vendorNumber);
            if tbl_rfiResponse.FindSet(true) then begin
                repeat
                    data += Format(tbl_rfiResponse."Created Date") + '*' + Format(tbl_rfiResponse."Created Time") + '*' + Format(tbl_rfiResponse."Date Submitted") + '*' + Format(tbl_rfiResponse."Final Evaluation Score") + '*' + Format(tbl_rfiResponse."Special Group Category") + '*' + Format(tbl_rfiResponse."Special Group Vendor") + '*' + tbl_rfiResponse."E-Mail" + '*' + tbl_rfiResponse."Post Code" + '*' + tbl_rfiResponse."Country/Region Code" + '*' + tbl_rfiResponse.City + '*' + tbl_rfiResponse."Vendor Address" + '*' + tbl_rfiResponse."Vendor Address 2" + '*' + tbl_rfiResponse."Vendor Representative Name" + '*' + tbl_rfiResponse."Vendor Repr Designation" + '*' + tbl_rfiResponse."RFI Document No." + '*' + tbl_rfiResponse."Vendor Name" + '*' + Format(tbl_rfiResponse."Document Date") + '*' + Format(tbl_rfiResponse."Document Type") + '*' + Format(tbl_rfiResponse."Document No.") + ':';
                until tbl_rfiResponse.Next = 0;
            end;
            exit(data);
        end else begin
            tbl_rfiResponse.SetRange("Vendor No.", vendorNumber);
            tbl_rfiResponse.SetRange("Document No.", documentNumber);
            if tbl_rfiResponse.FindSet(true) then begin
                repeat
                    data += Format(tbl_rfiResponse."Created Date") + '*' + Format(tbl_rfiResponse."Created Time") + '*' + Format(tbl_rfiResponse."Date Submitted") + '*' + Format(tbl_rfiResponse."Final Evaluation Score") + '*' + Format(tbl_rfiResponse."Special Group Category") + '*' + Format(tbl_rfiResponse."Special Group Vendor") + '*' + tbl_rfiResponse."E-Mail" + '*' + tbl_rfiResponse."Post Code" + '*' + tbl_rfiResponse."Country/Region Code" + '*' + tbl_rfiResponse.City + '*' + tbl_rfiResponse."Vendor Address" + '*' + tbl_rfiResponse."Vendor Address 2" + '*' + tbl_rfiResponse."Vendor Representative Name" + '*' + tbl_rfiResponse."Vendor Repr Designation" + '*' + tbl_rfiResponse."RFI Document No." + '*' + tbl_rfiResponse."Vendor Name" + '*' + Format(tbl_rfiResponse."Document Date") + '*' + Format(tbl_rfiResponse."Document Type") + '*' + Format(tbl_rfiResponse."Document No.") + ':';
                until tbl_rfiResponse.Next = 0;
            end;
            exit(data);
        end;
    end;

    procedure fnGetInvitationForRFQ(vendorNo: Code[20]) data: Text
    begin
        tbl_standardVendorPurchaseCode.Reset();
        tbl_standardPurchaseCode.Reset();
        //tbl_standardPurchaseCode.SetRange(Published, true);
        tbl_standardVendorPurchaseCode.SetRange("Vendor No.", vendorNo);
        //tbl_standardPurchaseCode.SetRange("Procurement Method", tbl_standardPurchaseCode."Procurement Method"::RFQ);
        //tbl_standardPurchaseCode.SetRange(Status, tbl_standardPurchaseCode.Status::Released);
        if tbl_standardPurchaseCode.FindSet(true) and tbl_standardVendorPurchaseCode.FindSet(true) then begin
            repeat
                data += Format(tbl_standardPurchaseCode."Submission End Date") + '*' + Format(tbl_standardPurchaseCode."Solicitation Type") + '*' + tbl_standardPurchaseCode."External Document No" + '*' + tbl_standardPurchaseCode."Procurement Category ID" + '*' + tbl_standardPurchaseCode."Project ID" + '*' + tbl_standardPurchaseCode."Tender Name" + '*' + tbl_standardPurchaseCode.Code + '*' + tbl_standardPurchaseCode."Tender Summary" + '*' + tbl_standardPurchaseCode.Description + '*' + Format(tbl_standardPurchaseCode.Status) + '*' + Format(tbl_standardPurchaseCode."Submission Start Date") + '*' + Format(tbl_standardPurchaseCode."Procurement Type") + '*' + Format(tbl_standardPurchaseCode."Procurement Method") + '*' + Format(tbl_standardPurchaseCode."Document Date") + '*' + Format(tbl_standardPurchaseCode."Document Status") + ':';
            until tbl_standardVendorPurchaseCode.Next = 0;
        end;
    end;

    procedure fnGetBidResponseDetails(vendorNumber: Code[20]; responseNumber: Code[20]) data: Text
    begin
        tbl_purchaseHeader.Reset();
        tbl_purchaseHeader.SetRange("Vendor No.", vendorNumber);
        tbl_purchaseHeader.SetRange("No.", responseNumber);
        if tbl_purchaseHeader.FindSet(true) then begin
            repeat
                data += tbl_purchaseHeader."Invitation For Supply No" + '*' + tbl_purchaseHeader."Pay-to Name" + '*' + tbl_purchaseHeader."Responsibility Center" + '*' + tbl_purchaseHeader."Tender Description" + '*' + tbl_purchaseHeader."Bidder Representative Name" + '*' + tbl_purchaseHeader."Bidder Representative Desgn" + '*' + tbl_purchaseHeader."Bidder Witness Name" + '*' + tbl_purchaseHeader."VAT Registration No." + '*' + tbl_purchaseHeader."Bidder Witness Designation" + '*' + Format(tbl_purchaseHeader."Bid Charge (LCY)") + '*' + tbl_purchaseHeader."Bidder Witness Address" + '*' + tbl_purchaseHeader."Bid Charge Code" + '*' + tbl_purchaseHeader."Payment Reference No." + '*' + Format(tbl_purchaseHeader."Bidder Type") + '*' + tbl_purchaseHeader."Payment Reference No." + '*' + tbl_purchaseHeader."Joint Venture Partner" + '*' + tbl_purchaseHeader."Tender Document Source" + '*' + Format(tbl_purchaseHeader."Bidder Representative Address") + '*' + Format(tbl_purchaseHeader."Plot No") + '*' + tbl_purchaseHeader."Bankers Name" + '*' + tbl_purchaseHeader."Bankers Branch" + '*' + Format(tbl_purchaseHeader."KNTC Agent") + '*' + Format(tbl_purchaseHeader."Nominal Capital LCY") + '*' + Format(tbl_purchaseHeader."Business Type") + '*' + Format(tbl_purchaseHeader."Issued Capital LCY") + '*' + Format(tbl_purchaseHeader.Status) + '*' + Format(tbl_purchaseHeader."Bidder Representative Address") + '*' + Format(tbl_purchaseHeader."Document Status") + '*' + Format(tbl_purchaseHeader."Posted Direct Income Voucher") + '*' + Format(tbl_purchaseHeader."Pay-to Vendor No.") + '*' + Format(tbl_purchaseHeader."Currency Code") + '*' + Format(tbl_purchaseHeader.Amount) + '*' + Format(tbl_purchaseHeader."Location Code") + '*' + Format(tbl_purchaseHeader."Amount Including VAT") + '*' + Format(tbl_purchaseHeader."Purchaser Code") + '*' + Format(tbl_purchaseHeader."Pay-to Address") + '*' + Format(tbl_purchaseHeader."Pay-to City") + '*' + Format(tbl_purchaseHeader."Pay-to Post Code") + '*' + Format(tbl_purchaseHeader."Pay-to Country/Region Code") + '*' + Format(tbl_purchaseHeader."Pay-to Address 2") + '*' + Format(tbl_purchaseHeader."Language Code") + ':';
            until tbl_purchaseHeader.Next = 0;
            exit(data);
        end;
    end;

    procedure fnGetBidResponseItemLines(vendorNo: Code[20]; responseNumber: Code[20]) data: Text
    begin
        tbl_purchaseLine.Reset();
        tbl_purchaseLine.SetRange("Buy-from Vendor No.", vendorNo);
        tbl_purchaseLine.SetRange("Document No.", responseNumber);
        if tbl_purchaseLine.FindSet(true) then begin
            repeat
                data += tbl_purchaseLine.Description + '*' + tbl_purchaseLine."Location Code" + '*' + Format(tbl_purchaseLine.Quantity) + '*' + Format(tbl_purchaseLine."Direct Unit Cost Inc. VAT") + '*' + Format(tbl_purchaseLine."No.") + '*' + Format(tbl_purchaseLine."Document Type") + '*' + Format(tbl_purchaseLine."Line No.") + '*' + Format(tbl_purchaseLine.Type) + '*' + Format(tbl_purchaseLine."Expected Receipt Date") + '*' + Format(tbl_purchaseLine."Description 2") + '*' + Format(tbl_purchaseLine."Unit of Measure") + '*' + Format(tbl_purchaseLine.Amount) + '*' + Format(tbl_purchaseLine."Amount Including VAT") + '*' + Format(tbl_purchaseLine."Unit Price (LCY)") + '*' + Format(tbl_purchaseLine."VAT %") + '*' + /*Format(tbl_purchaseLine."Contract Type")*/ '' + ':';
            until tbl_purchaseLine.Next = 0;
        end;
        exit(data);
    end;

    procedure fnGetRFIResponseFiledDocument(vendorNo: Code[20]; documentNumber: Code[20]) data: Text
    begin
        tbl_rfiResponseFiledDocument.Reset();
        tbl_rfiResponseFiledDocument.SetRange("Vendor No", vendorNo);
        tbl_rfiResponseFiledDocument.SetRange("Document No", documentNumber);
        if tbl_rfiResponseFiledDocument.FindSet(true) then begin
            repeat
                data += tbl_rfiResponseFiledDocument."Document Description" + '*' + Format(tbl_rfiResponseFiledDocument."Issue Date") + '*' + Format(tbl_rfiResponseFiledDocument."Expiry Date") + '*' + tbl_rfiResponseFiledDocument."Certificate No." + '*' + Format(tbl_rfiResponseFiledDocument."File Extension") + '*' + tbl_rfiResponseFiledDocument."File Name" + '*' + tbl_rfiResponseFiledDocument."File Type" + '*' + Format(tbl_rfiResponseFiledDocument."Procurement Process") + '*' + Format(tbl_rfiResponseFiledDocument."Procurement Document Type ID") + '*' + Format(tbl_rfiResponseFiledDocument."Date Filed") + ':';
            until tbl_rfiResponseFiledDocument.Next = 0;
        end;
        exit(data);
    end;


    procedure fnGetVendorStatement(vendorNumber: Code[30]) data: Text
    begin
        tbl_vendorLedgerEntry.Reset();
        tbl_vendorLedgerEntry.SetRange("Vendor No.", vendorNumber);
        if tbl_vendorLedgerEntry.FindSet(true) then begin
            repeat
                data += Format(tbl_vendorLedgerEntry."Document Type") + '*' + Format(tbl_vendorLedgerEntry."Posting Date") + '*' + tbl_vendorLedgerEntry.Description + '*' + Format(tbl_vendorLedgerEntry."Document No.") + '*' + tbl_vendorLedgerEntry."Vendor Name" + '*' + Format(tbl_vendorLedgerEntry.Amount) + '*' + Format(tbl_vendorLedgerEntry."Remaining Amount") + '*' + Format(tbl_vendorLedgerEntry."Amount (LCY)") + '*' + Format(tbl_vendorLedgerEntry."Bal. Account No.") + '*' + Format(tbl_vendorLedgerEntry."Bal. Account Type") + '*' + Format(tbl_vendorLedgerEntry."Transaction No.") + '*' + Format(tbl_vendorLedgerEntry."Debit Amount (LCY)") + '*' + Format(tbl_vendorLedgerEntry."Credit Amount (LCY)") + '*' + Format(tbl_vendorLedgerEntry."Document Date") + '*' + Format(tbl_vendorLedgerEntry."External Document No.") + '*' + Format(tbl_vendorLedgerEntry."Remaining Amt. (LCY)") + ':';
            until tbl_vendorLedgerEntry.Next = 0;
        end;
        exit(data);

    end;


    procedure fnGetVendorFiledRegDocuments(vendorNumber: Code[30]; procurementProcess: Text) data: Text
    begin
        tbl_vendorFiledRegDocument.Reset();
        if procurementProcess = 'Registration' then begin
            tbl_vendorFiledRegDocument.SetRange("Vendor No", vendorNumber);
            tbl_vendorFiledRegDocument.SetRange("Procurement Process", tbl_vendorFiledRegDocument."Procurement Process"::Registration);
            if tbl_vendorFiledRegDocument.FindSet(true) then begin
                repeat
                    data += Format(tbl_vendorFiledRegDocument."Procurement Document Type ID") + '*' + tbl_vendorFiledRegDocument.Description + '*' + Format(tbl_vendorFiledRegDocument."Date Filed") + '*' + tbl_vendorFiledRegDocument."Certificate No." + '*' + Format(tbl_vendorFiledRegDocument."Issue Date") + '*' + Format(tbl_vendorFiledRegDocument."Expiry Date") + '*' + tbl_vendorFiledRegDocument."File Name" + '*' + tbl_vendorFiledRegDocument."File Type" + '*' + tbl_vendorFiledRegDocument."File Extension" + '*' + Format(tbl_vendorFiledRegDocument."Entry No") + ':';
                until tbl_vendorFiledRegDocument.Next = 0;
            end;
            exit(data);
        end;

    end;

    procedure fnGetBidResponseAttachedDocuments(responseNumber: Code[20]; vendorNumber: Code[20]) data: Text
    begin
        tbl_bidFiledDocument.Reset();
        tbl_bidFiledDocument.SetRange("Vendor No", vendorNumber);
        tbl_bidFiledDocument.SetRange("No.", responseNumber);
        if tbl_bidFiledDocument.FindSet(true) then begin
            repeat
                data += Format(tbl_bidFiledDocument."Procurement Document Type ID") + '*' + Format(tbl_bidFiledDocument."Procurement Process") + '*' + Format(tbl_bidFiledDocument."Entry No") + '*' + tbl_bidFiledDocument.Description + '*' + Format(tbl_bidFiledDocument."Date Filed") + '*' + tbl_bidFiledDocument."Certificate No." + '*' + Format(tbl_bidFiledDocument."Issue Date") + '*' + Format(tbl_bidFiledDocument."Expiry Date") + '*' + tbl_bidFiledDocument."File Name" + '*' + tbl_bidFiledDocument."File Type" + '*' + tbl_bidFiledDocument."File Extension" + ':';
            until tbl_bidFiledDocument.Next = 0;
        end;
        exit(data);

    end;

    procedure fnGetIfpReqDocuments(documentNumber: Code[20]; documentType: Text) data: Text
    begin

        if documentNumber = '' then begin
            tbl_rfiRequiredDocument.Reset();
            // tbl_rfiRequiredDocument.SetRange("Document No", documentNumber);
            tbl_rfiRequiredDocument.SetRange("Document Type", tbl_rfiRequiredDocument."Document Type"::"Invitation For Prequalification");
            if tbl_rfiRequiredDocument.FindSet(true) then begin
                repeat
                    data += tbl_rfiRequiredDocument.Description + '*' + Format(tbl_rfiRequiredDocument."Procurement Document Type ID") + '*' + Format(tbl_rfiRequiredDocument."Requirement Type") + '*' + Format(tbl_rfiRequiredDocument."Special Group Requirement") + '*' + Format(tbl_rfiRequiredDocument."Specialized Provider Req") + '*' + Format(tbl_rfiRequiredDocument."Document Type") + '*' + Format(tbl_rfiRequiredDocument."Track Certificate Expiry") + '*' + /*Format(tbl_rfiRequiredDocument."Linked To category No")*/'' + '::::';
                until tbl_rfiRequiredDocument.Next = 0;
            end;
            exit(data);
        end else begin
            tbl_rfiRequiredDocument.Reset();
            if documentType = 'Invitation For Prequalification' then begin
                tbl_rfiRequiredDocument.SetRange("Document No", documentNumber);
                tbl_rfiRequiredDocument.SetRange("Document Type", tbl_rfiRequiredDocument."Document Type"::"Invitation For Prequalification");
                if tbl_rfiRequiredDocument.FindSet(true) then begin
                    repeat
                        data += tbl_rfiRequiredDocument.Description + '*' + Format(tbl_rfiRequiredDocument."Procurement Document Type ID") + '*' + Format(tbl_rfiRequiredDocument."Requirement Type") + '*' + Format(tbl_rfiRequiredDocument."Special Group Requirement") + '*' + Format(tbl_rfiRequiredDocument."Specialized Provider Req") + '*' + Format(tbl_rfiRequiredDocument."Document Type") + '*' + Format(tbl_rfiRequiredDocument."Track Certificate Expiry") + '*' + /*Format(tbl_rfiRequiredDocument."Linked To category No")*/'' + ':';
                    until tbl_rfiRequiredDocument.Next = 0;
                end;
                exit(data);
            end else begin
                tbl_rfiRequiredDocument.SetRange("Document No", documentNumber);
                if tbl_rfiRequiredDocument.FindSet(true) then begin
                    repeat
                        data += tbl_rfiRequiredDocument.Description + '*' + Format(tbl_rfiRequiredDocument."Procurement Document Type ID") + '*' + Format(tbl_rfiRequiredDocument."Requirement Type") + '*' + Format(tbl_rfiRequiredDocument."Special Group Requirement") + '*' + Format(tbl_rfiRequiredDocument."Specialized Provider Req") + '*' + Format(tbl_rfiRequiredDocument."Document Type") + '*' + Format(tbl_rfiRequiredDocument."Track Certificate Expiry") + '*' +/* Format(tbl_rfiRequiredDocument."Linked To category No") */'' + ':';
                    until tbl_rfiRequiredDocument.Next = 0;
                end;
                exit(data);
            end;
        end;

    end;

    procedure fnGetEprocurementDocuments(procurementProcess: Text) data: Text
    begin
        //  tbl_procurementDocTemplateLine.Reset();
        tbl_procurementSetup.Reset();
        if procurementProcess = 'Registration' then begin
            tbl_procurementDocTemplateLine.SetRange("Procurement Process", tbl_procurementDocTemplateLine."Procurement Process"::Registration);
            if tbl_procurementDocTemplateLine.FindSet(true) then begin
                repeat
                    data += tbl_procurementDocTemplateLine.Description + '*' + Format(tbl_procurementDocTemplateLine."Template ID") + '*' + Format(tbl_procurementDocTemplateLine."Procurement Document Type") + '*' + Format(tbl_procurementDocTemplateLine."Requirement Type") + '*' + '' + '' + '' + ':';
                until tbl_procurementDocTemplateLine.Next = 0;
            end;
            exit(data);
        end;

    end;

    procedure fnGetVendorProfessionalStaff(vendorNumber: Code[20]) data: Text
    begin
        tbl_vendorProfessionalStaff.Reset();
        tbl_vendorProfessionalStaff.SetRange("Vendor No.", vendorNumber);
        if tbl_vendorProfessionalStaff.FindSet(true) then begin
            repeat
                data += Format(tbl_vendorProfessionalStaff."Staff Number") + '*' + tbl_vendorProfessionalStaff."Staff Name" + '*' + Format(tbl_vendorProfessionalStaff."Date of Birth") + '*' + tbl_vendorProfessionalStaff."E-Mail" + '*' + tbl_vendorProfessionalStaff."Current Designation" + '*' + Format(tbl_vendorProfessionalStaff."Years With the Firm") + '*' + Format(tbl_vendorProfessionalStaff."Post Code") + '*' + Format(tbl_vendorProfessionalStaff."Address 2") + '*' + Format(tbl_vendorProfessionalStaff."Phone No.") + '*' + tbl_vendorProfessionalStaff.City + '*' + Format(tbl_vendorProfessionalStaff."Citizenship Type") + '*' + Format(tbl_vendorProfessionalStaff."Staff Category") + '*' + Format(tbl_vendorProfessionalStaff."Country/Region Code") + '*' + tbl_vendorProfessionalStaff.Proffesion + '*' + Format(tbl_vendorProfessionalStaff."Joining Date") + ':';
            until tbl_vendorProfessionalStaff.Next = 0;
        end;
        exit(data);

    end;


    procedure fnGetBidStaff(responseNumber: Code[20]) data: Text
    begin
        tbl_bidKeyStaffExperience.Reset();
        tbl_bidKeyStaffQualification.Reset();
        tbl_bidKeyStaffExperience.SetRange("No.", responseNumber);
        tbl_bidKeyStaffQualification.SetRange("No.", responseNumber);
        if tbl_bidKeyStaffExperience.FindSet(true) and tbl_bidKeyStaffQualification.FindSet(true) then begin
            repeat
                data += Format(tbl_bidKeyStaffExperience."No.") + '*' + Format(tbl_bidKeyStaffQualification."Proposed Project Role ID") + '*' + Format(tbl_bidKeyStaffQualification."Entry No") + ':';
            until tbl_bidKeyStaffExperience.Next = 0;
        end;
        exit(data);
    end;

    procedure fnGetVendorBankAccount(vendorNumber: Code[20]) data: Text
    begin
        tbl_vendorBankAccount.Reset();
        tbl_vendorBankAccount.SetRange("Vendor No.", vendorNumber);
        if tbl_vendorBankAccount.FindSet(true) then begin
            repeat
                data += Format(tbl_vendorBankAccount.Code) + '*' + tbl_vendorBankAccount.Name + '*' + Format(tbl_vendorBankAccount."Post Code") + '*' + Format(tbl_vendorBankAccount.Contact) + '*' + Format(tbl_vendorBankAccount."Currency Code") + '*' + Format(tbl_vendorBankAccount."Bank Account No.") + '*' + Format(tbl_vendorBankAccount."Bank Branch No.") + '*' + tbl_vendorBankAccount.City + '*' + Format(tbl_vendorBankAccount."Bank Branch Name") + '*' + Format(tbl_vendorBankAccount."Country/Region Code") + '*' + tbl_vendorBankAccount."Phone No." + ':';
            until tbl_vendorBankAccount.Next = 0;
        end;
        exit(data);
    end;

    procedure fnGetVendorBeneficiaries(vendorNumber: Code[20]) data: Text
    begin
        tbl_vendorBeneficiaries.Reset();
        tbl_vendorBeneficiaries.SetRange("Vendor No.", vendorNumber);
        if tbl_vendorBeneficiaries.FindSet(true) then begin
            repeat
                data += Format(tbl_vendorBeneficiaries."Entry No.") + '*' + tbl_vendorBeneficiaries.Name + '*' + Format(tbl_vendorBeneficiaries."ID Type") + '*' + Format(tbl_vendorBeneficiaries."ID/Passport No.") + '*' + Format(tbl_vendorBeneficiaries."Phone No.") + '*' + tbl_vendorBeneficiaries.Email + '*' + Format(tbl_vendorBeneficiaries."Allocated Shares") + '*' + Format(tbl_vendorBeneficiaries.Type) + ':';
            until tbl_vendorBeneficiaries.Next = 0;
        end;
        exit(data);
    end;

    procedure fnGetShareholderDetails(vendorNumber: Code[30]) data: Text
    begin
        tbl_vendorBusinessOwner.Reset();
        tbl_vendorBusinessOwner.SetRange("Vendor No.", vendorNumber);
        if tbl_vendorBusinessOwner.FindSet(true) then begin
            repeat
                data += Format(tbl_vendorBusinessOwner."Entry No.") + '*' + tbl_vendorBusinessOwner.Name + '*' + tbl_vendorBusinessOwner."Vendor No." + '*' + tbl_vendorBusinessOwner.Address + '*' + tbl_vendorBusinessOwner."Address 2" + '*' + tbl_vendorBusinessOwner.City + '*' + Format(tbl_vendorBusinessOwner."Entity Ownership %") + '*' + tbl_vendorBusinessOwner."Phone No." + '*' + tbl_vendorBusinessOwner."Nationality ID" + '*' + tbl_vendorBusinessOwner."ID/Passport No." + '*' + Format(tbl_vendorBusinessOwner."Share Types") + '*' + Format(tbl_vendorBusinessOwner."Citizenship Type") + '*' + Format(tbl_vendorBusinessOwner."Country/Region Code") + '*' + tbl_vendorBusinessOwner.County + '*' + tbl_vendorBusinessOwner."E-Mail" + '*' + Format(tbl_vendorBusinessOwner."Post Code") + ':';
            until tbl_vendorBusinessOwner.Next = 0;
        end;
        exit(data);
    end;

    procedure fnGetVendorPastExperience(vendorNumber: Code[20]) data: Text
    begin
        tbl_vendorPastExperience.Reset();
        tbl_vendorPastExperience.SetRange("Vendor No.", vendorNumber);
        if tbl_vendorPastExperience.FindSet(true) then begin
            repeat
                data += tbl_vendorPastExperience."Client Name" + '*' + Format(tbl_vendorPastExperience."Entry No.") + '*' + tbl_vendorPastExperience.Address + '*' + tbl_vendorPastExperience."Assignment Name" + '*' + tbl_vendorPastExperience."Project Scope Summary" + '*' + Format(tbl_vendorPastExperience."Assignment Start Date") + '*' + Format(tbl_vendorPastExperience."Assignment End Date") + '*' + tbl_vendorPastExperience."Country/Region Code" + '*' + Format(tbl_vendorPastExperience."Assignment Value LCY") + '*' + Format(tbl_vendorPastExperience."Contract Ref No") + '*' + tbl_vendorPastExperience."Delivery Location" + '*' + tbl_vendorPastExperience."Primary Contact Person" + '*' + tbl_vendorPastExperience.City + '*' + tbl_vendorPastExperience."Phone No." + '*' + tbl_vendorPastExperience."Nationality ID" + '*' + Format(tbl_vendorPastExperience."Date of Birth") + '*' + Format(tbl_vendorPastExperience."Entity Ownership %") + '*' + Format(tbl_vendorPastExperience."Nominal Value/Share") + '*' + Format(tbl_vendorPastExperience."Assignment Status") + ':';
            until tbl_vendorPastExperience.Next = 0;
        end;
        exit(data);
    end;



    procedure fnGetBidSpecificationEquipment(responseNumber: Code[20]) data: Text
    begin
        tbl_bidEquipmentSpecification.Reset();
        tbl_bidEquipmentSpecification.SetRange("No.", responseNumber);
        if tbl_bidEquipmentSpecification.FindSet(true) then begin
            repeat
                data += tbl_bidEquipmentSpecification."No." + '*' + Format(tbl_bidEquipmentSpecification."Equipment Type Code") + '*' + Format(tbl_bidEquipmentSpecification."Ownership Type") + '*' + Format(tbl_bidEquipmentSpecification."Equipment Serial") + '*' + Format(tbl_bidEquipmentSpecification."Equipment Condition Code") + '*' + Format(tbl_bidEquipmentSpecification."Equipment Usability Code") + '*' + Format(tbl_bidEquipmentSpecification."Qty of Equipment") + '*' + tbl_bidEquipmentSpecification.Description + '*' + Format(tbl_bidEquipmentSpecification."Years of Previous Use") + '*' + Format(tbl_bidEquipmentSpecification."Entry No") + ':';
            until tbl_bidEquipmentSpecification.Next = 0;
        end;
        exit(data);

    end;

    procedure fnGetBidAuditedIncomeStatement(vendorNumber: Code[20]; responseNumber: Code[20]) data: Text
    begin
        tbl_bidAuditedIncomeStatement.Reset();
        tbl_bidAuditedIncomeStatement.SetRange("Vendor No.", vendorNumber);
        tbl_bidAuditedIncomeStatement.SetRange("No.", responseNumber);
        if tbl_bidAuditedIncomeStatement.FindSet(true) then begin
            repeat
                data += Format(tbl_bidAuditedIncomeStatement."Audit Year Code Reference") + '*' + Format(tbl_bidAuditedIncomeStatement."Total Revenue (LCY)") + '*' + Format(tbl_bidAuditedIncomeStatement."Total COGS (LCY)") + '*' + Format(tbl_bidAuditedIncomeStatement."Gross Margin (LCY)") + '*' + Format(tbl_bidAuditedIncomeStatement."Total Operating Expenses (LCY)") + '*' + Format(tbl_bidAuditedIncomeStatement."Operating Income/EBIT (LCY)") + '*' + Format(tbl_bidAuditedIncomeStatement."Other Non-operating Re/Exp LCY") + '*' + Format(tbl_bidAuditedIncomeStatement."Interest Expense (LCY)") + '*' + Format(tbl_bidAuditedIncomeStatement."Income Before Taxes (LCY)") + '*' + Format(tbl_bidAuditedIncomeStatement."Income Tax Expense (LCY)") + '*' + Format(tbl_bidAuditedIncomeStatement."Net Income from Ops  (LCY)") + '*' + Format(tbl_bidAuditedIncomeStatement."Below-the-line Items (LCY)") + '*' + Format(tbl_bidAuditedIncomeStatement."Net Income") + '*' + Format(tbl_bidAuditedIncomeStatement."Document Type") + ':';
            until tbl_bidAuditedIncomeStatement.Next = 0;
        end;
        exit(data);
    end;

    procedure fnGetBidContractSecurity(vendorNumber: Code[20]; responseNumber: Code[20]) data: Text
    begin
        tbl_bidContractSecurityRegister.Reset();
        tbl_bidContractSecurityRegister.SetRange("Vendor No.", vendorNumber);
        tbl_bidContractSecurityRegister.SetRange("No.", responseNumber);
        if tbl_bidContractSecurityRegister.FindSet(true) then begin
            repeat
                data += Format(tbl_bidContractSecurityRegister."Document Type") + '*' + tbl_bidContractSecurityRegister."IFS No" + '*' + Format(tbl_bidContractSecurityRegister."Security Type") + '*' + Format(tbl_bidContractSecurityRegister."Issuer Institution Type") + '*' + Format(tbl_bidContractSecurityRegister."Issuer Registered Offices") + '*' + tbl_bidContractSecurityRegister.Description + '*' + Format(tbl_bidContractSecurityRegister."Security Amount (LCY)") + '*' + Format(tbl_bidContractSecurityRegister."Bid Security Effective Date") + '*' + Format(tbl_bidContractSecurityRegister."Bid Security Validity Expiry") + '*' + Format(tbl_bidContractSecurityRegister."Security ID") + '*' + Format(tbl_bidContractSecurityRegister."Security Closure Date") + '*' + Format(tbl_bidContractSecurityRegister."Security Closure Voucher No.") + '*' + Format(tbl_bidContractSecurityRegister."Security Closure Type") + '*' + Format(tbl_bidContractSecurityRegister."Form of Security") + '*' + Format(tbl_bidContractSecurityRegister."Issuer/Guarantor Name") + ':';
            until tbl_bidContractSecurityRegister.Next = 0;
        end;
        exit(data);
    end;

    procedure fnGetVendorIncomeStatement(vendorNumber: Code[20]) data: Text
    begin
        tbl_vendorAuditedIncome.Reset();
        tbl_vendorAuditedIncome.SetRange("Vendor No.", vendorNumber);
        if tbl_vendorAuditedIncome.FindSet(true) then begin
            repeat
                data += Format(tbl_vendorAuditedIncome."Audit Year Code Reference") + '*' + Format(tbl_vendorAuditedIncome."Total Revenue (LCY)") + '*' + Format(tbl_vendorAuditedIncome."Total COGS (LCY)") + '*' + Format(tbl_vendorAuditedIncome."Gross Margin (LCY)") + '*' + Format(tbl_vendorAuditedIncome."Total Operating Expenses (LCY)") + '*' + Format(tbl_vendorAuditedIncome."Operating Income/EBIT (LCY)") + '*' + Format(tbl_vendorAuditedIncome."Other Non-operating Re/Exp LCY") + '*' + Format(tbl_vendorAuditedIncome."Interest Expense (LCY)") + '*' + Format(tbl_vendorAuditedIncome."Income Before Taxes (LCY)") + '*' + Format(tbl_vendorAuditedIncome."Income Tax Expense (LCY)") + '*' + Format(tbl_vendorAuditedIncome."Net Income from Ops  (LCY)") + '*' + Format(tbl_vendorAuditedIncome."Net Income") + ':';
            until tbl_vendorAuditedIncome.Next = 0;
        end;
        exit(data);
    end;

    procedure fnGetBidAuditedBalanceSheet(vendorNumber: Code[20]; responseNumber: Code[20]) data: Text
    begin
        tbl_bidAuditedBalanceSheet.Reset();
        tbl_bidAuditedBalanceSheet.SetRange("Vendor No.", vendorNumber);
        tbl_bidAuditedBalanceSheet.SetRange("No.", responseNumber);
        if tbl_bidAuditedBalanceSheet.FindSet(true) then begin
            repeat
                data += Format(tbl_bidAuditedBalanceSheet."Audit Year Code Reference") + '*' + Format(tbl_bidAuditedBalanceSheet."Current Assets (LCY)") + '*' + Format(tbl_bidAuditedBalanceSheet."Fixed Assets (LCY)") + '*' + Format(tbl_bidAuditedBalanceSheet."Total Assets (LCY)") + '*' + Format(tbl_bidAuditedBalanceSheet."Current Liabilities (LCY)") + '*' + Format(tbl_bidAuditedBalanceSheet."Long-term Liabilities (LCY)") + '*' + Format(tbl_bidAuditedBalanceSheet."Total Liabilities (LCY)") + '*' + Format(tbl_bidAuditedBalanceSheet."Debt Ratio") + '*' + Format(tbl_bidAuditedBalanceSheet."Working Capital (LCY)") + '*' + Format(tbl_bidAuditedBalanceSheet."Owners Equity (LCY)") + '*' + Format(tbl_bidAuditedBalanceSheet."Current Ratio") + '*' + Format(tbl_bidAuditedBalanceSheet."Assets-To-Equity Ratio") + '*' + Format(tbl_bidAuditedBalanceSheet."Debt-To-Equity Ratio") + ':';
            until tbl_bidAuditedBalanceSheet.Next = 0;
        end;
        exit(data);

    end;


    procedure fnGetIFPRequest(invitationNumber: Code[30]) data: Text
    begin
        tbl_requestForInformation.Reset();
        tbl_requestForInformation.SetRange(Code, invitationNumber);
        if tbl_requestForInformation.FindSet(true) then begin
            repeat
                data += Format(tbl_requestForInformation."Document Date") + '*' + Format(tbl_requestForInformation."Period End Date") + '*' + Format(tbl_requestForInformation."Period Start Date") + '*' + tbl_requestForInformation.Description + '*' + tbl_requestForInformation."Tender Box Location Code" + '*' + tbl_requestForInformation."Tender Summary" + '*' + Format(tbl_requestForInformation.Status) + '*' + Format(tbl_requestForInformation."Primary Target Vendor Cluster") + '*' + Format(tbl_requestForInformation."External Document No") + '*' + Format(tbl_requestForInformation."Document Type") + '*' + Format(tbl_requestForInformation."Submission Start Date") + '*' + Format(tbl_requestForInformation."Submission End Date") + '*' + Format(tbl_requestForInformation."Submission Start Time") + '*' + tbl_requestForInformation.Address + '*' + tbl_requestForInformation."Address 2" + '*' + tbl_requestForInformation."Country/Region Code" + '*' + Format(tbl_requestForInformation."Submission End Time") + '::::';
            until tbl_requestForInformation.Next = 0;
        end;
    end;

    procedure fnGetVendorBalanceSheet(vendorNumber: Code[20]) data: Text
    begin
        tbl_vendorAuditedBalanceSheet.Reset();
        tbl_vendorAuditedBalanceSheet.SetRange("Vendor No.", vendorNumber);
        if tbl_vendorAuditedBalanceSheet.FindSet(true) then begin
            repeat
                data += Format(tbl_vendorAuditedBalanceSheet."Audit Year Code Reference") + '*' + Format(tbl_vendorAuditedBalanceSheet."Current Assets (LCY)") + '*' + Format(tbl_vendorAuditedBalanceSheet."Fixed Assets (LCY)") + '*' + Format(tbl_vendorAuditedBalanceSheet."Total Assets (LCY)") + '*' + Format(tbl_vendorAuditedBalanceSheet."Current Liabilities (LCY)") + '*' + Format(tbl_vendorAuditedBalanceSheet."Long-term Liabilities (LCY)") + '*' + Format(tbl_vendorAuditedBalanceSheet."Total Liabilities (LCY)") + '*' + Format(tbl_vendorAuditedBalanceSheet."Owners Equity (LCY)") + '*' + Format(tbl_vendorAuditedBalanceSheet."Debt Ratio") + '*' + Format(tbl_vendorAuditedBalanceSheet."Working Capital (LCY)") + '*' + Format(tbl_vendorAuditedBalanceSheet."Assets-To-Equity Ratio") + '*' + Format(tbl_vendorAuditedBalanceSheet."Debt-To-Equity Ratio") + ':';
            until tbl_vendorAuditedBalanceSheet.Next = 0;
        end;
        exit(data);

    end;

    procedure fnGetBidPastExperience(responseNumber: Code[20]; vendorNumber: Code[20]) data: Text
    begin
        tbl_bidPastExperience.Reset();
        tbl_bidPastExperience.SetRange("No.", responseNumber);
        tbl_bidPastExperience.SetRange("Vendor No.", vendorNumber);
        if tbl_bidPastExperience.FindSet(true) then begin
            repeat
                data += Format(tbl_bidPastExperience.Address) + '*' + tbl_bidPastExperience."Client Name" + '*' + Format(tbl_bidPastExperience.City) + '*' + tbl_bidPastExperience."Address 2" + '*' + tbl_bidPastExperience."Phone No." + '*' + tbl_bidPastExperience."Nationality ID" + '*' + Format(tbl_bidPastExperience."Citizenship Type") + '*' + Format(tbl_bidPastExperience."Entity Ownership %") + '*' + Format(tbl_bidPastExperience."Share Types") + '*' + Format(tbl_bidPastExperience."No. of Shares") + '*' + Format(tbl_bidPastExperience."Nominal Value/Share") + '*' + Format(tbl_bidPastExperience."Total Nominal Value") + '*' + Format(tbl_bidPastExperience."Assignment/Project Name") + '*' + Format(tbl_bidPastExperience."Project Completion % (Work)") + '*' + Format(tbl_bidPastExperience."Project Completion % (Value)") + '*' + Format(tbl_bidPastExperience."Assignment Status") + '*' + Format(tbl_bidPastExperience."Assignment Value LCY") + '*' + Format(tbl_bidPastExperience."Assignment End Date") + '*' + Format(tbl_bidPastExperience."Assignment Start Date") + '*' + Format(tbl_bidPastExperience."Contract Ref No") + '*' + Format(tbl_bidPastExperience."Delivery Location") + '*' + tbl_bidPastExperience."Project Scope Summary" + '*' + tbl_bidPastExperience."Primary Contact Email" + '*' + Format(tbl_bidPastExperience."Primary Contact Designation") + '*' + Format(tbl_bidPastExperience."Primary Contact Tel") + '*' + Format(tbl_bidPastExperience."Primary Contact Person") + '*' + Format(tbl_bidPastExperience.Blocked) + '*' + Format(tbl_bidPastExperience."No. Series") + '*' + tbl_bidPastExperience."E-Mail" + '*' + tbl_bidPastExperience.County + '*' + tbl_bidPastExperience."Post Code" + '*' + Format(tbl_bidPastExperience."Country/Region Code") + '*' + Format(tbl_bidPastExperience."Ownership Effective Date") + ':';

            until tbl_bidPastExperience.Next = 0;
        end;
        exit(data);
    end;

    procedure fnGetEvaluationCriteria(templateId: Code[20]) data: Text
    begin
        tbl_bidScoreRequirement.Reset();
        tbl_bidScoreRequirement.SetRange("Template ID", templateId);
        if tbl_bidScoreRequirement.FindSet(true) then begin
            repeat
                data += Format(tbl_bidScoreRequirement."Criteria Group ID") + '*' + Format(tbl_bidScoreRequirement."Evaluation Requirement") + '*' + Format(tbl_bidScoreRequirement."Evaluation Type") + '*' + Format(tbl_bidScoreRequirement."Assigned Weight %") + ':';
            until tbl_bidScoreRequirement.Next = 0;
        end;
        exit(data);
    end;

    procedure fnGetTenderSourceDocument() data: Text
    begin
        tbl_tenderSourceDocument.Reset();
        repeat
            data += tbl_tenderSourceDocument.Code + '*' + tbl_tenderSourceDocument.Description + ':';
        until tbl_tenderSourceDocument.Next = 0;
        exit(data);

    end;

    procedure fnGetTenderAddednumDocument(noticeNumber: Code[30]) data: Text
    begin
        tbl_tenderAddednumAmendment.Reset();
        tbl_tenderAddednumAmendment.SetRange("Addendum Notice No.", noticeNumber);
        if tbl_tenderAddednumAmendment.FindSet(true) then begin
            repeat
                data += tbl_tenderAddednumAmendment."Amendment Description" + '*' + Format(tbl_tenderAddednumAmendment."Amended Section of Tender Doc") + '*' + Format(tbl_tenderAddednumAmendment."Amendment Type") + ':';
            until tbl_tenderAddednumAmendment.Next = 0;
        end;
        exit(data);

    end;

    // procedure fnGetCalendarYearCodeList() data: Text
    // begin
    //     tbl_calendarYearCodeList.Reset();
    //     repeat
    //         data += tbl_calendarYearCodeList.Code + '*' + tbl_calendarYearCodeList.Description + ':';
    //     until tbl_calendarYearCodeList.Next = 0;
    //     exit(data);
    // end;

    // procedure fnGetWorkEquipmentCategories() data: Text
    // begin
    //     tbl_workEquipmentType.Reset();
    //     repeat
    //         data += tbl_workEquipmentType.Code + '*' + tbl_workEquipmentType.Description + ':';
    //     until tbl_workEquipmentType.Next = 0;
    //     exit(data);
    // end;

    // procedure GenerateAndSendVendorOTP(VendorNum: code[30]): Text
    // var
    //     OTP: Text[10];
    //     VendorsRec: Record Vendor;
    //     generateOTP: Codeunit "OTP Sender";

    // begin
    //     OTP := '';
    //     OTP := generateOTP.GenerateAndSendVendorOTP(VendorNum);
    //     VendorsRec.Reset();
    //     VendorsRec.SetRange("No.", VendorNum);
    //     if VendorsRec.FindFirst() then begin
    //         VendorsRec."Vendor OTP" := OTP;
    //         VendorsRec.modify;
    //     end;
    //     exit(OTP);
    // end;

    // procedure ConfirmVendorOTp(VendoNum: Code[30]; OTPCOde: Text[10]): Boolean
    // var
    //     myInt: Integer;
    //     VendorRec: Record Vendor;
    // begin
    //     VendorRec.Reset();
    //     VendorRec.SetRange("No.", VendoNum);
    //     if VendorRec.FindFirst() then begin
    //         if VendorRec."Vendor OTP" = OTPCOde then
    //             exit(true)
    //         else
    //             exit(false);
    //     end else
    //         exit(false)
    // end;


    procedure fnGetPurchaseHeader(documentType: Text; payToVendor: Code[20]) data: Text
    begin
        tbl_purchaseHeader.Reset();
        if payToVendor = '' then begin
            if documentType = 'Blanket Order' then begin
                tbl_purchaseHeader.SetRange("Document Type", tbl_purchaseHeader."Document Type"::"Blanket Order");
                if tbl_purchaseHeader.FindSet(true) then begin
                    repeat
                        data += tbl_purchaseHeader."No." + '*' + tbl_purchaseHeader."Pay-to Name" + '*' + Format(tbl_purchaseHeader."Document Date") + '*' + Format(tbl_purchaseHeader."Order types") + '*' + Format(tbl_purchaseHeader.Region) + '*' + tbl_purchaseHeader.Description + '*' + Format(tbl_purchaseHeader."Amount Including VAT") + '*' + Format(tbl_purchaseHeader."Contract Description") + '*' + Format(tbl_purchaseHeader."Currency Code") + '*' + Format(tbl_purchaseHeader."Contract Start Date") + '*' + Format(tbl_purchaseHeader."Contract End Date") + '*' + Format(tbl_purchaseHeader."Award Tender Sum Inc Taxes") + '*' + Format(tbl_purchaseHeader."Location Code") + '*' + Format(tbl_purchaseHeader."Invitation For Supply No") + '*' + Format(tbl_purchaseHeader."Contract Type") + '*' + Format(tbl_purchaseHeader."Currency Code") + '*' + Format(tbl_purchaseHeader.Amount) + '*' + Format(tbl_purchaseHeader."Document Type") + '*' + Format(tbl_purchaseHeader."Bidder Type") + '*' + Format(tbl_purchaseHeader."Tender Name") + '*' + tbl_purchaseHeader."Tender Description" + '*' + Format(tbl_purchaseHeader.Status) + '*' + Format(tbl_purchaseHeader."Buy-from Vendor No.") + '*' + tbl_purchaseHeader."Pay-to Name 2" + '*' + tbl_purchaseHeader."Pay-to Address" + '*' + tbl_purchaseHeader."Pay-to Address 2" + '*' + tbl_purchaseHeader."Pay-to Contact" + '*' + tbl_purchaseHeader."Your Reference" + '*' + Format(tbl_purchaseHeader."Order Date") + '*' + Format(tbl_purchaseHeader."Posting Date") + '*' + tbl_purchaseHeader."Location Code" + '*' + tbl_purchaseHeader."Link Name" + '*' + Format(tbl_purchaseHeader."Works Length (Km)") + '*' + Format(tbl_purchaseHeader."Approved Requisition Amount") + '*' + Format(tbl_purchaseHeader."Contract Status") + ':';
                    until tbl_purchaseHeader.Next = 0;
                end;
                exit(data);
            end;
        end else begin

            tbl_purchaseHeader.SetRange("Pay-to Vendor No.", payToVendor);
            if tbl_purchaseHeader.FindSet(true) then begin
                repeat
                    data += tbl_purchaseHeader."No." + '*' + tbl_purchaseHeader."Pay-to Name" + '*' + Format(tbl_purchaseHeader."Document Date") + '*' + Format(tbl_purchaseHeader."Order types") + '*' + Format(tbl_purchaseHeader.Region) + '*' + tbl_purchaseHeader.Description + '*' + Format(tbl_purchaseHeader."Amount Including VAT") + '*' + Format(tbl_purchaseHeader."Contract Description") + '*' + Format(tbl_purchaseHeader."Currency Code") + '*' + Format(tbl_purchaseHeader."Contract Start Date") + '*' + Format(tbl_purchaseHeader."Contract End Date") + '*' + Format(tbl_purchaseHeader."Award Tender Sum Inc Taxes") + '*' + Format(tbl_purchaseHeader."Location Code") + '*' + Format(tbl_purchaseHeader."Invitation For Supply No") + '*' + Format(tbl_purchaseHeader."Contract Type") + '*' + Format(tbl_purchaseHeader."Currency Code") + '*' + Format(tbl_purchaseHeader.Amount) + '*' + Format(tbl_purchaseHeader."Document Type") + '*' + Format(tbl_purchaseHeader."Bidder Type") + '*' + Format(tbl_purchaseHeader."Tender Name") + '*' + tbl_purchaseHeader."Tender Description" + '*' + Format(tbl_purchaseHeader.Status) + '*' + Format(tbl_purchaseHeader."Buy-from Vendor No.") + '*' + tbl_purchaseHeader."Pay-to Name 2" + '*' + tbl_purchaseHeader."Pay-to Address" + '*' + tbl_purchaseHeader."Pay-to Address 2" + '*' + tbl_purchaseHeader."Pay-to Contact" + '*' + tbl_purchaseHeader."Your Reference" + '*' + Format(tbl_purchaseHeader."Order Date") + '*' + Format(tbl_purchaseHeader."Posting Date") + '*' + tbl_purchaseHeader."Location Code" + '*' + tbl_purchaseHeader."Link Name" + '*' + Format(tbl_purchaseHeader."Works Length (Km)") + '*' + Format(tbl_purchaseHeader."Approved Requisition Amount") + '*' + Format(tbl_purchaseHeader."Contract Status") + ':';
                until tbl_purchaseHeader.Next = 0;
            end;

        end;


    end;

    // procedure fnGetJobs() data: Text
    // begin
    //     tbl_job.Reset();
    //     repeat
    //         data += tbl_job."No." + '*' + tbl_job.Description + '*' + tbl_job."Project No" + '*' + Format(tbl_job."Project Start Date") + '*' + Format(tbl_job."Ending Date") + '*' + tbl_job."Person Responsible" + '*' + tbl_job."Contractor No." + '*' + tbl_job."Contractor Name" + '*' + Format(tbl_job."Road Section No") + '*' + Format(tbl_job.Status) + '*' + Format(tbl_job."IFS Code") + '*' + Format(tbl_job."Road Class ID") + '*' + Format(tbl_job."Road Code") + '*' + Format(tbl_job."Funding Source") + '*' + tbl_job."Section Name" + '*' + Format(tbl_job."Total Road Section Length (KM)") + '*' + Format(tbl_job."Constituency ID") + '*' + Format(tbl_job."Creation Date") + '*' + Format(tbl_job."Contract Start Date") + '*' + Format(tbl_job."Contract End Date") + '*' + Format(tbl_job."Directorate Code") + '*' + Format(tbl_job."Contractor No.") + '*' + Format(tbl_job.Status) + ':';
    //     until tbl_job.Next = 0;
    //     exit(data);
    // end;

    procedure fnGetTenderSecurityTypes(securityType: Text) data: Text
    begin
        tbl_tenderSecurityTypes.Reset();
        if securityType = 'Performance/Contract Security' then begin
            tbl_tenderSecurityTypes.SetRange("Security Type", tbl_tenderSecurityTypes."Security Type"::"Performance/Contract Security");
            if tbl_tenderSecurityTypes.FindSet(true) then begin
                repeat
                    data += tbl_tenderSecurityTypes.Code + '*' + tbl_tenderSecurityTypes.Description + '*' + Format(tbl_tenderSecurityTypes."Security Type") + '*' + Format(tbl_tenderSecurityTypes."Nature of Security") + ':';
                until tbl_tenderSecurityTypes.Next = 0;
            end;
            exit(data);
        end else
            if securityType = '' then begin
                repeat
                    data += tbl_tenderSecurityTypes.Code + '*' + tbl_tenderSecurityTypes.Description + '*' + Format(tbl_tenderSecurityTypes."Security Type") + '*' + Format(tbl_tenderSecurityTypes."Nature of Security") + ':';
                until tbl_tenderSecurityTypes.Next = 0;
            end;
        exit(data);
    end;


    procedure fnGetProjectRoleCodes() data: Text
    begin
        tbl_projectRoleCode.Reset();
        tbl_projectRoleCode.SetRange(Blocked, false);
        if tbl_projectRoleCode.FindSet(true) then begin
            repeat
                data += tbl_projectRoleCode."Project Role Code" + '*' + tbl_projectRoleCode."Title/Designation Description" + ':';
            until tbl_projectRoleCode.Next = 0;
        end;
        exit(data);

    end;

    procedure fnGetRFICategoryRequirements(categoryId: Code[30]) data: Text
    begin
        tbl_rfiCategoryRequirement.Reset();
        tbl_rfiCategoryRequirement.SetRange("Category ID", categoryId);
        if tbl_rfiCategoryRequirement.FindSet(true) then begin
            repeat
                data += tbl_rfiCategoryRequirement."Category ID" + '*' + tbl_rfiCategoryRequirement.Description + '*' + Format(tbl_rfiCategoryRequirement."Requirement Type") + ':';
            until tbl_rfiCategoryRequirement.Next = 0;
        end;
        exit(data);

    end;

    procedure fnGetIFPResponseLineRC(docNumber: Code[20]; category: Text; vendorNumber: Text; documentType: Text) data: Text
    begin
        tbl_ifpResponseLineRC.Reset();
        if documentType = 'IFP Response' then begin
            tbl_ifpResponseLineRC.SetRange("Document No.", docNumber);
            tbl_ifpResponseLineRC.SetRange("Procurement Category", category);
            // tbl_ifpResponseLineRC.SetRange("Vendor No", vendorNumber);

            tbl_ifpResponseLineRC.SetRange("Document Type", tbl_ifpResponseLineRC."Document Type"::"IFP Response");
            if tbl_ifpResponseLineRC.FindSet(true) then begin
                repeat
                    data += tbl_ifpResponseLineRC."Document No." + '*' + tbl_ifpResponseLineRC."Procurement Category" + '*' + tbl_ifpResponseLineRC."Responsibility Center Code" + '*' +/* tbl_ifpResponseLineRC."Constituency Code" */'' + '*' + tbl_ifpResponseLineRC.Description + ':';
                until tbl_ifpResponseLineRC.Next = 0;
            end;
            exit(data);
        end;
    end;

    procedure fnGetIfpResponseLine(docNumber: Code[20]; category: Text; vendorNumber: Text; documentType: Text) data: Text
    begin
        tbl_ifpResponseLine.Reset();
        tbl_ifpResponseLine.SetRange("Vendor No.", vendorNumber);
        tbl_ifpResponseLine.SetRange("Document No.", docNumber);
        if tbl_ifpResponseLine.FindSet(true) then begin
            repeat
                data += tbl_ifpResponseLine."Category Description" + '*' + tbl_ifpResponseLine."Document No." + '*' + tbl_ifpResponseLine."Procurement Category" + '*' + Format(tbl_ifpResponseLine.Constituency) + '*' + Format(tbl_ifpResponseLine."RFI Document No.") + '*' + Format(tbl_ifpResponseLine."Evaluation Decision") + '*' + Format(tbl_ifpResponseLine."Evaluation Score %") + '*' + Format(tbl_ifpResponseLine."Prequalification End Date") + '*' + Format(tbl_ifpResponseLine."Prequalification Start Date") + '*' + Format(tbl_ifpResponseLine."Restricted RC ID") + '*' + Format(tbl_ifpResponseLine."Restricted Responsbility Cente") + '*' + Format(tbl_ifpResponseLine."Global RC Prequalification") + '*' + Format(tbl_ifpResponseLine."Unique Category Requirements") + '*' + Format(tbl_ifpResponseLine."Special Group Reservation") + '*' + Format(tbl_ifpResponseLine."Document Type") + ':';

            until tbl_ifpResponseLine.Next = 0;
        end;
        exit(data);
    end;

    procedure fnGetCountries() data: Text
    begin
        tbl_countries.Reset();
        repeat
            data += tbl_countries.Code + '*' + tbl_countries.Name + ':';
        until tbl_countries.Next = 0;
        exit(data);
    end;

    procedure fnGetBidScoreRequirements(templateId: Code[30]) data: Text
    begin
        tbl_bidScoreRequirement.Reset();
        tbl_bidScoreRequirement.SetRange("Template ID", templateId);
        if tbl_bidScoreRequirement.FindSet(true) then begin
            repeat
                data += Format(tbl_bidScoreRequirement."Template ID") + '*' + Format(tbl_bidScoreRequirement."Evaluation Type") + '*' + Format(tbl_bidScoreRequirement."Evaluation Requirement") + '*' + /*Format(tbl_bidScoreRequirement."Requirement Type")*/ '' + '*' + /*Format(tbl_bidScoreRequirement."Contract Ref Clause")*/'' + '::::';
            until tbl_bidScoreRequirement.Next = 0;
        end;
        exit(data);
    end;

    procedure fnGetIfsRequiredDocs(documentNumber: Code[30]) data: Text
    begin
        tbl_ifsRequiredDocument.Reset();
        tbl_ifsRequiredDocument.SetRange("Document No", documentNumber);
        if tbl_ifsRequiredDocument.FindSet(true) then begin
            repeat
                data += tbl_ifsRequiredDocument."Document No" + '*' + Format(tbl_ifsRequiredDocument."Procurement Document Type ID") + '*' + tbl_ifsRequiredDocument.Description + '*' + Format(tbl_ifsRequiredDocument."Track Certificate Expiry") + '*' + /*Format(tbl_ifsRequiredDocument."Guidelines/Instruction")*/'' + '*' + Format(tbl_ifsRequiredDocument."Requirement Type") + '*' + Format(tbl_ifsRequiredDocument."Special Group Requirement") + '*' + Format(tbl_ifsRequiredDocument."Specialized Provider Req") + ':';
            until tbl_ifsRequiredDocument.Next = 0;
        end;
        exit(data);

    end;

    // procedure fnGetVendor(vendorNumber: Code[30]) data: Text
    // begin
    //     tbl_vendor.Reset();
    //     tbl_vendor.SetRange("No.", vendorNumber);
    //     if tbl_vendor.FindSet(true) then begin
    //         repeat
    //             data += tbl_vendor.Name + '*' + Format(tbl_vendor."Language Code") + '*' + Format(tbl_vendor."Business Type") + '*' + Format(tbl_vendor."Supplier Type") + '*' + Format(tbl_vendor."Ownership Type") + '*' + Format(tbl_vendor."Operations Start Date") + '*' + Format(tbl_vendor."Registration/Incorporation No.") + '*' + Format(tbl_vendor."Mission Statement") + '*' + Format(tbl_vendor."Vision Statement") + '*' + Format(tbl_vendor."Reg/Incorporation Date") + '*' + Format(tbl_vendor."Post Code") + '*' + tbl_vendor.City + '*' + Format(tbl_vendor."Country/Region Code") + '*' + tbl_vendor."Website Url" + '*' + Format(tbl_vendor.Address) + '*' + tbl_vendor.Email + '*' + tbl_vendor."Phone No." + '*' + Format(tbl_vendor."Currency Code") + '*' + Format(tbl_vendor."Balance (LCY)") + '*' + Format(tbl_vendor."Location Code") + '*' + Format(tbl_vendor."Supplier Type") + '*' + Format(tbl_vendor."Industry Group") + '*' + Format(tbl_vendor."Address 2") + '*' + Format(tbl_vendor."Building/House No") + '*' + Format(tbl_vendor.Floor) + '*' + Format(tbl_vendor."Plot No") + '*' + Format(tbl_vendor.Street) + '*' + Format(tbl_vendor."Company Size") + '*' + Format(tbl_vendor."Nominal Capital LCY") + '*' + Format(tbl_vendor."Dealer Type") + '*' + Format(tbl_vendor."Max Value of Business") + '*' + Format(tbl_vendor."Fax No.") + '*' + tbl_vendor."Nature of Business" + tbl_vendor."Registration/Incorporation No." + '*' + tbl_vendor."Primary Contact No." + '*' + tbl_vendor."Signatory Designation" + '*' + Format(tbl_vendor."Balance (LCY)") + '*' + Format(tbl_vendor."Issued Capital LCY") + '*' + Format(tbl_vendor."Profile Complete") + '*' + Format(tbl_vendor."VAT Registration No.") + '*' + Format(tbl_vendor.Address) + '*' + Format(tbl_vendor."Post Code") + '*' + tbl_vendor."Country/Region Code" + '*' + FORMAT(tbl_vendor."HaveAgpo?") + '::::';
    //         until tbl_vendor.Next = 0;
    //     end;

    // end;

    procedure fnGetRFIPrequalificationCategory(invitationNumber: Code[20]) data: Text
    begin
        tbl_rfiPrequalificationCategory.Reset();
        tbl_rfiPrequalificationCategory.SetRange("Document No", invitationNumber);
        if tbl_rfiPrequalificationCategory.FindSet(true) then begin
            repeat
                data += Format(tbl_rfiPrequalificationCategory."Document Type") + '*' + Format(tbl_rfiPrequalificationCategory."Procurement Type") + '*' + Format(tbl_rfiPrequalificationCategory."Prequalification Category ID") + '*' + tbl_rfiPrequalificationCategory.Description + '*' + Format(tbl_rfiPrequalificationCategory."Period Start Date") + '*' + Format(tbl_rfiPrequalificationCategory."Period End Date") + '*' + Format(tbl_rfiPrequalificationCategory."Submission Start Date") + '*' + Format(tbl_rfiPrequalificationCategory."Submission End Date") + '*' + Format(tbl_rfiPrequalificationCategory."Submission End Time") + '*' + Format(tbl_rfiPrequalificationCategory."Submission Start Time") + '*' + Format(tbl_rfiPrequalificationCategory."Applicable Location") + '*' + Format(tbl_rfiPrequalificationCategory."Special Group Reservation") + ':';
            until tbl_rfiPrequalificationCategory.Next = 0;
        end;
        exit(data);
    end;

    procedure fnGetVendorPrequalificationEntry(vendorNumber: Code[20]) data: Text
    begin
        tbl_vendorPrequalificationEntry.Reset();
        tbl_vendorPrequalificationEntry.SetRange("Vendor No.", vendorNumber);
        if tbl_vendorPrequalificationEntry.FindSet(true) then begin
            repeat
                data += Format(tbl_vendorPrequalificationEntry."IFP No.") + '*' + Format(tbl_vendorPrequalificationEntry."Procurement Type") + '*' + tbl_vendorPrequalificationEntry.Description + '*' + Format(tbl_vendorPrequalificationEntry."Start Date") + '*' + Format(tbl_vendorPrequalificationEntry."End Date") + '*' + Format(tbl_vendorPrequalificationEntry."Document Type") + '*' + Format(tbl_vendorPrequalificationEntry."Posting Date") + '*' + Format(tbl_vendorPrequalificationEntry."Entry No") + '*' + Format(tbl_vendorPrequalificationEntry."Procurement Category Code") + '*' + Format(tbl_vendorPrequalificationEntry.Blocked) + '*' + Format(tbl_vendorPrequalificationEntry."Date Blocked") + '*' + Format(tbl_vendorPrequalificationEntry."Document No.") + ':';
            until tbl_vendorPrequalificationEntry.Next = 0;
        end;
    end;

    procedure fnGetProcurementSetup() data: Text
    begin
        tbl_procurementSetup.Reset();
        repeat
            //  data += /*tbl_procurementSetup."Terms and Conditions"*/''+ + ':';
            data += '';
        until tbl_procurementSetup.Next = 0;
        exit(data);
    end;

    procedure fnGetRFIPreqList(documentNumber: Code[20]) data: Text
    begin
        tbl_rfiPrequalificationCategory.Reset();
        tbl_rfiPrequalificationCategory.SetRange("Document No", documentNumber);
        if tbl_rfiPrequalificationCategory.FindSet(true) then begin
            repeat
                data += Format(tbl_rfiPrequalificationCategory."Prequalification Category ID") + '*' + Format(tbl_rfiPrequalificationCategory."Period Start Date") + '*' + tbl_rfiPrequalificationCategory.Description + '*' + Format(tbl_rfiPrequalificationCategory."Period End Date") + '*' + Format(tbl_rfiPrequalificationCategory."Submission Start Date") + '*' + Format(tbl_rfiPrequalificationCategory."Submission End Date") + '*' + Format(tbl_rfiPrequalificationCategory."Applicable Location") + '*' + Format(tbl_rfiPrequalificationCategory."Restricted RC Type") + '*' + Format(tbl_rfiPrequalificationCategory."Special Group Reservation") + '*' + Format(tbl_rfiPrequalificationCategory."Procurement Type") + ':';
            until tbl_rfiPrequalificationCategory.Next = 0;
        end;
        exit(data);

    end;

    procedure fnGetCompanySizeCodes() data: Text
    begin
        tbl_companySizeCodes.Reset();
        repeat
            data += Format(tbl_companySizeCodes.Code) + '*' + tbl_companySizeCodes.Description + '::::';
        until tbl_companySizeCodes.Next = 0;
        exit(data);
    end;

    procedure fnGetPostCodes() data: Text
    begin
        tbl_postCodes.Reset();
        repeat
            data += Format(tbl_postCodes.Code) + '*' + Format(tbl_postCodes.City) + '*' + Format(tbl_postCodes."Country/Region Code") + ':';
        until tbl_postCodes.Next = 0;
        exit(data);
    end;

    procedure fnGetResponsibilityCenters(operatingUnitType: Text) data: Text
    begin
        tbl_responsibilityCenter.Reset();
        if operatingUnitType = 'Region' then begin
            tbl_responsibilityCenter.SetRange("Operating Unit Type", tbl_responsibilityCenter."Operating Unit Type"::Region);
            if tbl_responsibilityCenter.FindSet(true) then begin
                repeat
                    data += Format(tbl_responsibilityCenter.Code) + '*' + tbl_responsibilityCenter.Name + ':';
                until tbl_responsibilityCenter.Next = 0;
            end;
            exit(data);
        end;

    end;

    // procedure fnGetBankBranches(bankCode: Code[20]) data: Text
    // begin
    //     tbl_employeeBankAccount.Reset();
    //     tbl_employeeBankAccount.SetRange(Code, bankCode);
    //     if tbl_employeeBankAccount.FindSet(true) then begin
    //         repeat
    //             data += Format(tbl_employeeBankAccount."Bank Name") + '*' + Format(tbl_employeeBankAccount."Branch Name") + '*' + Format(tbl_employeeBankAccount."Bank Branch No.") + ':';
    //         until tbl_employeeBankAccount.Next = 0;
    //     end;
    //     exit(data);
    // end;

    procedure fnGetBidResponseList(vendorNumber: Code[20]; procurementMethod: Text) data: Text
    begin
        tbl_purchaseHeader.Reset();
        if procurementMethod = 'Open Tender' then begin
            tbl_purchaseHeader.SetRange("PP Procurement Method", tbl_purchaseHeader."PP Procurement Method"::"Open Tender");
            tbl_purchaseHeader.SetRange("Buy-from Vendor No.", vendorNumber);
            if tbl_purchaseHeader.FindSet(true) then begin
                repeat
                    data += tbl_purchaseHeader."No." + '*' + Format(tbl_purchaseHeader."Document Status") + '*' + tbl_purchaseHeader."Pay-to Name" + '*' + Format(tbl_purchaseHeader."Invitation Notice Type") + '*' + Format(tbl_purchaseHeader."Due Date") + '*' + tbl_purchaseHeader."Invitation For Supply No" + '*' + Format(tbl_purchaseHeader.Status) + '*' + tbl_purchaseHeader."Tender Description" + ':';
                until tbl_purchaseHeader.Next = 0;
            end;
            exit(data);

        end else
            if procurementMethod = 'RFQ' then begin
                tbl_purchaseHeader.SetRange("PP Procurement Method", tbl_purchaseHeader."PP Procurement Method"::RFQ);
                tbl_purchaseHeader.SetRange("Buy-from Vendor No.", vendorNumber);
                if tbl_purchaseHeader.FindSet(true) then begin
                    repeat
                        data += tbl_purchaseHeader."No." + '*' + Format(tbl_purchaseHeader."Document Status") + '*' + tbl_purchaseHeader."Pay-to Name" + '*' + Format(tbl_purchaseHeader."Invitation Notice Type") + '*' + Format(tbl_purchaseHeader."Due Date") + '*' + tbl_purchaseHeader."Invitation For Supply No" + '*' + Format(tbl_purchaseHeader.Status) + '*' + tbl_purchaseHeader."Tender Description" + ':';
                    until tbl_purchaseHeader.Next = 0;
                end;
                exit(data);

            end;

    end;

    procedure fnGetOldPerformanceGuarantees(contractorId: Code[20]; documentType: Text) data: Text
    begin
        // tbl_insuranceGuaranteeHeader.Reset();
        // if documentType = 'Performance Guarantee' then begin
        //     tbl_insuranceGuaranteeHeader.SetRange("Contractor ID", contractorId);
        //     tbl_insuranceGuaranteeHeader.SetRange("Document Type", tbl_insuranceGuaranteeHeader."Document Type"::"Performance Guarantee");
        //     if tbl_insuranceGuaranteeHeader.FindSet(true) then begin
        //         repeat
        //             data += tbl_insuranceGuaranteeHeader."Document No." + '*' + Format(tbl_insuranceGuaranteeHeader."Document Date") + '*' + Format(tbl_insuranceGuaranteeHeader."Effective Date") + '*' + tbl_insuranceGuaranteeHeader."Contractor Name" + '*' + tbl_insuranceGuaranteeHeader."Project ID" + '*' + tbl_insuranceGuaranteeHeader."Project Name" + '*' + Format(tbl_insuranceGuaranteeHeader.Status) + '*' + tbl_insuranceGuaranteeHeader."Insurer/Guarantor Name" + '*' + tbl_insuranceGuaranteeHeader."Policy/Guarantee No" + ':';
        //         until tbl_insuranceGuaranteeHeader.Next = 0;
        //     end;
        //     Exit(data);

        // end;

    end;

    procedure fnGetVendorDepartmentEntry(vendorNumer: Code[20]) data: Text
    begin
        tbl_vendorDepartmentEntry.Reset();
        tbl_vendorDepartmentEntry.SetRange("Vendor No.", vendorNumer);
        if tbl_vendorDepartmentEntry.FindSet(true) then begin
            repeat
                data += Format(tbl_vendorDepartmentEntry."Entry no") + '*' + Format(tbl_vendorDepartmentEntry."Source Voucher No.") + '*' + Format(tbl_vendorDepartmentEntry."Document Type") + '*' + tbl_vendorDepartmentEntry."Reason Code" + '*' + tbl_vendorDepartmentEntry."Firm Name" + '*' + tbl_vendorDepartmentEntry."Reason Code" + '*' + tbl_vendorDepartmentEntry.Description + '*' + Format(tbl_vendorDepartmentEntry."Ineligibility End Date") + '*' + Format(tbl_vendorDepartmentEntry."Ineligibility Start Date") + '*' + Format(tbl_vendorDepartmentEntry."Reinstatement Date") + '*' + Format(tbl_vendorDepartmentEntry.Blocked) + '*' + Format(tbl_vendorDepartmentEntry."Country/Region Code") + '*' + tbl_vendorDepartmentEntry.Address + '*' + tbl_vendorDepartmentEntry."Incorporation/Reg No." + '*' + Format(tbl_vendorDepartmentEntry."Tax Registration (PIN) No.") + ':';
            until tbl_vendorDepartmentEntry.Next = 0;
        end;
        exit(data);
    end;

    procedure fnGetLanguage() data: Text
    begin
        tbl_language.Reset();
        repeat
            data += tbl_language.Code + '*' + tbl_language.Name + ':';
        until tbl_language.Next = 0;
        exit(data);
    end;

    procedure fnGetVendorSpecialGroupCategory() data: Text
    begin
        tbl_specialGroupCategory.Reset();
        repeat
            data += tbl_specialGroupCategory.Code + '*' + tbl_specialGroupCategory.Description + ':';
        until tbl_specialGroupCategory.Next = 0;
        exit(data);
    end;

    procedure fnGetSupplierCategory() data: Text
    begin
        tbl_supplierCategory.Reset();
        repeat
            data += tbl_supplierCategory."Category Code" + '*' + tbl_supplierCategory.Description + ':';
        until tbl_supplierCategory.Next = 0;
        exit(data);
    end;

    procedure fnGetIndustryGroup() data: Text
    begin
        tbl_industryGroup.Reset();
        repeat
            data += tbl_industryGroup.Code + '*' + tbl_industryGroup.Description + ':';
        until tbl_industryGroup.Next = 0;
        exit(data);
    end;

    procedure fnGetBusinessType() data: Text
    begin
        tbl_businessType.Reset();
        repeat
            data += tbl_businessType.Code + '*' + tbl_businessType.Description + '*' + Format(tbl_businessType."Ownership Type") + ':';
        until tbl_businessType.Next = 0;
        exit(data);
    end;

    procedure fnGetBankCodes() data: Text
    begin
        // tbl_bankList.Reset();
        // repeat
        //     data += tbl_bankList.Code + '*' + tbl_bankList."Bank Name" + ':';
        // until tbl_bankList.Next = 0;
        // Exit(data);
    end;

    procedure fnGetCurrency() data: Text
    begin
        tbl_currency.Reset();
        repeat
            data += tbl_currency.Code + '*' + tbl_currency.Description + ':';
        until tbl_currency.Next = 0;
        exit(data);
    end;

    // procedure fnGetRegions() data: Text
    // begin
    //     tbl_regions.Reset();
    //     repeat
    //         data += tbl_regions.Code + '*' + tbl_regions.Description + ':';
    //     until tbl_regions.Next = 0;
    //     exit(data);
    // end;

    procedure fnGetSupplierRegistrationPeriods() data: Text
    begin
        tbl_supplierRegistrationPeriods.Reset();
        repeat
            data += tbl_supplierRegistrationPeriods.Code + '*' + tbl_supplierRegistrationPeriods.Description + ':';
        until tbl_supplierRegistrationPeriods.Next = 0;
        exit(data);
    end;

    procedure fnGetPortalUser(email: Text; password: Text) data: Text
    begin
        tbl_dynasoftPortalUser.Reset();
        tbl_dynasoftPortalUser.SetRange("Authentication Email", email);
        tbl_dynasoftPortalUser.SetRange("Password Value", password);
        // tbl_dynasoftPortalUser.SetRange("Record Type", tbl_dynasoftPortalUser."Record Type"::Vendor);
        if tbl_dynasoftPortalUser.FindSet(true) then begin
            data := 'success*' + tbl_dynasoftPortalUser."Full Name" + '*' + tbl_dynasoftPortalUser."User Name" + '*' + tbl_dynasoftPortalUser."Mobile Phone No." + '*' + Format(tbl_dynasoftPortalUser.State) + '*' + tbl_dynasoftPortalUser."Authentication Email" + '*' + tbl_dynasoftPortalUser."Record ID" + '*' + Format(tbl_dynasoftPortalUser."Change Password");
        end else begin
            data := 'danger* User was not found';
        end;
    end;

    procedure fnGetJobTasks() data: Text
    begin
        tbl_jobTasks.Reset();
        repeat
        //  data += tbl_jobTasks."Job No." + '*' + tbl_jobTasks.Description + '*' + tbl_jobTasks."Department Code" + '*' + tbl_jobTasks."Directorate Code" + '*' + tbl_jobTasks.Division + '*' + Format(tbl_jobTasks.Commitments) + '*' + Format(tbl_jobTasks."Start Point(Km)") + '*' + Format(tbl_jobTasks."End Point(Km)") + '*' + Format(tbl_jobTasks."Start Date") + '*' + Format(tbl_jobTasks."End Date") + '*' + Format(tbl_jobTasks."Procurement Method") + '*' + tbl_jobTasks."Funding Source" + '*' + tbl_jobTasks."Surface Types" + '*' + Format(tbl_jobTasks."Road Condition") + '*' + Format(tbl_jobTasks."Completed Length(Km)") + '*' + Format(tbl_jobTasks."Roads Category") + '*' + Format(tbl_jobTasks."Fund Type") + '*' + Format(tbl_jobTasks."Execution Method") + '*' + Format(tbl_jobTasks."Global Dimension 1 Code") + '*' + Format(tbl_jobTasks."Global Dimension 2 Code") + '*' + tbl_jobTasks."Constituency ID" + '*' + Format(tbl_jobTasks."Job Task No.") + '*' + tbl_jobTasks."Constituency ID" + ':';
        until tbl_jobTasks.Next = 0;
        exit(data);

    end;

    procedure fnGetWEPContractorTeam(documentNumber: Code[20]; contractorNumber: Code[20]) data: Text
    begin
        // tbl_WEPContractorTeam.Reset();
        // tbl_WEPContractorTeam.SetRange("Document No", documentNumber);
        // tbl_WEPContractorTeam.SetRange("Contractor No.", contractorNumber);
        // if tbl_WEPContractorTeam.FindSet(true) then begin
        //     repeat
        //         data += tbl_WEPContractorTeam.Name + '*' + tbl_WEPContractorTeam.Address + '*' + Format(tbl_WEPContractorTeam."Address 2") + '*' + tbl_WEPContractorTeam.City + '*' + tbl_WEPContractorTeam."Post Code" + '*' + tbl_WEPContractorTeam."Country/Region Code" + '*' + tbl_WEPContractorTeam."Role Code" + '*' + tbl_WEPContractorTeam.Designation + '*' + Format(tbl_WEPContractorTeam."Effective Date") + '*' + Format(tbl_WEPContractorTeam."Expiry Date") + '*' + Format(tbl_WEPContractorTeam."Staff Category") + '*' + tbl_WEPContractorTeam."Contractor Staff No." + ':';
        //     until tbl_WEPContractorTeam.Next = 0;
        // end;
        // exit(data);
    end;

    // procedure fnGetWEPContractorEqquipment(documentNumber: Code[20]; contractorNumber: Code[20]) data: Text
    // begin
    //     tbl_WEPContractorEquipment.Reset();
    //     tbl_WEPContractorEquipment.SetRange("Document No.", documentNumber);
    //     tbl_WEPContractorEquipment.SetRange("Contractor No.", contractorNumber);
    //     if tbl_WEPContractorEquipment.FindSet(true) then begin
    //         repeat
    //             data += Format(tbl_WEPContractorEquipment."Document Type") + '*' + tbl_WEPContractorEquipment."Equipment Type Code" + '*' + tbl_WEPContractorEquipment.Description + '*' + Format(tbl_WEPContractorEquipment."Ownership Type") + '*' + tbl_WEPContractorEquipment."Equipment Serial No." + '*' + Format(tbl_WEPContractorEquipment."Equipment Usability Code") + '*' + Format(tbl_WEPContractorEquipment."Years of Previous Use") + '*' + Format(tbl_WEPContractorEquipment."Equipment Condition Code") + '*' + Format(tbl_WEPContractorEquipment."Equipment No.") + ':';
    //         until tbl_WEPContractorEquipment.Next = 0;
    //     end;
    //     exit(data);
    // end;

    // procedure fnGetWEPExecutionSchedule(documentNumber: Code[20]) data: Text
    // begin
    //     tbl_WEPExecutionSchedule.Reset();
    //     tbl_WEPExecutionSchedule.SetRange("Document No", documentNumber);
    //     if tbl_WEPExecutionSchedule.FindSet(true) then begin
    //         repeat
    //             data += tbl_WEPExecutionSchedule."Document No" + '*' + tbl_WEPExecutionSchedule."Job No" + '*' + Format(tbl_WEPExecutionSchedule."Scheduled End Date") + '*' + Format(tbl_WEPExecutionSchedule."Scheduled Start Date") + '*' + tbl_WEPExecutionSchedule.Description + '*' + Format(tbl_WEPExecutionSchedule."Budget (Total Cost)") + '*' + Format(tbl_WEPExecutionSchedule."Job Task Type") + '*' + Format(tbl_WEPExecutionSchedule."Job Task No") + ':';
    //         until tbl_WEPExecutionSchedule.Next = 0;
    //     end;
    //     exit(data);

    // end;

    // procedure fnGetProjectMobilizationHeader(vendorNumber: Code[20]; status: Text) data: Text
    // begin
    //     tbl_projectMobilizationHeader.Reset();
    //     if status = 'Released' then begin
    //         tbl_projectMobilizationHeader.SetRange("Contractor No.", vendorNumber);
    //         if tbl_projectMobilizationHeader.FindSet(true) then begin
    //             repeat
    //                 data += tbl_projectMobilizationHeader."Document No." + '*' + tbl_projectMobilizationHeader."Commencement Order ID" + '*' + tbl_projectMobilizationHeader.Description + '*' + tbl_projectMobilizationHeader."Project ID" + '*' + tbl_projectMobilizationHeader."Region ID" + '*' + Format(tbl_projectMobilizationHeader."Document Date") + '*' + tbl_projectMobilizationHeader."Purchase Contract ID" + '*' + tbl_projectMobilizationHeader."Contractor Name" + '*' + tbl_projectMobilizationHeader."Project Name" + '*' + tbl_projectMobilizationHeader."Road Code" + '*' + tbl_projectMobilizationHeader."Road Section No." + '*' + Format(tbl_projectMobilizationHeader."Project End  Date") + '*' + Format(tbl_projectMobilizationHeader."Project Start Date") + '*' + Format(tbl_projectMobilizationHeader.Status) + '*' + tbl_projectMobilizationHeader."Section Name" + '*' + tbl_projectMobilizationHeader."Directorate ID" + '*' + tbl_projectMobilizationHeader."Constituency ID" + '*' + tbl_projectMobilizationHeader."Department ID" + ':';
    //             until tbl_projectMobilizationHeader.Next = 0;
    //         end;
    //     end;
    // end;

    // procedure fnGetProjectStaffRoleCode() data: Text
    // begin
    //     // tbl_staffRoleCode.Reset();
    //     // repeat
    //     //     data += tbl_staffRoleCode."Staff Role Code" + '*' + tbl_staffRoleCode.Designation + ':';
    //     // until tbl_staffRoleCode.Next = 0;
    //     // Exit(data);

    // end;

    // procedure fnGetCommencementOrders(orderNumber: Code[20]) data: Text
    // begin
    //     tbl_projectMobilizationHeader.Reset();
    //     if orderNumber = '' then begin
    //         repeat
    //             data += tbl_projectMobilizationHeader."Document No." + '*' + tbl_projectMobilizationHeader."Commencement Order ID" + '*' + tbl_projectMobilizationHeader.Description + '*' + tbl_projectMobilizationHeader."Project ID" + '*' + tbl_projectMobilizationHeader."Region ID" + '*' + Format(tbl_projectMobilizationHeader."Document Date") + '*' + Format(tbl_projectMobilizationHeader."Purchase Contract ID") + '*' + tbl_projectMobilizationHeader."Contractor Name" + '*' + tbl_projectMobilizationHeader."Project Name" + '*' + Format(tbl_projectMobilizationHeader."Road Code") + '*' + tbl_projectMobilizationHeader."Road Section No." + '*' + Format(tbl_projectMobilizationHeader."Project Start Date") + '*' + Format(tbl_projectMobilizationHeader."Project End  Date") + '*' + Format(tbl_projectMobilizationHeader.Status) + '*' + tbl_projectMobilizationHeader."Staff Appointment Voucher No." + '*' + tbl_projectMobilizationHeader."Contractor No." + '*' + tbl_projectMobilizationHeader."Vendor Address" + '*' + Format(tbl_projectMobilizationHeader."Vendor Address 2") + '*' + tbl_projectMobilizationHeader."Vendor Post Code" + '*' + tbl_projectMobilizationHeader."Vendor City" + '*' + tbl_projectMobilizationHeader."Primary E-mail" + '*' + tbl_projectMobilizationHeader."IFS Code" + '*' + tbl_projectMobilizationHeader."Tender Name" + '*' + tbl_projectMobilizationHeader."Section Name" + '*' + tbl_projectMobilizationHeader."Region ID" + '*' + Format(tbl_projectMobilizationHeader."Directorate ID") + '*' + Format(tbl_projectMobilizationHeader."Department ID") + '*' + Format(tbl_projectMobilizationHeader."Purchase Contract ID") + '*' + Format(tbl_projectMobilizationHeader."Constituency ID") + '*' + tbl_projectMobilizationHeader."Contractor No." + '*' + tbl_projectMobilizationHeader."Notice of Award No." + ':';
    //         until tbl_projectMobilizationHeader.Next = 0;
    //         exit(data);
    //     end else begin
    //         tbl_projectMobilizationHeader.SetRange("Notice of Award No.", orderNumber);
    //         if tbl_projectMobilizationHeader.FindSet(true) then begin
    //             repeat
    //                 data += tbl_projectMobilizationHeader."Document No." + '*' + tbl_projectMobilizationHeader."Commencement Order ID" + '*' + tbl_projectMobilizationHeader.Description + '*' + tbl_projectMobilizationHeader."Project ID" + '*' + tbl_projectMobilizationHeader."Region ID" + '*' + Format(tbl_projectMobilizationHeader."Document Date") + '*' + Format(tbl_projectMobilizationHeader."Purchase Contract ID") + '*' + tbl_projectMobilizationHeader."Contractor Name" + '*' + tbl_projectMobilizationHeader."Project Name" + '*' + Format(tbl_projectMobilizationHeader."Road Code") + '*' + tbl_projectMobilizationHeader."Road Section No." + '*' + Format(tbl_projectMobilizationHeader."Project Start Date") + '*' + Format(tbl_projectMobilizationHeader."Project End  Date") + '*' + Format(tbl_projectMobilizationHeader.Status) + '*' + tbl_projectMobilizationHeader."Staff Appointment Voucher No." + '*' + tbl_projectMobilizationHeader."Contractor No." + '*' + tbl_projectMobilizationHeader."Vendor Address" + '*' + Format(tbl_projectMobilizationHeader."Vendor Address 2") + '*' + tbl_projectMobilizationHeader."Vendor Post Code" + '*' + tbl_projectMobilizationHeader."Vendor City" + '*' + tbl_projectMobilizationHeader."Primary E-mail" + '*' + tbl_projectMobilizationHeader."IFS Code" + '*' + tbl_projectMobilizationHeader."Tender Name" + '*' + tbl_projectMobilizationHeader."Section Name" + '*' + tbl_projectMobilizationHeader."Region ID" + '*' + Format(tbl_projectMobilizationHeader."Directorate ID") + '*' + Format(tbl_projectMobilizationHeader."Department ID") + '*' + Format(tbl_projectMobilizationHeader."Purchase Contract ID") + '*' + Format(tbl_projectMobilizationHeader."Constituency ID") + '*' + tbl_projectMobilizationHeader."Contractor No." + '*' + tbl_projectMobilizationHeader."Notice of Award No." + ':';
    //             until tbl_projectMobilizationHeader.Next = 0;
    //         end;
    //         exit(data);
    //     end;


    // end;

    // procedure fnGetJobPlanningLines(jobNumber: Code[20]) data: Text
    // begin
    //     tbl_jobPlanningLines.Reset();
    //     tbl_jobPlanningLines.SetRange("Job No.", jobNumber);
    //     if tbl_jobPlanningLines.FindSet(true) then begin
    //         repeat
    //             data += tbl_jobPlanningLines.Description + '*' + Format(tbl_jobPlanningLines."Line Amount (LCY)") + '*' + Format(tbl_jobPlanningLines."Unit Cost") + '*' + Format(tbl_jobPlanningLines."Total Cost") + '*' + Format(tbl_jobPlanningLines."Unit Price") + '*' + Format(tbl_jobPlanningLines."Total Price") + '*' + Format(tbl_jobPlanningLines."Line No.") + '*' + Format(tbl_jobPlanningLines."Job Task No.") + '*' + Format(tbl_jobPlanningLines."Planning Date") + '*' + Format(tbl_jobPlanningLines."Document Date") + '*' + Format(tbl_jobPlanningLines."Document No.") + '*' + Format(tbl_jobPlanningLines.Type) + '*' + Format(tbl_jobPlanningLines.Quantity) + '*' + Format(tbl_jobPlanningLines."Direct Unit Cost (LCY)") + '*' + Format(tbl_jobPlanningLines."Total Cost (LCY)") + '*' + Format(tbl_jobPlanningLines."Unit Cost (LCY)") + '*' + Format(tbl_jobPlanningLines."Line Amount") + '*' + Format(tbl_jobPlanningLines."Line Discount Amount") + '*' + Format(tbl_jobPlanningLines."Line Discount Amount (LCY)") + '*' + Format(tbl_jobPlanningLines."No.") + '*' + Format(tbl_jobPlanningLines."Road Activity Categories") + '*' + Format(tbl_jobPlanningLines."Unit of Measure Code") + ':';
    //         until tbl_jobPlanningLines.Next = 0;
    //     end;
    //     exit(data);

    // end;

    procedure fnGetPCORequiredDocument(noticeNumber: Code[20]) data: Text
    begin
        // tbl_pcoRequiredDocument.Reset();
        // tbl_pcoRequiredDocument.SetRange("Notice No.", noticeNumber);
        // if tbl_pcoRequiredDocument.FindSet(true) then begin
        //     repeat
        //         data += tbl_pcoRequiredDocument."Notice No." + '*' + tbl_pcoRequiredDocument.Description + '*' + Format(tbl_pcoRequiredDocument."Document Type") + '*' + Format(tbl_pcoRequiredDocument."Requirement Type") + '*' + Format(tbl_pcoRequiredDocument."Guidelines/Instructions") + '*' + Format(tbl_pcoRequiredDocument."Due Date") + ':';
        //     until tbl_pcoRequiredDocument.Next = 0;
        // end;
        // exit(data);
    end;

    procedure fnGetPCOPlannedMeeting(noticeNumber: Code[20]) data: Text
    begin
        // tbl_pcoPlannedMeeting.Reset();
        // tbl_pcoPlannedMeeting.SetRange("Notice No.", noticeNumber);
        // if tbl_pcoPlannedMeeting.FindSet(true) then begin
        //     repeat
        //         data += Format(tbl_pcoPlannedMeeting."Meeting Type") + '*' + tbl_pcoPlannedMeeting.Description + '*' + Format(tbl_pcoPlannedMeeting."Start Date") + '*' + Format(tbl_pcoPlannedMeeting."Start Time") + '*' + Format(tbl_pcoPlannedMeeting."End Date") + '*' + Format(tbl_pcoPlannedMeeting."End Time") + '*' + tbl_pcoPlannedMeeting."Venue/Location" + ':';
        //     until tbl_pcoPlannedMeeting.Next = 0;
        // end;
        // exit(data);
    end;

    procedure fnGetPCOInternalProjectTeam(orderNumber: Code[20]) data: Text
    begin
        // tbl_pcoInternalProjectTeam.Reset();
        // tbl_pcoInternalProjectTeam.SetRange("Commencement Order No.", orderNumber);
        // if tbl_pcoInternalProjectTeam.FindSet(true) then begin
        //     repeat
        //         data += Format(tbl_pcoInternalProjectTeam."Resource No.") + '*' + tbl_pcoInternalProjectTeam.Name + '*' + tbl_pcoInternalProjectTeam.Email + '*' + tbl_pcoInternalProjectTeam.Address + '*' + Format(tbl_pcoInternalProjectTeam."Address 2") + '*' + tbl_pcoInternalProjectTeam.City + '*' + Format(tbl_pcoInternalProjectTeam."Post Code") + '*' + Format(tbl_pcoInternalProjectTeam."Country/Region Code") + '*' + tbl_pcoInternalProjectTeam."Phone No." + '*' + Format(tbl_pcoInternalProjectTeam."Role Code") + '*' + Format(tbl_pcoInternalProjectTeam.Designation) + ':';
        //     until tbl_pcoInternalProjectTeam.Next = 0;
        // end;
        // Exit(data);
    end;

    // procedure fnGetProjectWorks(contractorNumber: Code[20]) data: Text
    // begin
    //     tbl_job.Reset();
    //     tbl_job.SetRange("Contractor No.", contractorNumber);
    //     if tbl_job.FindSet(true) then begin
    //         repeat
    //             data += tbl_job."No." + '*' + tbl_job."Road Section No" + '*' + tbl_job.Description + '*' + tbl_job."Description 2" + '*' + tbl_job."Bill-to Customer No." + '*' + Format(tbl_job."Creation Date") + '*' + Format(tbl_job."Ending Date") + '*' + Format(tbl_job.Status) + '*' + tbl_job."Person Responsible" + '*' + tbl_job."Project Manager" + '*' + Format(tbl_job."Project Budget") + '*' + Format(tbl_job."Actual Project Costs") + '*' + Format(tbl_job."Project Start Date") + '*' + Format(tbl_job."Project End Date") + '*' + Format(tbl_job."Road Length(KM)") + '*' + Format(tbl_job."Funding Source") + '*' + Format(tbl_job."Project Category") + '*' + Format(tbl_job."Road Project Category") + '*' + Format(tbl_job."Road Class ID") + '*' + Format(tbl_job."Section Name") + '*' + Format(tbl_job."County ID") + '*' + Format(tbl_job."Region ID") + '*' + Format(tbl_job."Section Start Chainage(Km)") + '*' + Format(tbl_job."Section End Chainage(KM)") + '*' + Format(tbl_job."Total Road Section Length (KM)") + '*' + Format(tbl_job."Contract Start Date") + '*' + Format(tbl_job."Contract End Date") + '*' + tbl_job."Contractor Name" + '*' + Format(tbl_job."Notice of Award Date") + '*' + Format(tbl_job."IFS Code") + '*' + tbl_job."Project Commencement Order" + Format(tbl_job."Road Works Category") + '*' + tbl_job."Search Description" + '*' + tbl_job."Road Project Sub-Category" + '*' + Format(tbl_job."Road Project Type") + '*' + tbl_job."Road Code" + '*' + Format(tbl_job."Record Type") + ':';
    //         until tbl_job.Next = 0;
    //     end;
    //     exit(data);

    // end;

    procedure fnGetRoadInventory(roadCode: Code[20]) data: Text
    begin
        // tbl_roadInventory.Reset();
        // if roadCode = '' then begin
        //     repeat
        //         data += tbl_roadInventory."Link Name" + '*' + Format(tbl_roadInventory."Road Category") + '*' + Format(tbl_roadInventory."Carriageway Type") + '*' + Format(tbl_roadInventory."Primary County ID") + '*' + Format(tbl_roadInventory."Start Chainage(KM)") + '*' + Format(tbl_roadInventory."End Chainage(KM)") + '*' + Format(tbl_roadInventory."Gazetted Road Length (KMs)") + '*' + Format(tbl_roadInventory."No. of Road Sections") + '*' + Format(tbl_roadInventory."General Road Surface Condition") + '*' + Format(tbl_roadInventory."Start Point Latitude") + '*' + Format(tbl_roadInventory."Start Point Longitude") + '*' + Format(tbl_roadInventory."End Point Latitude") + '*' + Format(tbl_roadInventory."End Point Longitude") + '*' + Format(tbl_roadInventory."Paved Road Length (Km)") + '*' + Format(tbl_roadInventory."Paved Road Length %") + '*' + Format(tbl_roadInventory."Unpaved Road Length %") + '*' + Format(tbl_roadInventory."Original Road Agency") + '*' + Format(tbl_roadInventory."Road Code") + ':';
        //     until tbl_roadInventory.Next = 0;
        //     Exit(data);
        // end else begin
        //     tbl_roadInventory.SetRange("Road Code", roadCode);
        //     if tbl_roadInventory.FindSet(true) then begin
        //         repeat
        //             data += tbl_roadInventory."Link Name" + '*' + Format(tbl_roadInventory."Road Category") + '*' + Format(tbl_roadInventory."Carriageway Type") + '*' + Format(tbl_roadInventory."Primary County ID") + '*' + Format(tbl_roadInventory."Start Chainage(KM)") + '*' + Format(tbl_roadInventory."End Chainage(KM)") + '*' + Format(tbl_roadInventory."Gazetted Road Length (KMs)") + '*' + Format(tbl_roadInventory."No. of Road Sections") + '*' + Format(tbl_roadInventory."General Road Surface Condition") + '*' + Format(tbl_roadInventory."Start Point Latitude") + '*' + Format(tbl_roadInventory."Start Point Longitude") + '*' + Format(tbl_roadInventory."End Point Latitude") + '*' + Format(tbl_roadInventory."End Point Longitude") + '*' + Format(tbl_roadInventory."Paved Road Length (Km)") + '*' + Format(tbl_roadInventory."Paved Road Length %") + '*' + Format(tbl_roadInventory."Unpaved Road Length %") + '*' + Format(tbl_roadInventory."Original Road Agency") + '*' + Format(tbl_roadInventory."Road Code") + ':';
        //         until tbl_roadInventory.Next = 0;
        //     end;
        //     Exit(data);
        // end;

    end;

    procedure fnGetPavementSurfaceEntry(roadCode: Code[20]) data: Text
    begin
        // tbl_pavementSurfaceEntry.Reset();
        // tbl_pavementSurfaceEntry.SetRange("Road Code", roadCode);
        // if tbl_pavementSurfaceEntry.FindSet(true) then begin
        //     repeat
        //         data += Format(tbl_pavementSurfaceEntry."Enrty No") + '*' + Format(tbl_pavementSurfaceEntry."Posting Date") + '*' + Format(tbl_pavementSurfaceEntry."Pavement Category") + '*' + Format(tbl_pavementSurfaceEntry."Document No") + '*' + Format(tbl_pavementSurfaceEntry."Road Code") + '*' + Format(tbl_pavementSurfaceEntry."Pavement Surface Type") + '*' + Format(tbl_pavementSurfaceEntry."Start Chainage") + '*' + Format(tbl_pavementSurfaceEntry."End Chainage") + '*' + Format(tbl_pavementSurfaceEntry."Road Length (Kms)") + '*' + Format(tbl_pavementSurfaceEntry."Road Class ID") + '*' + Format(tbl_pavementSurfaceEntry."Constituency ID") + '*' + Format(tbl_pavementSurfaceEntry."County ID") + '*' + Format(tbl_pavementSurfaceEntry."Region ID") + '*' + Format(tbl_pavementSurfaceEntry."Road Section No.") + ':';
        //     until tbl_pavementSurfaceEntry.Next = 0;
        // end;
        // Exit(data);
    end;

    // procedure fnGetRoadSections(roadCode: Code[20]) data: Text
    // begin
    //     tbl_roadSections.reset();
    //     tbl_roadSections.SetRange("Road Code", roadCode);
    //     if tbl_roadSections.FindSet(true) then begin
    //         repeat
    //         //data += Format(tbl_roadSections."Road Section No.") + '*' + Format(tbl_roadSections."Road Category") + '*' + Format(tbl_roadSections."Carriageway Type") + '*' + Format(tbl_roadSections."Primary Constituency ID") + '*' + Format(tbl_roadSections."Primary Region ID") + '*' + Format(tbl_roadSections."Start Chainage(KM)") + '*' + Format(tbl_roadSections."End Chainage(KM)") + '*' + Format(tbl_roadSections."Total Road Length (KMs)") + '*' + Format(tbl_roadSections."Start Point Latitude") + '*' + Format(tbl_roadSections."Start Point Longitude") + '*' + Format(tbl_roadSections."End Point Latitude") + '*' + Format(tbl_roadSections."End Point Longitude") + '*' + Format(tbl_roadSections."Paved Road Length (Km)") + '*' + Format(tbl_roadSections."Unpaved Road Length %") + ':';
    //         until tbl_roadSections.Next = 0;
    //     end;
    //     exit(data);
    // end;

    procedure fnGetRoadEnviron() data: Text
    begin
        // tbl_roadEnvironEntry.Reset();
        // repeat
        //     data += Format(tbl_roadEnvironEntry."Road Environ Category") + '*' + Format(tbl_roadEnvironEntry.Description) + '*' + Format(tbl_roadEnvironEntry."Road Code") + '*' + Format(tbl_roadEnvironEntry."Road Section No.") + '*' + Format(tbl_roadEnvironEntry."Connected to Road Link") + '*' + Format(tbl_roadEnvironEntry."Location Details") + '*' + Format(tbl_roadEnvironEntry."Road Class ID") + '*' + Format(tbl_roadEnvironEntry."Constituency ID") + '*' + Format(tbl_roadEnvironEntry."Region ID") + ':';
        // until tbl_roadEnvironEntry.Next = 0;
        // exit(data);
    end;

    procedure fnGetMeasurements(contractorNumber: Code[20]) data: Text
    begin
        // tbl_measurements.Reset();
        // tbl_measurements.SetRange("Contractor No", contractorNumber);
        // if tbl_measurements.FindSet(true) then begin
        //     repeat
        //         data += Format(tbl_measurements.Status) + '*' + Format(tbl_measurements."Portal Status") + '*' + Format(tbl_measurements."Document Date") + '*' + Format(tbl_measurements."Project ID") + '*' + Format(tbl_measurements.Description) + '*' + Format(tbl_measurements."Works Start Chainage") + '*' + Format(tbl_measurements."Works End Chainage") + '*' + tbl_measurements."Contractor No" + '*' + tbl_measurements."Contractor Name" + '*' + tbl_measurements."Project Name" + '*' + Format(tbl_measurements."Road Section No.") + '*' + Format(tbl_measurements."Project Start Date") + '*' + Format(tbl_measurements."Region ID") + '*' + Format(tbl_measurements."Directorate ID") + '*' + Format(tbl_measurements."Constituency ID") + '*' + Format(tbl_measurements."Document No.") + ':';
        //     until tbl_measurements.Next = 0;
        // end;
        // exit(data);


    end;

    procedure fnGetBidScoringTemplate(bidtemplate: Code[20]) data: Text
    begin
        tbl_bidScoringTemplate.Reset();
        tbl_bidScoringTemplate.SetRange(code, bidtemplate);
        if tbl_bidScoringTemplate.FindSet(true) then begin
            repeat
                data += tbl_bidScoringTemplate.Code + '*' + Format(tbl_bidScoringTemplate."Template type") + '*' + Format(tbl_bidScoringTemplate."Document No") + '*' + tbl_bidScoringTemplate.Description + '*' + Format(tbl_bidScoringTemplate."Default YES Bid Rating Score %") + '*' + Format(tbl_bidScoringTemplate."Default Procurement Type") + '*' + Format(tbl_bidScoringTemplate."Total Preliminary Checks Score") + '*' + Format(tbl_bidScoringTemplate."Total Technical Evaluation %") + '*' + Format(tbl_bidScoringTemplate."Total Financial Evaluation") + '*' + Format(tbl_bidScoringTemplate."1-POOR Option Text Bid Score %") + '*' + Format(tbl_bidScoringTemplate."2-FAIR Option Text Bid Score %") + '*' + Format(tbl_bidScoringTemplate."3-GOOD Option Text Bid Score %") + '*' + Format(tbl_bidScoringTemplate."4-VERY GOOD  Text Bid Score %") + '*' + Format(tbl_bidScoringTemplate."5-EXCELLENT Text Bid Score %") + '*' + Format(tbl_bidScoringTemplate."Total Assigned Score/Weight %") + '*' + Format(tbl_bidScoringTemplate."NO Bid Rating Response Value") + '::::';
            until tbl_bidScoringTemplate.Next = 0;

        end;
        exit(data);
    end;

    procedure fnGetIFSRequiredEquipment(tenderNumber: Code[20]) data: Text
    begin
        tbl_ifsRequiredEquipment.Reset();
        tbl_ifsRequiredEquipment.SetRange("Document No", tenderNumber);
        if tbl_ifsRequiredEquipment.FindSet(true) then begin
            repeat
                data += Format(tbl_ifsRequiredEquipment."Document No") + '*' + Format(tbl_ifsRequiredEquipment."Equipment Type Code") + '*' + Format(tbl_ifsRequiredEquipment.Description) + '*' + Format(tbl_ifsRequiredEquipment.Category) + '*' + Format(tbl_ifsRequiredEquipment."Minimum Required Qty") + ':';
            until tbl_ifsRequiredEquipment.Next = 0;

        end;
        exit(data);

    end;

    procedure fnGetBidLitigationHistory(vendorNumber: Code[20]) data: Text
    begin
        tbl_bidLitigationHistory.Reset();
        tbl_bidLitigationHistory.SetRange("Vendor No.", vendorNumber);
        if tbl_bidLitigationHistory.FindSet(true) then begin
            repeat
                data += Format(tbl_bidLitigationHistory."Entry No.") + '*' + Format(tbl_bidLitigationHistory."Dispute Matter") + '*' + Format(tbl_bidLitigationHistory."Category of Matter") + '*' + Format(tbl_bidLitigationHistory.Year) + '*' + Format(tbl_bidLitigationHistory."Other Dispute Party") + '*' + Format(tbl_bidLitigationHistory."Dispute Amount LCY") + '*' + Format(tbl_bidLitigationHistory."Award Type") + ':';
            until tbl_bidLitigationHistory.Next = 0;
        end;
        exit(data);
    end;

    procedure fnGetTenders() data: Text
    begin
        tbl_standardPurchaseCode.Reset();
        repeat
            data += tbl_standardPurchaseCode.Code + '*' + tbl_standardPurchaseCode."Tender Name" + '*' + tbl_standardPurchaseCode."Tender Summary" + '*' + tbl_standardPurchaseCode.Description + ':';
        until tbl_standardPurchaseCode.Next = 0;
        exit(data);

    end;

    procedure fnGetBidKeyStaffDetails(responseNumber: code[20]) data: Text
    begin
        tbl_bidKeyStaff.Reset();
        tbl_bidKeyStaff.SetRange("No.", responseNumber);
        if tbl_bidKeyStaff.FindSet(true) then begin
            repeat
                data += Format(tbl_bidKeyStaff."Staff Category") + '*' + Format(tbl_bidKeyStaff."Staff Name") + '*' + Format(tbl_bidKeyStaff."Proposed Project Role ID") + '*' + Format(tbl_bidKeyStaff."Required Project Role") + '*' + Format(tbl_bidKeyStaff."E-Mail") + '*' + Format(tbl_bidKeyStaff."Employment Type") + '::::';
            until tbl_bidKeyStaff.Next = 0;
        end;


    end;

    // procedure fnGetBankBranch(bankCode: Code[20]) data: Text
    // begin
    //     tbl_employeeBankAccount.Reset();
    //     tbl_employeeBankAccount.SetRange(Code, bankCode);
    //     if tbl_employeeBankAccount.FindSet(true) then begin
    //         repeat
    //             data += tbl_employeeBankAccount."Bank Branch No." + '*' + tbl_employeeBankAccount."Branch Name" + '::::';
    //         until tbl_employeeBankAccount.Next = 0;
    //     end;
    //     exit(data);
    // end;


}