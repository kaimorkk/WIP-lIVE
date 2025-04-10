codeunit 95000 "Risk Management"
{

    trigger OnRun()
    begin
    end;

    var
        NoSeriesManagement: Codeunit NoSeriesManagement;
        RiskManagementFramework: Record "Risk Management Framework";
        AuditAssuranceSetup: Record "Audit & Assurance Setup";

    procedure FnCopyRiskManagementPlanDocument(RiskMgtPlan: Record "Risk Management Plan"; RiskMgtLine: Record "Risk Management Plan Line"; DocumentType: Option " ",Corporate,"Functional (Directorate)","Functional (Department)","Functional (Region)",Project; NoSeries: Code[50])
    var
        RiskManagementPlan: Record "Risk Management Plan";
        RiskManagementPlanLine: Record "Risk Management Plan Line";
    begin
        RiskMgtPlan.Get(DocumentType, RiskMgtPlan."Document No");
        RiskManagementFramework.Get;
        RiskManagementFramework.Get;
        RiskManagementPlan.Init;
        RiskManagementPlan.TransferFields(RiskMgtPlan);
        RiskManagementPlan."Document Type" := DocumentType;
        case DocumentType of
            Documenttype::Corporate:
                begin
                    NoSeries := RiskManagementFramework."Corporate Risk Mgt Plan Nos.";
                end;
            Documenttype::"Functional (Directorate)":
                begin
                    NoSeries := RiskManagementFramework."Directorate Risk Mgt Plan Nos.";
                end;
            Documenttype::"Functional (Department)":
                begin
                    NoSeries := RiskManagementFramework."Departmenta Risk Mgt Plan Nos.";
                end;

            Documenttype::"Functional (Region)":
                begin
                    NoSeries := RiskManagementFramework."Regional Risk Mgt Plan Nos.";
                end;
            Documenttype::Project:
                begin
                    NoSeries := RiskManagementFramework."Project Risk Mgt Plan Nos.";
                end;
        end;
        RiskManagementPlan."Document No" := NoSeriesManagement.GetNextNo(NoSeries, Today, true);
        RiskManagementPlan."Document Date" := Today;
        RiskManagementPlan.Status := RiskManagementPlan.Status::Open;
        RiskManagementPlan."Created By" := UserId;
        RiskManagementPlan."Created Date Time" := CreateDatetime(Today, Time);
        RiskManagementPlan.Insert;

        RiskMgtLine.Reset;
        RiskMgtLine.SetRange(RiskMgtLine."Document No", RiskMgtPlan."Document No");
        if RiskMgtLine.FindSet then
            repeat
                RiskManagementPlanLine.Init;
                RiskManagementPlanLine.TransferFields(RiskMgtLine);
                RiskManagementPlanLine."Document Type" := DocumentType;
                RiskManagementPlanLine."Document No" := RiskManagementPlan."Document No";
                RiskManagementPlanLine.Insert(true);
            until RiskMgtLine.Next = 0;
        Message('Document Copied successfully and RMP %1 created', RiskManagementPlan."Document No");
    end;


    procedure FnUpdateRMPFromNRV(ObjRMPLine: Record "Risk Management Plan Line"; ObjNRVH: Record "Risk M&E Header"; ObjNRVLine: Record "New Risk Voucher Line"; ObjRSRLine: Record "Risk Status Report Line")
    begin
        ObjNRVLine.Reset;
        ObjNRVLine.SetRange(ObjNRVLine."Document No", ObjNRVH."Document No");
        if ObjNRVLine.FindSet then begin
            repeat
                ObjRMPLine.Init;
                ObjRMPLine."Document Type" := ObjNRVH."Risk Register Type";
                ObjRMPLine."Document No" := ObjNRVH."Risk Management Plan ID";
                ObjRMPLine."Risk ID" := ObjNRVLine."Risk ID";
                ObjRMPLine."Risk Category" := ObjNRVLine."Risk Category";
                ObjRMPLine."Risk Title" := ObjNRVLine."Risk Title";
                ObjRMPLine."Risk Source ID" := ObjNRVLine."Risk Source ID";
                ObjRMPLine."Risk Likelihood Code" := ObjNRVLine."Risk Likelihood Code";
                ObjRMPLine."Risk Impact Code" := ObjNRVLine."Risk Impact Code";
                ObjRMPLine."Risk Impact Type" := ObjNRVLine."Risk Impact Type";
                ObjRMPLine."Estimate Fin. Impact (LCY)" := ObjNRVLine."Estimate Fin. Impact (LCY)";
                ObjRMPLine."Estimate Delay Impact (Days)" := ObjNRVLine."Estimate Delay Impact (Days)";
                ObjRMPLine."Gen. Risk Response Strategy" := ObjNRVLine."Gen. Risk Response Strategy";
                ObjRMPLine."Date Raised" := ObjNRVLine."Date Raised";
                ObjRMPLine."Risk Status" := ObjNRVLine."Risk Status";
                ObjRMPLine."Date Closed" := Today;
                ObjRMPLine."Risk Likelihood Rate Scale ID" := ObjNRVLine."Risk Likelihood Rate Scale ID";
                ObjRMPLine."Risk Impact Rating Scale ID" := ObjNRVLine."Risk Impact Rating Scale ID";
                ObjRMPLine."Overall Risk Rating Scale ID" := ObjNRVLine."Overall Risk Rating Scale ID";
                ObjRMPLine."Risk Appetite Rating Scale ID" := ObjNRVLine."Risk Appetite Rating Scale ID";
                ObjRMPLine."Risk Likelihood Rating" := ObjNRVLine."Risk Likelihood Rating";
                ObjRMPLine."Risk Impact Rating" := ObjNRVLine."Risk Impact Rating";
                ObjRMPLine."Overal Risk Rating" := ObjNRVLine."Overal Risk Rating";
                ObjRMPLine."Overall Risk Level Code" := ObjNRVLine."Overall Risk Level Code";
                ObjRMPLine."Risk Heat Zone" := ObjNRVLine."Risk Heat Zone";
                ObjRMPLine."New Risk Voucher ID" := ObjNRVH."Document No";
                if not ObjRMPLine.Insert(true) then
                    ObjRMPLine.Modify(true);
            until ObjNRVLine.Next = 0;
            //  ObjNRVH.Posted:=TRUE;
            //  ObjNRVH."Posting Date":=TODAY;
            //  ObjNRVH.MODIFY;
        end;
    end;


    procedure FnUpdateRiskOwnership(RiskMEHeader: Record "Risk M&E Header")
    var
        RMPLineRiskOwnership: Record "RMP Line Risk Ownership";
        NewRiskVoucherLine: Record "New Risk Voucher Line";
        RiskStatusReportLine: Record "Risk Status Report Line";
        NewRiskLineOwnership: Record "RMP Line Risk Ownership";
    begin

        NewRiskLineOwnership.Reset;
        NewRiskLineOwnership.SetRange(NewRiskLineOwnership."Document No", NewRiskVoucherLine."Document No");
        if NewRiskLineOwnership.FindSet then begin
            repeat
                RMPLineRiskOwnership.Reset;
                RMPLineRiskOwnership.SetRange("Document No", RiskMEHeader."Risk Management Plan ID");
                RMPLineRiskOwnership.SetRange("Risk ID", NewRiskLineOwnership."Risk ID");
                RMPLineRiskOwnership.SetRange("Document Type", RiskMEHeader."Risk Register Type");
                RMPLineRiskOwnership.SetRange("Responsibility Center ID", NewRiskLineOwnership."Responsibility Center ID");
                RMPLineRiskOwnership.SetRange("Entry No", NewRiskLineOwnership."Entry No");
                if RMPLineRiskOwnership.FindSet then begin
                    RMPLineRiskOwnership.Desciption := NewRiskLineOwnership.Desciption;
                    RMPLineRiskOwnership."Responsible Officer No." := NewRiskLineOwnership."Responsible Officer No.";
                    RMPLineRiskOwnership.Modify(true);
                end else begin
                    RMPLineRiskOwnership.Init;
                    RMPLineRiskOwnership."Document Type" := RiskMEHeader."Risk Register Type";
                    RMPLineRiskOwnership."Document No" := RiskMEHeader."Risk Management Plan ID";
                    RMPLineRiskOwnership."Risk ID" := NewRiskLineOwnership."Risk ID";
                    RMPLineRiskOwnership."Entry No" := NewRiskLineOwnership."Entry No";
                    RMPLineRiskOwnership."Responsibility Center ID" := NewRiskLineOwnership."Responsibility Center ID";
                    RMPLineRiskOwnership.Desciption := NewRiskLineOwnership.Desciption;
                    RMPLineRiskOwnership."Responsible Officer No." := NewRiskLineOwnership."Responsible Officer No.";
                    RMPLineRiskOwnership.Insert(true);
                end;

            until NewRiskLineOwnership.Next = 0;
        end;
    end;


    procedure FnUpdateRiskResponseActions(RiskMEHeader: Record "Risk M&E Header"; NewRiskVoucherLine: Record "New Risk Voucher Line"; RiskStatusReportLine: Record "Risk Status Report Line"; NewRiskLineResponseAction: Record "New Risk Line Resp. Action")
    var
        RMPLineRiskOwnership: Record "RMP Line Risk Ownership";
        RMPLineResponseAction: Record "RMP Line Response Action";
        RiskManagementPlanLine: Record "Risk Management Plan Line";
        RMPLine: Record "Risk Management Plan Line";
        ORMPLine: Record "Risk Management Plan Line";
        OldRiskManPlan: Record "Risk Management Plan";
        NewRiskManPlan: Record "Risk Management Plan";
        NoSeriesManagement: Codeunit NoSeriesManagement;
        RiskManagementFramework: Record "Risk Management Framework";
        NRiskRating: Record "Residual Risk Rating";
        ORiskRating: Record "Residual Risk Rating";
        RMPLineRes: Record "RMP Line Response Action";
        ORMPLineRes: Record "RMP Line Response Action";
        ORMPLineRiskOwnership: Record "RMP Line Risk Ownership";
    begin
        NewRiskVoucherLine.Reset;
        NewRiskVoucherLine.SetRange(NewRiskVoucherLine."Document No", RiskMEHeader."Document No");
        if NewRiskVoucherLine.FindSet then begin
            NewRiskLineResponseAction.Reset;
            NewRiskLineResponseAction.SetRange(NewRiskLineResponseAction."Document No", NewRiskVoucherLine."Document No");
            if NewRiskLineResponseAction.FindSet then
                repeat
                    RMPLineResponseAction.Init;
                    RMPLineResponseAction."Document Type" := RiskMEHeader."Risk Register Type";
                    RMPLineResponseAction."Document No" := RiskMEHeader."Risk Management Plan ID";
                    RMPLineResponseAction."Risk ID" := NewRiskLineResponseAction."Risk ID";
                    RMPLineResponseAction."Action ID" := NewRiskLineResponseAction."Action ID";
                    RMPLineResponseAction."Responsible Officer No." := NewRiskLineResponseAction."Responsible Officer No.";
                    RMPLineResponseAction."Action Status" := NewRiskLineResponseAction."Action Status";
                    RMPLineResponseAction."Percentage Complete" := NewRiskLineResponseAction."Percentage Complete";//Change to the correct date and add the missing fields
                    if not RMPLineResponseAction.Insert(true) then
                        RMPLineResponseAction.Modify(true);
                until NewRiskLineResponseAction.Next = 0;
        end;
        ORMPLineRes.SetRange(ORMPLineRes."Document No", RiskManagementPlanLine."Document No");
        //ORMPLineRes.SETRANGE(ORMPLineRes."Document Type","Document Type");
        if ORMPLineRes.FindSet then
            repeat
                RMPLineRes.TransferFields(ORMPLineRes);
                RMPLineRes."Document No" := RiskMEHeader."Document No";
                RMPLineRes."Document Type" := RiskMEHeader."Document Type";
                if not RMPLineRes.Insert(true) then
                    RMPLineRes.Modify;
            until ORMPLineRes.Next = 0;
        ORiskRating.Reset;
        ORiskRating.SetRange(ORiskRating."Document No", RiskManagementPlanLine."Document No");
        //ORiskRating.SETRANGE(ORiskRating."Document Type","Document Type");
        if ORiskRating.FindSet then
            repeat
                NRiskRating.TransferFields(ORiskRating);
                NRiskRating."Document No" := RiskMEHeader."Document No";
                NRiskRating."Document Type" := RiskMEHeader."Document Type";
                if not NRiskRating.Insert(true) then
                    NRiskRating.Modify;
            until ORiskRating.Next = 0;
        ORMPLineRiskOwnership.Reset;
        ORMPLineRiskOwnership.SetRange(ORMPLineRiskOwnership."Document No", RiskManagementPlanLine."Document No");
        //ORMPLineRiskOwnership.SETRANGE(ORMPLineRiskOwnership."Document Type","Document Type");
        if ORMPLineRiskOwnership.FindSet then
            repeat
                RMPLineRiskOwnership.TransferFields(ORMPLineRiskOwnership);
                RMPLineRiskOwnership."Document No" := RiskMEHeader."Document No";
                RMPLineRiskOwnership."Document Type" := RiskMEHeader."Document Type";
                if not RMPLineRiskOwnership.Insert(true) then
                    RMPLineRiskOwnership.Modify;
            until ORMPLineRiskOwnership.Next = 0;
    end;


    procedure FnUpdateJobTasks(RiskMEHeader: Record "Risk M&E Header"; NewRiskVoucherLine: Record "New Risk Voucher Line"; RiskStatusReportLine: Record "Risk Status Report Line"; NewRiskLineJobTask: Record "New Risk Line Job Task")
    var
        RMPLineRiskOwnership: Record "RMP Line Risk Ownership";
        RMPLineResponseAction: Record "RMP Line Response Action";
        RMPLineJobTask: Record "RMP Line Job Task";
    begin
        NewRiskVoucherLine.Reset;
        NewRiskVoucherLine.SetRange(NewRiskVoucherLine."Document No", RiskMEHeader."Document No");
        if NewRiskVoucherLine.FindSet then begin
            NewRiskLineJobTask.Reset;
            NewRiskLineJobTask.SetRange(NewRiskLineJobTask."Document No", NewRiskVoucherLine."Document No");
            if NewRiskLineJobTask.FindSet then
                repeat
                    RMPLineJobTask.Init;
                    RMPLineJobTask."Document Type" := RiskMEHeader."Risk Register Type";
                    RMPLineJobTask."Document No" := RiskMEHeader."Risk Management Plan ID";
                    RMPLineJobTask."Risk ID" := NewRiskLineJobTask."Risk ID";
                    RMPLineJobTask."Job No" := NewRiskLineJobTask."Job No";
                    RMPLineJobTask."Job Task No" := NewRiskLineJobTask."Job Task No";
                    RMPLineJobTask.Description := NewRiskLineJobTask.Description;
                    if not RMPLineJobTask.Insert(true) then
                        RMPLineJobTask.Modify(true);
                until NewRiskLineJobTask.Next = 0;
        end;
    end;


    procedure FnSuggestOpenRisks(RiskStatusReportLine: Record "Risk Status Report Line"; RiskMEHeader: Record "Risk M&E Header")
    var
        RiskManagementPlanLine: Record "Risk Management Plan Line";
        RMPLine: Record "Risk Management Plan Line";
        ORMPLine: Record "Risk Management Plan Line";
        OldRiskManPlan: Record "Risk Management Plan";
        NewRiskManPlan: Record "Risk Management Plan";
        NoSeriesManagement: Codeunit NoSeriesManagement;
        RiskManagementFramework: Record "Risk Management Framework";
        NRiskRating: Record "Residual Risk Rating";
        ORiskRating: Record "Residual Risk Rating";
        RMPLineRes: Record "RMP Line Response Action";
        ORMPLineRes: Record "RMP Line Response Action";
        RMPLineRiskOwnership: Record "RMP Line Risk Ownership";
        ORMPLineRiskOwnership: Record "RMP Line Risk Ownership";
    begin
        RiskManagementPlanLine.Reset;
        RiskManagementPlanLine.SetRange(RiskManagementPlanLine."Document No", RiskMEHeader."Risk Management Plan ID");
        RiskManagementPlanLine.SetRange(RiskManagementPlanLine."Risk Status", RiskManagementPlanLine."risk status"::Open);
        if RiskManagementPlanLine.FindSet then begin
            repeat
                RiskStatusReportLine.Init;
                RiskStatusReportLine."Document Type" := RiskMEHeader."Document Type";
                RiskStatusReportLine."Document No" := RiskMEHeader."Document No";
                RiskStatusReportLine."Risk Management Plan ID" := RiskMEHeader."Risk Management Plan ID";
                RiskStatusReportLine."Risk ID" := RiskManagementPlanLine."Risk ID";
                RiskStatusReportLine."Risk Title" := RiskManagementPlanLine."Risk Title";
                RiskStatusReportLine."Risk Likelihood Code" := RiskManagementPlanLine."Risk Likelihood Code";
                RiskStatusReportLine."Risk Impact Code" := RiskManagementPlanLine."Risk Impact Code";
                RiskStatusReportLine."Risk Impact Type" := RiskManagementPlanLine."Risk Impact Type";
                RiskStatusReportLine."Gen. Risk Response Strategy" := RiskManagementPlanLine."Gen. Risk Response Strategy";
                RiskStatusReportLine."Risk Status" := RiskManagementPlanLine."Risk Status";
                RiskStatusReportLine."Date Closed" := RiskManagementPlanLine."Date Closed";
                RiskStatusReportLine."Risk Likelihood Rate Scale ID" := RiskManagementPlanLine."Risk Likelihood Rate Scale ID";
                RiskStatusReportLine."Risk Impact Rating Scale ID" := RiskManagementPlanLine."Risk Impact Rating Scale ID";
                RiskStatusReportLine."Risk Appetite Rating Scale ID" := RiskManagementPlanLine."Risk Appetite Rating Scale ID";
                RiskStatusReportLine."Overall Risk Rating Scale ID" := RiskManagementPlanLine."Overall Risk Rating Scale ID";
                RiskStatusReportLine."Risk Likelihood Rating" := RiskManagementPlanLine."Risk Likelihood Rating";
                RiskStatusReportLine."Risk Impact Rating" := RiskManagementPlanLine."Risk Impact Rating";
                RiskStatusReportLine."Overal Risk Rating" := RiskManagementPlanLine."Overal Risk Rating";
                RiskStatusReportLine."Overall Risk Level Code" := RiskManagementPlanLine."Overall Risk Level Code";
                RiskStatusReportLine."Risk Heat Zone" := RiskManagementPlanLine."Risk Heat Zone";
                if not RiskStatusReportLine.Insert(true) then
                    RiskStatusReportLine.Modify(true);
                ORMPLineRes.Reset;
                ORMPLineRes.SetRange(ORMPLineRes."Document No", RiskManagementPlanLine."Document No");
                //ORMPLineRes.SETRANGE(ORMPLineRes."Document Type","Document Type");
                if ORMPLineRes.FindSet then
                    repeat
                        RMPLineRes.TransferFields(ORMPLineRes);
                        RMPLineRes."Document No" := RiskMEHeader."Document No";
                        RMPLineRes."Document Type" := RiskMEHeader."Document Type";

                        if not RMPLineRes.Insert(true) then;
                    until ORMPLineRes.Next = 0;
                ORiskRating.Reset;
                ORiskRating.SetRange(ORiskRating."Document No", RiskManagementPlanLine."Document No");
                //ORiskRating.SETRANGE(ORiskRating."Document Type","Document Type");
                if ORiskRating.FindSet then
                    repeat
                        NRiskRating.TransferFields(ORiskRating);
                        NRiskRating."Document No" := RiskMEHeader."Document No";
                        NRiskRating."Document Type" := RiskMEHeader."Document Type";

                        if not NRiskRating.Insert(true) then;
                    until ORiskRating.Next = 0;
                ORMPLineRiskOwnership.Reset;
                ORMPLineRiskOwnership.SetRange(ORMPLineRiskOwnership."Document No", RiskManagementPlanLine."Document No");
                //ORMPLineRiskOwnership.SETRANGE(ORMPLineRiskOwnership."Document Type","Document Type");
                if ORMPLineRiskOwnership.FindSet then
                    repeat
                        RMPLineRiskOwnership.TransferFields(ORMPLineRiskOwnership);
                        RMPLineRiskOwnership."Document No" := RiskMEHeader."Document No";
                        RMPLineRiskOwnership."Document Type" := RiskMEHeader."Document Type";
                        //RMPLineRiskOwnership.
                        if not RMPLineRiskOwnership.Insert(true) then;
                    until ORMPLineRiskOwnership.Next = 0;
            until RiskManagementPlanLine.Next = 0;
        end;
    end;


    procedure FnSuggestOpenRSRRiskResponseActionStatus(RiskStatusReportLine: Record "Risk Status Report Line"; RiskMEHeader: Record "Risk M&E Header"; RiskStatusRptRespAction: Record "Risk Status Rpt Resp. Action")
    var
        RiskManagementPlanLine: Record "Risk Management Plan Line";
        RMPLineResponseAction: Record "RMP Line Response Action";
    begin
        RiskManagementPlanLine.Reset;
        RiskManagementPlanLine.SetRange(RiskManagementPlanLine."Document No", RiskMEHeader."Risk Management Plan ID");
        RiskManagementPlanLine.SetRange(RiskManagementPlanLine."Risk Status", RiskManagementPlanLine."risk status"::Open);
        if RiskManagementPlanLine.FindSet then begin
            RMPLineResponseAction.Reset;
            RMPLineResponseAction.SetRange(RMPLineResponseAction."Document No", RiskMEHeader."Risk Management Plan ID");
            RMPLineResponseAction.SetRange(RMPLineResponseAction."Action Status", RMPLineResponseAction."action status"::Ongoing, RMPLineResponseAction."action status"::Planned);
            if RMPLineResponseAction.FindSet then
                repeat
                    RiskStatusRptRespAction.Init;
                    RiskStatusRptRespAction."Document Type" := RiskMEHeader."Document Type";
                    RiskStatusRptRespAction."Document No" := RiskMEHeader."Document No";
                    RiskStatusRptRespAction."Risk Register Type" := RiskMEHeader."Risk Register Type";
                    RiskStatusRptRespAction."Risk Management Plan ID" := RiskMEHeader."Risk Management Plan ID";
                    RiskStatusRptRespAction."Risk ID" := RMPLineResponseAction."Risk ID";
                    RiskStatusRptRespAction."Action ID" := RMPLineResponseAction."Action ID";
                    RiskStatusRptRespAction."Responsible Officer No." := RMPLineResponseAction."Responsible Officer No.";
                    RiskStatusRptRespAction."Activity Description" := RMPLineResponseAction."Activity Description";
                    RiskStatusRptRespAction."Action Status" := RMPLineResponseAction."Action Status";
                    RiskStatusRptRespAction."Percentage Complete" := RMPLineResponseAction."Percentage Complete";
                    RiskStatusRptRespAction."Actual Date Done" := RMPLineResponseAction."Actual Date Done";
                    RiskStatusRptRespAction."Planned Start Date" := RMPLineResponseAction."Planned Start Date";
                    RiskStatusRptRespAction."Planned Due Date" := RMPLineResponseAction."Planned Due Date";
                    RiskStatusRptRespAction."Action Type" := RMPLineResponseAction."Action Type";
                    if not RiskStatusRptRespAction.Insert(true) then
                        RiskStatusRptRespAction.Modify(true);
                until RMPLineResponseAction.Next = 0;
        end;
    end;


    procedure FnUpdateRMPFromRSR(ObjNRVH: Record "Risk M&E Header")
    var
        ObjRMPLine: Record "Risk Management Plan Line";
        ObjNRVH1: Record "Risk M&E Header";
        ObjNRVLine: Record "New Risk Voucher Line";
        ObjRSRLine: Record "Risk Status Report Line";
    begin
        ObjRSRLine.Reset;
        ObjRSRLine.SetRange("Document No", ObjNRVH."Document No");
        if ObjRSRLine.FindSet then begin
            repeat
                ObjRMPLine.Reset;
                ObjRMPLine.SetRange("Document No", ObjNRVH."Risk Management Plan ID");
                ObjRMPLine.SetRange("Risk ID", ObjRSRLine."Risk ID");
                if ObjRMPLine.FindSet then
                    //    ObjRMPLine.INIT;
                    //    ObjRMPLine."Document Type":=ObjNRVH."Risk Register Type";
                    ObjRMPLine."Risk Status" := ObjRSRLine."Risk Status";
                //    ObjRMPLine."Document No":=ObjNRVH."Risk Management Plan ID";
                //    ObjRMPLine."Risk ID":=ObjRSRLine."Risk ID";
                //ObjRMPLine."Risk Category":=ObjRSRLine."Risk Category";
                ObjRMPLine."Risk Title" := ObjRSRLine."Risk Title";
                //ObjRMPLine."Risk Source ID":=ObjRSRLine."Risk Source ID";
                ObjRMPLine."Risk Likelihood Code" := ObjRSRLine."Risk Likelihood Code";
                ObjRMPLine."Risk Impact Code" := ObjRSRLine."Risk Impact Code";
                ObjRMPLine."Risk Impact Type" := ObjRSRLine."Risk Impact Type";
                ObjRMPLine."Estimate Fin. Impact (LCY)" := ObjRSRLine."Estimate Fin. Impact (LCY)";
                ObjRMPLine."Estimate Delay Impact (Days)" := ObjRSRLine."Estimate Delay Impact (Days)";
                ObjRMPLine."Gen. Risk Response Strategy" := ObjRSRLine."Gen. Risk Response Strategy";
                //ObjRMPLine."Date Raised":=ObjRSRLine."Date Raised";
                //ObjRMPLine."Risk Status":=ObjRSRLine."Risk Status";
                //ObjRMPLine.VALIDATE("Risk Status",ObjRSRLine."Risk Status");
                ObjRMPLine."Date Closed" := ObjRSRLine."Date Closed";
                ObjRMPLine."Risk Likelihood Rate Scale ID" := ObjRSRLine."Risk Likelihood Rate Scale ID";
                ObjRMPLine."Risk Impact Rating Scale ID" := ObjRSRLine."Risk Impact Rating Scale ID";
                ObjRMPLine."Overall Risk Rating Scale ID" := ObjRSRLine."Overall Risk Rating Scale ID";
                ObjRMPLine."Risk Appetite Rating Scale ID" := ObjRSRLine."Risk Appetite Rating Scale ID";
                ObjRMPLine."Risk Likelihood Rating" := ObjRSRLine."Risk Likelihood Rating";
                ObjRMPLine."Risk Impact Rating" := ObjRSRLine."Risk Impact Rating";
                ObjRMPLine."Overal Risk Rating" := ObjRSRLine."Overal Risk Rating";
                ObjRMPLine."Overall Risk Level Code" := ObjRSRLine."Overall Risk Level Code";
                ObjRMPLine."Risk Heat Zone" := ObjRSRLine."Risk Heat Zone";
                ObjRMPLine."New Risk Voucher ID" := ObjNRVH."Document No";
                //IF NOT ObjRMPLine.INSERT(TRUE) THEN
                ObjRMPLine.Modify(true);
            until ObjRSRLine.Next = 0;
            //  ObjNRVH.Posted:=TRUE;
            //  ObjNRVH."Posting Date":=TODAY;
            //  ObjNRVH.MODIFY;
        end;
    end;


    procedure FnUpdateRiskResponseActionsRSR(RiskMEHeader: Record "Risk M&E Header")
    var
        RMPLineRiskOwnership: Record "RMP Line Risk Ownership";
        RMPLineResponseAction: Record "RMP Line Response Action";
        RiskManagementPlanLine: Record "Risk Management Plan Line";
        RMPLine: Record "Risk Management Plan Line";
        ORMPLine: Record "Risk Management Plan Line";
        OldRiskManPlan: Record "Risk Management Plan";
        NewRiskManPlan: Record "Risk Management Plan";
        NoSeriesManagement: Codeunit NoSeriesManagement;
        RiskManagementFramework: Record "Risk Management Framework";
        NRiskRating: Record "Residual Risk Rating";
        ORiskRating: Record "Residual Risk Rating";
        RMPLineRes: Record "RMP Line Response Action";
        ORMPLineRes: Record "RMP Line Response Action";
        ORMPLineRiskOwnership: Record "RMP Line Risk Ownership";
        NewRiskVoucherLine: Record "New Risk Voucher Line";
        RiskStatusReportLine: Record "RMP Line Response Action";
        NewRiskLineResponseAction: Record "New Risk Line Resp. Action";
        RiskStatusRptRespAction: Record "Risk Status Rpt Resp. Action";
    begin
        RiskStatusReportLine.Reset;
        RiskStatusReportLine.SetRange(RiskStatusReportLine."Document No", RiskMEHeader."Document No");
        if RiskStatusReportLine.FindSet then begin
            repeat
                RMPLineResponseAction.Reset;
                RMPLineResponseAction.SetRange("Document No", RiskMEHeader."Risk Management Plan ID");
                RMPLineResponseAction.SetRange("Document Type", RiskMEHeader."Risk Register Type");
                RMPLineResponseAction.SetRange("Risk ID", RiskStatusReportLine."Risk ID");
                RMPLineResponseAction.SetRange("Action ID", RiskStatusReportLine."Action ID");
                if RMPLineResponseAction.FindSet then begin
                    //        RMPLineResponseAction."Document Type":=RiskMEHeader."Risk Register Type";
                    //        RMPLineResponseAction."Document No":=RiskMEHeader."Risk Management Plan ID";
                    //        RMPLineResponseAction."Risk ID":=RiskStatusReportLine."Risk ID";
                    //        RMPLineResponseAction."Action ID":=RiskStatusReportLine."Action ID";
                    RMPLineResponseAction."Responsible Officer No." := RiskStatusReportLine."Responsible Officer No.";
                    RMPLineResponseAction."Action Status" := RiskStatusReportLine."Action Status";
                    RMPLineResponseAction."Percentage Complete" := RiskStatusReportLine."Percentage Complete";
                    RMPLineResponseAction."Activity Description" := RiskStatusReportLine."Activity Description";
                    RMPLineResponseAction."Responsible Officer No." := RiskStatusReportLine."Responsible Officer No.";
                    RMPLineResponseAction."Task Priority" := RiskStatusReportLine."Task Priority";
                    RMPLineResponseAction."Planned Start Date" := RiskStatusReportLine."Planned Start Date";
                    RMPLineResponseAction."Planned Due Date" := RiskStatusReportLine."Planned Due Date";
                    RMPLineResponseAction."Actual Date Done" := RiskStatusReportLine."Actual Date Done";
                    RMPLineResponseAction."Action Type" := RiskStatusReportLine."Action Type";
                    // IF NOT RMPLineResponseAction.INSERT(TRUE) THEN
                    RMPLineResponseAction.Modify(true);
                end else begin
                    RMPLineResponseAction."Document Type" := RiskMEHeader."Risk Register Type";
                    RMPLineResponseAction."Document No" := RiskMEHeader."Risk Management Plan ID";
                    RMPLineResponseAction."Risk ID" := RiskStatusReportLine."Risk ID";
                    RMPLineResponseAction."Action ID" := RiskStatusReportLine."Action ID";
                    RMPLineResponseAction."Responsible Officer No." := RiskStatusReportLine."Responsible Officer No.";
                    RMPLineResponseAction."Action Status" := RiskStatusReportLine."Action Status";
                    RMPLineResponseAction."Percentage Complete" := RiskStatusReportLine."Percentage Complete";
                    RMPLineResponseAction."Activity Description" := RiskStatusReportLine."Activity Description";
                    RMPLineResponseAction."Responsible Officer No." := RiskStatusReportLine."Responsible Officer No.";
                    RMPLineResponseAction."Task Priority" := RiskStatusReportLine."Task Priority";
                    RMPLineResponseAction."Planned Start Date" := RiskStatusReportLine."Planned Start Date";
                    RMPLineResponseAction."Planned Due Date" := RiskStatusReportLine."Planned Due Date";
                    RMPLineResponseAction."Actual Date Done" := RiskStatusReportLine."Actual Date Done";
                    RMPLineResponseAction."Action Type" := RiskStatusReportLine."Action Type";
                    RMPLineResponseAction.Insert(true);

                end;
            until RiskStatusReportLine.Next = 0;
        end;
        //    ORMPLineRes.SETRANGE(ORMPLineRes."Document No",RiskMEHeader."Risk Management Plan ID");
        //    //ORMPLineRes.SETRANGE(ORMPLineRes."Document Type","Document Type");
        //    IF ORMPLineRes.FINDSET THEN
        //      REPEAT
        //        RMPLineRes.TRANSFERFIELDS(ORMPLineRes);
        //        RMPLineRes."Document No" := RiskMEHeader."Risk Management Plan ID";
        //        RMPLineRes."Document Type" := RiskMEHeader."Document Type";
        //        IF NOT RMPLineRes.INSERT(TRUE) THEN
        //          RMPLineRes.MODIFY;
        //      UNTIL ORMPLineRes.NEXT=0;
        //    ORiskRating.RESET;
        //    ORiskRating.SETRANGE(ORiskRating."Document No",RiskMEHeader."Risk Management Plan ID");
        //    //ORiskRating.SETRANGE(ORiskRating."Document Type","Document Type");
        //    IF ORiskRating.FINDSET THEN
        //      REPEAT
        //        NRiskRating.TRANSFERFIELDS(ORiskRating);
        //        NRiskRating."Document No" := RiskMEHeader."Risk Management Plan ID";
        //        NRiskRating."Document Type" := RiskMEHeader."Document Type";
        //        IF NOT  NRiskRating.INSERT(TRUE) THEN
        //          NRiskRating.MODIFY;
        //      UNTIL ORiskRating.NEXT=0;
        //    ORMPLineRiskOwnership.RESET;
        //    ORMPLineRiskOwnership.SETRANGE(ORMPLineRiskOwnership."Document No",RiskMEHeader."Risk Management Plan ID");
        //    //ORMPLineRiskOwnership.SETRANGE(ORMPLineRiskOwnership."Document Type","Document Type");
        //    IF ORMPLineRiskOwnership.FINDSET THEN
        //      REPEAT
        //        RMPLineRiskOwnership.TRANSFERFIELDS(ORMPLineRiskOwnership);
        //        RMPLineRiskOwnership."Document No" := RiskMEHeader."Risk Management Plan ID";
        //        RMPLineRiskOwnership."Document Type" := RiskMEHeader."Document Type";
        //        IF NOT RMPLineRiskOwnership.INSERT(TRUE) THEN
        //          RMPLineRiskOwnership.MODIFY;
        //      UNTIL ORMPLineRiskOwnership.NEXT=0;
    end;


    procedure FnUpdateRiskRILedgerEntry(RiskMEHeader: Record "Risk M&E Header"; NewRiskVoucherLine: Record "New Risk Voucher Line"; RiskStatusReportLine: Record "Risk Status Report Line"; NewRiskLineResponseAction: Record "New Risk Line Resp. Action"; RiskStatusRptRespAction: Record "Risk Status Rpt Resp. Action"; RiskStatusRptIncident: Record "Risk Status Rpt Incident")
    var
        RMPLineRiskOwnership: Record "RMP Line Risk Ownership";
        RMPLineResponseAction: Record "RMP Line Response Action";
        RiskIncidentLedgerEntry: Record "Risk Incident Ledger Entry";
    begin
        RiskStatusReportLine.Reset;
        RiskStatusReportLine.SetRange(RiskStatusReportLine."Document No", RiskMEHeader."Document No");
        if RiskStatusReportLine.FindSet then begin
            RiskStatusRptIncident.Reset;
            RiskStatusRptIncident.SetRange(RiskStatusRptIncident."Document No", RiskStatusReportLine."Document No");
            if RiskStatusRptIncident.FindSet then
                repeat
                    RiskIncidentLedgerEntry.Init;
                    RiskIncidentLedgerEntry."Entry No" := RiskIncidentLedgerEntry.Count + 1;
                    RiskIncidentLedgerEntry."Posting Date" := Today;
                    RiskIncidentLedgerEntry."Posted By" := UserId;
                    RiskIncidentLedgerEntry."Incident Document Type" := RiskStatusRptIncident."Risk Register Type";
                    RiskIncidentLedgerEntry."HSE Management Plan ID" := RiskStatusRptIncident."HSE Plan ID";
                    RiskIncidentLedgerEntry."Hazard ID" := RiskStatusRptIncident."Hazard ID";
                    RiskIncidentLedgerEntry."Risk Management Plan ID" := RiskStatusRptIncident."Risk Management Plan ID";
                    RiskIncidentLedgerEntry."Risk ID" := RiskStatusRptIncident."Risk ID";
                    RiskIncidentLedgerEntry."Risk Incident Category" := RiskStatusRptIncident."Risk Incident Category";
                    ;
                    RiskIncidentLedgerEntry."Source Document Type" := RiskIncidentLedgerEntry."source document type"::"Risk Status Report";
                    RiskIncidentLedgerEntry."Source Document No." := RiskStatusRptIncident."Document No";
                    RiskIncidentLedgerEntry."Incident Reference ID" := Format(RiskStatusRptIncident."Incident Line No.");
                    RiskIncidentLedgerEntry."Incident Description" := RiskStatusRptIncident."Incident Description";
                    RiskIncidentLedgerEntry."Severity Level" := RiskStatusRptIncident."Severity Level";
                    RiskIncidentLedgerEntry."Occurrence Type" := RiskStatusRptIncident."Occurrence Type";
                    RiskIncidentLedgerEntry."Incident Date" := RiskStatusRptIncident."Incident Date";
                    RiskIncidentLedgerEntry."Incident Start Time" := RiskStatusRptIncident."Incident Start Time";
                    RiskIncidentLedgerEntry."Incident End Time" := RiskStatusRptIncident."Incident End Time";
                    RiskIncidentLedgerEntry."Incident Location Details" := RiskStatusRptIncident."Incident Location Details";
                    RiskIncidentLedgerEntry."Primary Trigger ID" := RiskStatusRptIncident."Primary Trigger ID";
                    RiskIncidentLedgerEntry."Root Cause Summary" := RiskStatusRptIncident."Root Cause Summary";
                    RiskIncidentLedgerEntry."Category of Person Reporting" := RiskStatusRptIncident."Category of Person Reporting";
                    RiskIncidentLedgerEntry."Reported By (Name)" := RiskStatusRptIncident."Reported By (Name)";
                    //RiskIncidentLedgerEntry."Incident Class":=RiskStatusRptIncident.;
                    RiskIncidentLedgerEntry."Actual Financial Impact (LCY)" := RiskStatusRptIncident."Actual Financial Impact (LCY)";
                    RiskIncidentLedgerEntry."Actual Schedule Delay(Days)" := RiskStatusRptIncident."Actual Schedule Delay(Days)";
                    RiskIncidentLedgerEntry."Actual No. Injured Persons" := RiskStatusRptIncident."Actual No. Injured Persons";
                    RiskIncidentLedgerEntry."Actual No. of Fatalities" := RiskStatusRptIncident."Actual No. of Fatalities";
                    RiskIncidentLedgerEntry."Police Report Reference No." := RiskStatusRptIncident."Police Report Reference No.";
                    RiskIncidentLedgerEntry."Police Report Date" := RiskStatusRptIncident."Police Report Date";
                    RiskIncidentLedgerEntry."Police Station" := RiskStatusRptIncident."Police Station";
                    if not RiskIncidentLedgerEntry.Insert(true) then
                        RiskIncidentLedgerEntry.Modify(true);
                until RiskStatusRptIncident.Next = 0;
        end;
    end;

    procedure FnCreateProjectsFromAuditPlanLines(AuditPlan: Record "Audit Plan"; AuditPlanLine: Record "Audit Plan Line"; AuditTemplate: Record "Audit Template"; AuditTemplateDefaultRisk: Record "Audit Template Default Risk"; AuditPlanLineTeam: Record "Audit Plan Line Team"; AuditPlanLineLocation: Record "Audit Plan Line Location"; AuditPlanLineObjective: Record "Audit PlanLine Objective"; AuditPlanLineRisk: Record "Audit Plan Line Risk")
    var
        AuditProject: Record "Audit Project";
        AuditProjectSchedule: Record "Audit Project Schedule";
        AuditProjectSection: Record "Audit Project Section";
        AuditProjectObjective: Record "Audit Project Objective";
        AuditProjectProcedure: Record "Audit Project Procedure";
        AuditProjectChecklist: Record "Audit Project Checklist";
        AuditChecklistTestMethod: Record "Audit Checklist Test Method";
        AuditProjRequiredDocument: Record "Audit Proj Required Document";
        AuditProjectProcedureRisk: Record "Audit Project Procedure Risk";
        AuditProjProcedureControl: Record "Audit Proj  Procedure Control";
        AuditProjectLocation: Record "Audit ProjectLocation";
        AuditProjectTeam: Record "Audit Project Team";
        AuditPlanSection: Record "Audit Plan Section";
        AuditTemplateSection: Record "Audit Template Section";
        AuditTemplateObjective: Record "Audit Template Objective";
        AuditTemplateDefaultControl: Record "Audit Template Default Control";
        AuditTemplateProcedure: Record "Audit Template Procedure";
        AuditTemplateProcedureTest: Record "Audit Template Procedure Test";
        AuditTempProcedureComment: Record "Audit Temp Procedure Comment";
        AuditTempProcedureControl: Record "Audit Temp Procedure Control";
        ObjAuditPlanLineTeam: Record "Audit Plan Line Team";
        ObjAuditPlanLineLocation: Record "Audit Plan Line Location";
        ObjAuditPlanLineRisk: Record "Audit Plan Line Risk";
    begin
        AuditAssuranceSetup.Get;
        AuditAssuranceSetup.TestField("Audit Project Nos");
        AuditPlanLine.Reset;
        AuditPlanLine.SetRange(AuditPlanLine."Audit Plan ID", AuditPlan."Audit Plan ID");
        if AuditPlanLine.FindSet then begin
            repeat
                //Populate the Audit Project Header
                AuditProject.Init;
                AuditProject."Engagement ID" := NoSeriesManagement.GetNextNo(AuditAssuranceSetup."Audit Project Nos", Today, true);
                AuditProject."Audit Plan ID" := AuditPlan."Audit Plan ID";
                AuditProject."Audit Plan Assignment No." := AuditPlanLine."Engagement Line No.";
                AuditProject."Audit  Work Type" := AuditPlanLine."Audit  Work Type";
                AuditProject."Engagement Name" := AuditPlanLine."Engagement Name";
                AuditProject."Engagement Category" := AuditPlanLine."Engagement Category";
                AuditProject."Parent Audit Project ID" := AuditPlanLine."Parent Audit Project ID";
                AuditProject."Auditor Type" := AuditPlanLine."Auditor Type";
                AuditProject."Lead Auditor ID" := AuditPlanLine."Lead Auditor ID";
                AuditProject.Validate("Lead Auditor ID");
                AuditProject."Lead Auditor Email" := AuditPlanLine."Lead Auditor Email";
                AuditProject."Planned Start Date" := AuditPlanLine."Planned Start Date";
                AuditProject."Planned End Date" := AuditPlanLine."Planned End Date";
                AuditProject."Auditee Type" := AuditPlanLine."Auditee Type";
                AuditProject."Primary Auditee ID" := AuditPlanLine."Primary Auditee ID";
                AuditProject.Validate("Primary Auditee ID");
                AuditProject."Auditee Name" := AuditPlanLine."Auditee Name";
                AuditProject."Audit Template ID" := AuditPlanLine."Audit Template ID";
                AuditProject."Project ID" := AuditPlanLine."Project ID";
                AuditProject."Lead Auditee Representative ID" := AuditPlanLine."Lead Auditee Representative ID";
                AuditProject."Lead Auditee Email" := AuditPlanLine."Lead Auditee Email";
                AuditProject.Status := AuditProject.Status::Planned;
                AuditProject."Funding Source ID" := AuditPlanLine."Funding Source ID";
                AuditProject."Budget Cost (LCY)" := AuditPlanLine."Budget Cost (LCY)";
                AuditProject."Budget Control Job No" := AuditPlanLine."Budget Control Job No";
                AuditProject."Budget Control Job Task No." := AuditPlanLine."Budget Control Job Task No.";
                AuditProject."Global Dimension 1 Code" := AuditPlanLine."Global Dimension Dim 1 Code";
                AuditProject."Global Dimension 2 Code" := AuditPlanLine."Global Dimension  Dim 2 Code";
                AuditProject."Dimension Set ID" := AuditPlanLine."Dimension Set ID";
                AuditProject."Internal Audit Charter ID" := AuditPlanLine."Internal Audit Charter ID";
                AuditProject."Chief Audit Executive ID" := AuditPlanLine."Chief Audit Executive ID";

                //Fields not in the AuditPlanLine table
                AuditProject."Risk Appetite Rating Scale ID" := '';
                AuditProject."Risk Impact Rating Scale ID" := '';
                AuditProject."Risk Appetite Rating Scale ID" := '';
                AuditProject."Overall Risk Rating Scale ID" := '';
                AuditProject."Audit Procedure ID" := '';
                //Fields not in the AuditPlanLine tab

                if not AuditProject.Insert(true) then
                    AuditProject.Modify(true);



                //Populate The Default Risks from Template
                AuditPlanLineRisk.Reset;
                AuditPlanLineRisk.SetRange(AuditPlanLineRisk."Audit Plan ID", AuditPlan."Audit Plan ID");
                if AuditPlanLineRisk.FindSet then begin
                    repeat
                        ObjAuditPlanLineRisk.Init;
                        ObjAuditPlanLineRisk.TransferFields(AuditPlanLineRisk);
                        ObjAuditPlanLineRisk."Audit Plan ID" := AuditPlan."Audit Plan ID";
                        ObjAuditPlanLineRisk."Engagement Line No." := AuditPlanLine."Engagement Line No.";
                        ObjAuditPlanLineRisk."Line Risk ID" := ObjAuditPlanLineRisk.Count + 1;
                        if not ObjAuditPlanLineRisk.Insert(true) then
                            ObjAuditPlanLineRisk.Modify(true);
                    until AuditPlanLineRisk.Next = 0;
                end;


                //Populate Default Sections
                AuditTemplateSection.Reset;
                AuditTemplateSection.SetRange(AuditTemplateSection."Template ID", AuditPlanLine."Audit Template ID");
                if AuditTemplateSection.FindSet then begin
                    repeat
                        AuditProjectSection.Init;
                        AuditProjectSection."Engagement ID" := AuditProject."Engagement ID";
                        AuditProjectSection."Section Type" := AuditTemplateSection."Section Type";
                        AuditProjectSection."Line No." := AuditProjectSection.Count + 1;
                        AuditProjectSection.Description := AuditTemplateSection.Description;
                        if not AuditProjectSection.Insert(true) then
                            AuditProjectSection.Modify(true);
                    until AuditTemplateSection.Next = 0;
                end;

                //Populate Objectives
                AuditTemplateObjective.Reset;
                AuditTemplateObjective.SetRange(AuditTemplateObjective."Template ID", AuditPlanLine."Audit Template ID");
                if AuditTemplateObjective.FindSet then begin
                    repeat
                        AuditProjectObjective.Init;
                        AuditProjectObjective."Engagement ID" := AuditProject."Engagement ID";
                        AuditProjectObjective."Audit Objective ID" := AuditProjectObjective.Count + 1;
                        AuditProjectObjective.Description := AuditTemplateObjective.Description;
                        if not AuditProjectObjective.Insert(true) then
                            AuditProjectObjective.Modify(true);
                    until AuditTemplateObjective.Next = 0;
                end;

                //Populate Default Procedure Controls
                AuditTempProcedureControl.Reset;
                AuditTempProcedureControl.SetRange(AuditTempProcedureControl."Template ID", AuditPlanLine."Audit Template ID");
                if AuditTempProcedureControl.FindSet then begin
                    repeat
                        AuditProjProcedureControl.Init;
                        AuditProjProcedureControl."Engagement ID" := AuditProject."Engagement ID";
                        AuditProjProcedureControl."Business Risk ID" := AuditTempProcedureControl."Risk ID";
                        AuditProjProcedureControl."Control ID" := AuditProjProcedureControl."Control ID";
                        AuditProjProcedureControl.Description := AuditTempProcedureControl.Description;
                        AuditProjProcedureControl."Nature of Control" := AuditProjProcedureControl."nature of control"::"Manual Control";
                        AuditProjProcedureControl."Control Frequency" := AuditProjProcedureControl."control frequency"::Annual;
                        AuditProjProcedureControl."Control Owner ID" := '';
                        AuditProjProcedureControl."Internal Control Type" := AuditProjProcedureControl."internal control type"::Preventive;
                        AuditProjProcedureControl."Audit Procedure ID" := AuditTempProcedureControl."Audit Procedure ID";
                        AuditProjProcedureControl."Audit Objective ID" := AuditTempProcedureControl."Audit Objective ID";
                        if not AuditProjProcedureControl.Insert(true) then
                            AuditProjProcedureControl.Modify(true);
                    until AuditTempProcedureControl.Next = 0;
                end;

                //Audit Procedures
                AuditTemplateProcedure.Reset;
                AuditTemplateProcedure.SetRange(AuditTemplateProcedure."Template ID", AuditPlanLine."Audit Template ID");
                if AuditTemplateProcedure.FindSet then begin
                    repeat
                        AuditProjectProcedure.Init;
                        AuditProjectProcedure."Engagement ID" := AuditProject."Engagement ID";
                        AuditProjectProcedure."Audit Procedure ID" := AuditProjectProcedure.Count + 1;
                        AuditProjectProcedure."Audit Objective ID" := AuditTemplateProcedure."Audit Objective ID";
                        AuditProjectProcedure.Description := AuditTemplateProcedure.Description;
                        if not AuditProjectProcedure.Insert(true) then
                            AuditProjectProcedure.Modify(true);
                    until AuditTemplateProcedure.Next = 0;
                end;

                //Audit Engagement Team
                AuditPlanLineTeam.Reset;
                AuditPlanLineTeam.SetRange(AuditPlanLineTeam."Audit Plan ID", AuditPlanLine."Audit Plan ID");
                if AuditPlanLineTeam.FindSet then begin
                    repeat
                        AuditProjectTeam.Init;
                        AuditProjectTeam."Engagement ID" := AuditProject."Engagement ID";
                        AuditProjectTeam."Resource No." := AuditPlanLineTeam."Resource No.";
                        AuditProjectTeam.Name := AuditPlanLineTeam.Name;
                        AuditProjectTeam."Audit Team Type" := AuditPlanLineTeam."Audit Team Type";
                        AuditProjectTeam."Engagement Role" := AuditPlanLineTeam."Engagement Role";
                        AuditProjectTeam."Start Date" := AuditPlanLineTeam."Start Date";
                        AuditProjectTeam."End Date" := AuditPlanLineTeam."End Date";
                        AuditProjectTeam."Default Audit Location ID" := AuditPlanLineTeam."Default Audit Location ID";
                        AuditProjectTeam."Job Title" := AuditPlanLineTeam."Job Title";
                        AuditProjectTeam."Phone No." := AuditPlanLineTeam."Phone No.";
                        AuditProjectTeam.Email := AuditPlanLineTeam.Email;
                        AuditProjectTeam.Blocked := AuditPlanLineTeam.Blocekd;
                        if not AuditProjectTeam.Insert(true) then
                            AuditProjectTeam.Modify(true);
                    until AuditPlanLineTeam.Next = 0;
                end;


                //Audit Locations
                AuditPlanLineLocation.Reset;
                AuditPlanLineLocation.SetRange(AuditPlanLineLocation."Audit Plan ID", AuditPlanLine."Audit Plan ID");
                if AuditPlanLineLocation.FindSet then begin
                    repeat
                        AuditProjectLocation.Init;
                        AuditProjectLocation."Engagement ID" := AuditProject."Engagement ID";
                        AuditProjectLocation."Audit Location ID" := AuditPlanLineLocation."Audit Location ID";
                        AuditProjectLocation.Description := AuditPlanLineLocation.Description;
                        AuditProjectLocation."Responsibility Center ID" := AuditPlanLineLocation."Responsibility Center ID";
                        AuditProjectLocation."Audit Site Type" := AuditPlanLineLocation."Audit Site Type";
                        AuditProjectLocation."Contact Person" := AuditPlanLineLocation."Contact Person";
                        AuditProjectLocation."Primary Email" := AuditPlanLineLocation."Primary Email";
                        AuditProjectLocation."Telephone No." := AuditPlanLineLocation."Telephone No.";
                        if not AuditProjectLocation.Insert(true) then
                            AuditProjectLocation.Modify(true);
                    until AuditPlanLineLocation.Next = 0;
                end;

                //Audit Plan Line Objective
                AuditPlanLineObjective.Reset;
                AuditPlanLineObjective.SetRange("Audit Plan ID", AuditPlanLine."Audit Plan ID");
                if AuditPlanLineObjective.FindSet then begin
                    repeat
                        AuditProjectObjective.Init;
                        AuditProjectObjective."Engagement ID" := AuditProject."Engagement ID";
                        AuditProjectObjective."Audit Objective ID" := AuditPlanLineObjective."Audit Objective ID";
                        AuditProjectObjective.Description := AuditPlanLineObjective.Description;
                        if not AuditProjectObjective.Insert(true) then
                            AuditProjectObjective.Modify(true);
                    until AuditPlanLineObjective.Next = 0;
                end;

            //Required Documents
            //   AuditPlanLineLocation.RESET;
            //     AuditPlanLineLocation.SETRANGE(AuditPlanLineLocation."Audit Plan ID",AuditPlan."Audit Plan ID");
            //     IF AuditPlanLineLocation.FINDSET THEN
            //     BEGIN
            //       REPEAT
            //           AuditProjectLocation.INIT;
            //           AuditProjectLocation."Engagement ID":=AuditProject."Engagement ID";
            //           AuditProjectLocation."Audit Location ID":=AuditPlanLineLocation."Audit Location ID";
            //           AuditProjectLocation.Description:=AuditPlanLineLocation.Description;
            //           AuditProjectLocation."Responsibility Center ID":=AuditPlanLineLocation."Responsibility Center ID";
            //           AuditProjectLocation."Audit Site Type":=AuditPlanLineLocation."Audit Site Type";
            //           AuditProjectLocation."Contact Person":=AuditPlanLineLocation."Contact Person";
            //           AuditProjectLocation."Primary Email":=AuditPlanLineLocation."Primary Email";
            //           AuditProjectLocation."Telephone No.":=AuditPlanLineLocation."Telephone No.";
            //           IF NOT AuditProjectLocation.INSERT(TRUE) THEN
            //             AuditProjectLocation.MODIFY(TRUE);
            //       UNTIL AuditPlanLineLocation.NEXT=0;
            //      END;
            until AuditPlanLine.Next = 0;
        end;
    end;


    procedure FnCopyAuditProject(AuditProject: Record "Audit Project"; AuditProjectSchedule: Record "Audit Project Schedule"; AuditProjectSection: Record "Audit Project Section"; AuditProjectObjective: Record "Audit Project Objective"; AuditProjectProcedure: Record "Audit Project Procedure"; AuditProjectChecklist: Record "Audit Project Checklist"; AuditProjectLocation: Record "Audit ProjectLocation"; AuditProjectTeam: Record "Audit Project Team"; AuditProjRequiredDocument: Record "Audit Proj Required Document")
    var
        ObjAuditProject: Record "Audit Project";
        ObjAuditProjectSchedule: Record "Audit Project Schedule";
        ObjAuditProjectSection: Record "Audit Project Section";
        ObjAuditProjectObjective: Record "Audit Project Objective";
        ObjAuditProjectProcedure: Record "Audit Project Procedure";
        ObjAuditProjectChecklist: Record "Audit Project Checklist";
        ObjAuditProjectLocation: Record "Audit ProjectLocation";
        ObjAuditProjectTeam: Record "Audit Project Team";
        ObjAuditProjRequiredDocument: Record "Audit Proj Required Document";
    begin
        AuditAssuranceSetup.Get;
        AuditAssuranceSetup.TestField("Audit Project Nos");
        //Copy Header
        ObjAuditProject.Init;
        ObjAuditProject.TransferFields(AuditProject);
        ObjAuditProject."Engagement ID" := NoSeriesManagement.GetNextNo(AuditAssuranceSetup."Audit Project Nos", Today, true);
        ObjAuditProject.Status := ObjAuditProject.Status::Planned;
        ObjAuditProject.Insert(true);

        //Copy Lines
        AuditProjectSchedule.Reset;
        AuditProjectSchedule.SetRange(AuditProjectSchedule."Engagement ID", AuditProject."Engagement ID");
        if AuditProjectSchedule.FindSet then
            repeat
                ObjAuditProjectSchedule.Init;
                ObjAuditProjectSchedule.TransferFields(AuditProjectSchedule);
                ObjAuditProjectSchedule."Engagement ID" := ObjAuditProject."Engagement ID";
                ObjAuditProjectSchedule.Insert(true);
            until AuditProjectSchedule.Next = 0;

        //Copy Sections
        AuditProjectSection.Reset;
        AuditProjectSection.SetRange(AuditProjectSection."Engagement ID", AuditProject."Engagement ID");
        if AuditProjectSection.FindSet then
            repeat
                ObjAuditProjectSection.Init;
                ObjAuditProjectSection.TransferFields(AuditProjectSection);
                ObjAuditProjectSection."Engagement ID" := ObjAuditProject."Engagement ID";
                ObjAuditProjectSection.Insert(true);
            until AuditProjectSection.Next = 0;


        //Copy Objectives
        AuditProjectObjective.Reset;
        AuditProjectObjective.SetRange(AuditProjectObjective."Engagement ID", AuditProject."Engagement ID");
        if AuditProjectObjective.FindSet then
            repeat
                ObjAuditProjectObjective.Init;
                ObjAuditProjectObjective.TransferFields(AuditProjectObjective);
                ObjAuditProjectObjective."Engagement ID" := ObjAuditProject."Engagement ID";
                ObjAuditProjectObjective.Insert(true);
            until AuditProjectObjective.Next = 0;

        //Copy Procedures
        AuditProjectProcedure.Reset;
        AuditProjectProcedure.SetRange(AuditProjectProcedure."Engagement ID", AuditProject."Engagement ID");
        if AuditProjectProcedure.FindSet then
            repeat
                ObjAuditProjectProcedure.Init;
                ObjAuditProjectProcedure.TransferFields(AuditProjectProcedure);
                ObjAuditProjectProcedure."Engagement ID" := ObjAuditProject."Engagement ID";
                ObjAuditProjectProcedure.Insert(true);
            until AuditProjectProcedure.Next = 0;

        //Copy Checklist
        AuditProjectChecklist.Reset;
        AuditProjectChecklist.SetRange(AuditProjectChecklist."Engagement ID", AuditProject."Engagement ID");
        if AuditProjectChecklist.FindSet then
            repeat
                ObjAuditProjectChecklist.Init;
                ObjAuditProjectChecklist.TransferFields(AuditProjectChecklist);
                ObjAuditProjectChecklist."Engagement ID" := ObjAuditProject."Engagement ID";
                ObjAuditProjectChecklist.Insert(true);
            until AuditProjectChecklist.Next = 0;


        //Copy Locations
        AuditProjectLocation.Reset;
        AuditProjectLocation.SetRange(AuditProjectLocation."Engagement ID", AuditProject."Engagement ID");
        if AuditProjectLocation.FindSet then
            repeat
                ObjAuditProjectLocation.Init;
                ObjAuditProjectLocation.TransferFields(AuditProjectLocation);
                ObjAuditProjectLocation."Engagement ID" := ObjAuditProject."Engagement ID";
                ObjAuditProjectLocation.Insert(true);
            until AuditProjectLocation.Next = 0;


        //Copy Team
        AuditProjectTeam.Reset;
        AuditProjectTeam.SetRange(AuditProjectTeam."Engagement ID", AuditProject."Engagement ID");
        if AuditProjectTeam.FindSet then
            repeat
                ObjAuditProjectTeam.Init;
                ObjAuditProjectTeam.TransferFields(AuditProjectTeam);
                ObjAuditProjectTeam."Engagement ID" := ObjAuditProject."Engagement ID";
                ObjAuditProjectTeam.Insert(true);
            until AuditProjectTeam.Next = 0;


        //Copy Required Docs
        AuditProjRequiredDocument.Reset;
        AuditProjRequiredDocument.SetRange(AuditProjRequiredDocument."Engagement ID", AuditProject."Engagement ID");
        if AuditProjRequiredDocument.FindSet then
            repeat
                ObjAuditProjRequiredDocument.Init;
                ObjAuditProjRequiredDocument.TransferFields(AuditProjRequiredDocument);
                ObjAuditProjRequiredDocument."Engagement ID" := ObjAuditProject."Engagement ID";
                ObjAuditProjRequiredDocument.Insert(true);
            until AuditProjRequiredDocument.Next = 0;
        Message('Document Copied successfully and Audit Project %1 created', ObjAuditProject."Engagement ID");
    end;


    procedure FnPostACN(AuditMobilizationHeader: Record "Audit Mobilization Header1"; AuditACNRequiredDocument: Record "Audit ACN Required Document")
    var
        AuditProject: Record "Audit Project";
        ObjEntranceMeeting: Record "Audit Mobilization Header1";
        AuditeeEntranceMeeting: Page "Auditee Entrance Meeting";
    begin
        AuditAssuranceSetup.Get;
        AuditAssuranceSetup.TestField("Audit Entrace Meeting Nos.");
        AuditProject.Reset;
        AuditProject.SetRange(AuditProject."Engagement ID", AuditMobilizationHeader."Engagement ID");
        if AuditProject.FindSet then begin
            AuditProject.Status := AuditProject.Status::Ongoing;
            AuditProject.Modify;
        end;

        ObjEntranceMeeting.Init;
        ObjEntranceMeeting."Document Type" := ObjEntranceMeeting."document type"::"Audit Entrace Meeting";
        ObjEntranceMeeting."Document No." := NoSeriesManagement.GetNextNo(AuditAssuranceSetup."Audit Entrace Meeting Nos.", Today, true);
        ObjEntranceMeeting."Entrace Meeting No." := ObjEntranceMeeting."Document No.";
        ObjEntranceMeeting."Entrance Meeting Venue" := AuditMobilizationHeader."Entrance Meeting Venue";
        ObjEntranceMeeting."Entrance Meeting End Date" := AuditMobilizationHeader."Entrance Meeting End Date";
        ObjEntranceMeeting."Entrance Meeting End Time" := AuditMobilizationHeader."Entrance Meeting End Time";
        ObjEntranceMeeting."Entrance Meeting Start Date" := AuditMobilizationHeader."Entrance Meeting Start Date";
        ObjEntranceMeeting."Entrance Meeting Start Time" := AuditMobilizationHeader."Entrance Meeting Start Time";
        ObjEntranceMeeting."Audit Commencement Notice No." := AuditMobilizationHeader."Document No.";
        ObjEntranceMeeting.Validate("Audit Commencement Notice No.");
        ObjEntranceMeeting."Engagement ID" := AuditMobilizationHeader."Engagement ID";
        ObjEntranceMeeting.Validate("Engagement ID");
        if not ObjEntranceMeeting.Insert(true) then
            ObjEntranceMeeting.Modify(true);

        Message('Posted successfully and Entrance meeting %1 created', ObjEntranceMeeting."Document No.");


        ObjEntranceMeeting.Reset;
        ObjEntranceMeeting.SetRange(ObjEntranceMeeting."Document No.", ObjEntranceMeeting."Document No.");
        if ObjEntranceMeeting.FindSet then begin
            AuditeeEntranceMeeting.SetTableview(ObjEntranceMeeting);
            AuditeeEntranceMeeting.Run();
        end;
    end;


    procedure FnSuggestFWVChecklist(AuditExecutionChecklist: Record "Audit Execution Checklist"; AuditExecutionHeader: Record "Audit Execution Header"; AuditChecklistTestMethod: Record "Audit Checklist Test Method")
    var
        AuditProjectChecklist: Record "Audit Project Checklist";
        AuditChecklistTestApproach: Record "Audit Checklist Test Approach";
    begin
        //Suggest Audit Project Checklist
        AuditProjectChecklist.Reset;
        AuditProjectChecklist.SetRange(AuditProjectChecklist."Engagement ID", AuditExecutionHeader."Engagement ID");
        AuditProjectChecklist.SetFilter(AuditProjectChecklist."Fieldwork Review Status", '%1|%2', AuditProjectChecklist."fieldwork review status"::Ongoing, AuditProjectChecklist."fieldwork review status"::Planned);
        if AuditProjectChecklist.FindSet then begin
            repeat
                AuditExecutionChecklist.Init;
                AuditExecutionChecklist."Document Type" := AuditExecutionHeader."Document Type";
                AuditExecutionChecklist."Document No." := AuditExecutionHeader."Document No.";
                AuditExecutionChecklist."Engagement ID" := AuditExecutionHeader."Engagement ID";
                AuditExecutionChecklist."Checklist ID" := AuditProjectChecklist."Checklist ID";
                AuditExecutionChecklist.Description := AuditProjectChecklist.Description;
                AuditExecutionChecklist."Fieldwork Review Status" := AuditExecutionChecklist."fieldwork review status"::Completed;
                AuditExecutionChecklist."Completion %" := 100;
                AuditExecutionChecklist."Audit Procedure ID" := AuditProjectChecklist."Audit Procedure ID";
                AuditExecutionChecklist.Validate("Audit Procedure ID");
                AuditExecutionChecklist."Audit Objective ID" := AuditExecutionChecklist."Audit Objective ID";
                if not AuditExecutionChecklist.Insert(true) then
                    AuditExecutionChecklist.Modify(true);
            until AuditProjectChecklist.Next = 0;
        end;

        //Suggest Audit CHecklist Test Method
        AuditChecklistTestMethod.Reset;
        AuditChecklistTestMethod.SetRange(AuditChecklistTestMethod."Engagement ID", AuditExecutionHeader."Engagement ID");
        if AuditChecklistTestMethod.FindSet then begin
            repeat
                AuditChecklistTestApproach.Init;
                //AuditChecklistTestApproach.TRANSFERFIELDS(AuditChecklistTestMethod);
                AuditChecklistTestApproach."Document Type" := AuditExecutionHeader."Document Type";
                AuditChecklistTestApproach."Document No." := AuditExecutionHeader."Document No.";
                AuditChecklistTestApproach."Engagement ID" := AuditExecutionHeader."Engagement ID";
                AuditChecklistTestApproach."Checklist ID" := AuditChecklistTestMethod."Checklist ID";
                AuditChecklistTestApproach."Line No" := AuditChecklistTestMethod."Line No.";
                AuditChecklistTestApproach."Audit Testing Method" := AuditChecklistTestMethod."Audit Testing Method";
                AuditChecklistTestApproach."Audit Objective ID" := AuditChecklistTestMethod."Audit Objective ID";
                AuditChecklistTestApproach.Description := AuditChecklistTestMethod.Desription;
                AuditChecklistTestApproach."Audit Procedure ID" := AuditChecklistTestMethod."Audit Procedure ID";
                AuditChecklistTestApproach.Validate("Audit Procedure ID");
                if not AuditChecklistTestApproach.Insert(true) then
                    AuditChecklistTestApproach.Modify(true);
            until AuditChecklistTestMethod.Next = 0;
        end;
    end;


    procedure FnPostFWVoucher(AuditProjectChecklist: Record "Audit Project Checklist"; AuditExecutionHeader: Record "Audit Execution Header"; AuditExecutionChecklist: Record "Audit Execution Checklist")
    begin
        AuditExecutionChecklist.Reset;
        AuditExecutionChecklist.SetRange(AuditExecutionChecklist."Engagement ID", AuditExecutionHeader."Engagement ID");
        if AuditExecutionChecklist.FindSet then begin
            repeat
                AuditProjectChecklist.Reset;
                AuditProjectChecklist.SetRange(AuditProjectChecklist."Engagement ID", AuditExecutionChecklist."Engagement ID");
                AuditProjectChecklist.SetRange(AuditProjectChecklist."Checklist ID", AuditExecutionChecklist."Checklist ID");
                if AuditProjectChecklist.FindSet then begin
                    repeat
                        AuditProjectChecklist."Completion %" := AuditExecutionChecklist."Completion %";
                        AuditProjectChecklist."Fieldwork Review Status" := AuditExecutionChecklist."Fieldwork Review Status";
                        AuditProjectChecklist.Modify(true);
                    until AuditProjectChecklist.Next = 0;
                end;
            until AuditExecutionChecklist.Next = 0;
        end;
    end;


    procedure FnSuggestILSReportLines(AuditManagementActionLedger: Record "Audit Management Action Ledger"; AuditImplementationLogLine: Record "Audit Implementation Log Line"; AuditFollowupHeader: Record "Audit Followup Header")
    begin
        AuditManagementActionLedger.Reset;
        AuditManagementActionLedger.SetFilter(AuditManagementActionLedger."Auditee Implementation Status", '%1|%2', AuditManagementActionLedger."auditee implementation status"::Ongoing, AuditManagementActionLedger."auditee implementation status"::Planned);
        AuditManagementActionLedger.SetRange(AuditManagementActionLedger."Auditor Followup Review Status", AuditManagementActionLedger."auditor followup review status"::Open);
        AuditManagementActionLedger.SetRange(AuditManagementActionLedger."Primary RC ID", AuditFollowupHeader."Primary RC ID");
        if AuditManagementActionLedger.FindSet then begin
            repeat
                AuditImplementationLogLine.Init;
                //AuditImplementationLogLine.TRANSFERFIELDS(AuditManagementActionLedger);
                AuditImplementationLogLine."Document Type" := AuditFollowupHeader."Document Type";
                AuditImplementationLogLine."Document No." := AuditFollowupHeader."Document No.";
                AuditImplementationLogLine."Entry No." := AuditManagementActionLedger."Entry No.";
                AuditImplementationLogLine.Description := AuditManagementActionLedger.Description;
                AuditImplementationLogLine."Auditee Implementation Status" := AuditManagementActionLedger."auditee implementation status"::Planned;
                AuditImplementationLogLine."Auditee % Complete" := AuditManagementActionLedger."Auditee % Complete";
                AuditImplementationLogLine."Final Audit Report ID" := AuditManagementActionLedger."Final Audit Report ID";
                AuditImplementationLogLine."Engagement ID" := AuditManagementActionLedger."Engagement ID";
                AuditImplementationLogLine."Checklist ID" := AuditManagementActionLedger."Checklist ID";
                AuditImplementationLogLine."Finding ID" := AuditManagementActionLedger."Finding ID";
                AuditImplementationLogLine."Management Action ID" := AuditManagementActionLedger."Management Action ID";
                AuditImplementationLogLine."Primary RC ID" := AuditManagementActionLedger."Primary RC ID";
                AuditImplementationLogLine."Action Owner ID" := AuditManagementActionLedger."Action Owner ID";
                AuditImplementationLogLine."Due Date" := AuditManagementActionLedger."Due Date";
                AuditImplementationLogLine."Action Type" := AuditManagementActionLedger."Action Type";
                AuditImplementationLogLine."Task Priority" := AuditManagementActionLedger."Task Priority";
                AuditImplementationLogLine."Audit Procedure ID" := AuditManagementActionLedger."Audit Objective ID";
                AuditImplementationLogLine."Audit Objective ID" := AuditManagementActionLedger."Audit Objective ID";
                AuditImplementationLogLine."Dimension Set ID" := AuditManagementActionLedger."Dimension Set ID";
                if not AuditImplementationLogLine.Insert(true) then
                    AuditImplementationLogLine.Modify(true);
            until AuditManagementActionLedger.Next = 0;
        end;
    end;


    procedure FnPostILSReport(AuditManagementActionLedger: Record "Audit Management Action Ledger"; AuditImplementationLogLine: Record "Audit Implementation Log Line"; AuditFollowupHeader: Record "Audit Followup Header")
    begin
        AuditImplementationLogLine.Reset;
        AuditImplementationLogLine.SetRange(AuditImplementationLogLine."Document Type", AuditFollowupHeader."Document Type");
        AuditImplementationLogLine.SetRange(AuditImplementationLogLine."Document No.", AuditFollowupHeader."Document No.");
        if AuditImplementationLogLine.FindSet then begin
            repeat
                AuditManagementActionLedger.Reset;
                AuditManagementActionLedger.SetRange(AuditManagementActionLedger."Entry No.", AuditImplementationLogLine."Entry No.");
                if AuditManagementActionLedger.FindSet then begin
                    repeat
                        AuditManagementActionLedger."Action Owner ID" := AuditImplementationLogLine."Action Owner ID";
                        AuditManagementActionLedger."Due Date" := AuditImplementationLogLine."Due Date";
                        AuditManagementActionLedger."Task Priority" := AuditImplementationLogLine."Task Priority";
                        AuditManagementActionLedger."Auditee Implementation Status" := AuditImplementationLogLine."Auditee Implementation Status";
                        AuditManagementActionLedger."Auditee % Complete" := AuditImplementationLogLine."Auditee % Complete";
                        AuditManagementActionLedger."Actual Date Done" := AuditImplementationLogLine."Actual Date Done";
                        AuditManagementActionLedger."Last Posted Impl. Status Repot" := AuditImplementationLogLine."Document No.";
                        AuditManagementActionLedger.Modify(true);

                    until AuditManagementActionLedger.Next = 0;
                end;
            until AuditImplementationLogLine.Next = 0;
        end;

    end;


    procedure FnSuggestFAVoucherLines(AuditManagementActionLedger: Record "Audit Management Action Ledger"; AuditImplementationLogLine: Record "Audit Implementation Log Line"; AuditFollowupHeader: Record "Audit Followup Header"; FollowupAuditVoucherLine: Record "Followup Audit Voucher Line")
    begin
        AuditManagementActionLedger.Reset;
        AuditManagementActionLedger.SetRange(AuditManagementActionLedger."Auditee Implementation Status", AuditManagementActionLedger."auditee implementation status"::Completed);
        AuditManagementActionLedger.SetRange(AuditManagementActionLedger."Auditor Followup Review Status", AuditManagementActionLedger."auditor followup review status"::Open);
        if AuditManagementActionLedger.FindSet then begin
            repeat
                AuditImplementationLogLine.Init;
                //AuditImplementationLogLine.TRANSFERFIELDS(AuditManagementActionLedger);
                FollowupAuditVoucherLine."Document Type" := AuditFollowupHeader."Document Type";
                FollowupAuditVoucherLine."Document No." := AuditFollowupHeader."Document No.";
                FollowupAuditVoucherLine."Entry No." := AuditManagementActionLedger."Entry No.";
                FollowupAuditVoucherLine.Description := AuditManagementActionLedger.Description;
                FollowupAuditVoucherLine."Auditee Implementation Status" := AuditManagementActionLedger."Auditee Implementation Status";
                FollowupAuditVoucherLine."Auditee % Complete" := AuditManagementActionLedger."Auditee % Complete";
                FollowupAuditVoucherLine."Final Audit Report ID" := AuditManagementActionLedger."Final Audit Report ID";
                FollowupAuditVoucherLine."Engagement ID" := AuditManagementActionLedger."Engagement ID";
                FollowupAuditVoucherLine."Checklist ID" := AuditManagementActionLedger."Checklist ID";
                FollowupAuditVoucherLine."Finding ID" := AuditManagementActionLedger."Finding ID";
                FollowupAuditVoucherLine."Management Action ID" := AuditManagementActionLedger."Management Action ID";
                FollowupAuditVoucherLine."Primary RC ID" := AuditManagementActionLedger."Primary RC ID";
                FollowupAuditVoucherLine."Action Owner ID" := AuditManagementActionLedger."Action Owner ID";
                FollowupAuditVoucherLine."Due Date" := AuditManagementActionLedger."Due Date";
                FollowupAuditVoucherLine."Action Type" := AuditManagementActionLedger."Action Type";
                FollowupAuditVoucherLine."Task Priority" := AuditManagementActionLedger."Task Priority";
                FollowupAuditVoucherLine."Audit Procedure ID" := AuditManagementActionLedger."Audit Objective ID";
                FollowupAuditVoucherLine."Audit Objective ID" := AuditManagementActionLedger."Audit Objective ID";
                FollowupAuditVoucherLine."Dimension Set ID" := AuditManagementActionLedger."Dimension Set ID";
                if not FollowupAuditVoucherLine.Insert(true) then
                    FollowupAuditVoucherLine.Modify(true);
            until AuditManagementActionLedger.Next = 0;
        end;
    end;


    procedure FnPostFAVoucher(AuditManagementActionLedger: Record "Audit Management Action Ledger"; AuditImplementationLogLine: Record "Audit Implementation Log Line"; AuditFollowupHeader: Record "Audit Followup Header"; FollowupAuditVoucherLine: Record "Followup Audit Voucher Line")
    begin
        FollowupAuditVoucherLine.Reset;
        FollowupAuditVoucherLine.SetRange(FollowupAuditVoucherLine."Document Type", AuditFollowupHeader."Document Type");
        FollowupAuditVoucherLine.SetRange(FollowupAuditVoucherLine."Document No.", AuditFollowupHeader."Document No.");
        if FollowupAuditVoucherLine.FindSet then begin
            repeat
                AuditManagementActionLedger."Entry No." := FollowupAuditVoucherLine."Entry No.";
                AuditManagementActionLedger."Auditor Followup Review Status" := FollowupAuditVoucherLine."Auditor Followup Review Status";
                AuditManagementActionLedger."Auditor Followup Comments" := FollowupAuditVoucherLine."Auditor Followup Comments";
                AuditManagementActionLedger."Last Posted Fol. Audit Voucher" := FollowupAuditVoucherLine."Document No.";
                AuditManagementActionLedger."Last Auditor Review Date" := AuditFollowupHeader."Document Date";
                AuditManagementActionLedger.Modify(true);
            until FollowupAuditVoucherLine.Next = 0;
        end;

    end;


    procedure FnSuggestDAReportLines(AuditExecutionHeader: Record "Audit Execution Header")
    var
        ObjAuditExecutionFinding: Record "Audit Execution Finding";
        ObjAuditFindingLocation: Record "Audit Finding Location";
        ObjAuditFindingRecommendation: Record "Audit Finding Recommendation";
        ObjAuditManagementAction: Record "Audit Management Action";
        ObjAuditExecutionImplication: Record "Audit Execution Implication";
        ObjAuditPlanLineRisk: Record "Audit Plan Line Risk";
        ObjAuditManagementComment: Record "Audit Management Comment";
        AuditExecutionFinding: Record "Audit Execution Finding";
        AuditFindingLocation: Record "Audit Finding Location";
        AuditFindingRecommendation: Record "Audit Finding Recommendation";
        AuditManagementComment: Record "Audit Management Comment";
        AuditManagementAction: Record "Audit Management Action";
        AuditExecutionImplication: Record "Audit Execution Implication";
        AuditPlanLineRisk: Record "Audit Plan Line Risk";
    begin
        //1. Populate Audit Execution Finding
        AuditExecutionFinding.Reset;
        AuditExecutionFinding.SetRange(AuditExecutionFinding."Engagement ID", AuditExecutionHeader."Engagement ID");
        if AuditExecutionFinding.FindSet then begin
            repeat
                ObjAuditExecutionFinding.Init;
                ObjAuditExecutionFinding.TransferFields(AuditExecutionFinding);
                ObjAuditExecutionFinding."Document Type" := AuditExecutionHeader."Document Type";
                ObjAuditExecutionFinding."Document No." := AuditExecutionHeader."Document No.";
                if not ObjAuditExecutionFinding.Insert(true) then
                    ObjAuditExecutionFinding.Modify(true);
            until AuditExecutionFinding.Next = 0;
        end;

        //2. Populate Audit Finding Location
        AuditFindingLocation.Reset;
        AuditFindingLocation.SetRange(AuditFindingLocation."Engagement ID", AuditExecutionHeader."Engagement ID");
        if AuditFindingLocation.FindSet then begin
            repeat
                ObjAuditFindingLocation.Init;
                ObjAuditFindingLocation.TransferFields(AuditFindingLocation);
                ObjAuditFindingLocation."Document Type" := AuditExecutionHeader."Document Type";
                ObjAuditFindingLocation."Document No." := AuditExecutionHeader."Document No.";
                if not ObjAuditFindingLocation.Insert(true) then
                    ObjAuditFindingLocation.Modify(true);
            until AuditFindingLocation.Next = 0;
        end;

        //3.Populate Audit Finding Recommendations
        AuditFindingRecommendation.Reset;
        AuditFindingRecommendation.SetRange(AuditFindingRecommendation."Engagement ID", AuditExecutionHeader."Engagement ID");
        if AuditFindingRecommendation.FindSet then begin
            repeat
                ObjAuditFindingRecommendation.Init;
                ObjAuditFindingRecommendation.TransferFields(AuditFindingRecommendation);
                ObjAuditFindingRecommendation."Document Type" := AuditExecutionHeader."Document Type";
                ObjAuditFindingRecommendation."Document No." := AuditExecutionHeader."Document No.";
                if not ObjAuditFindingRecommendation.Insert(true) then
                    ObjAuditFindingRecommendation.Modify(true);
            until AuditFindingRecommendation.Next = 0;
        end;

        //4. Populate Audit Management Action
        AuditManagementAction.Reset;
        AuditManagementAction.SetRange(AuditManagementAction."Engagement ID", AuditExecutionHeader."Engagement ID");
        if AuditManagementAction.FindSet then begin
            repeat
                ObjAuditManagementAction.Init;
                ObjAuditManagementAction.TransferFields(AuditManagementAction);
                ObjAuditManagementAction."Document Type" := AuditExecutionHeader."Document Type";
                ObjAuditManagementAction."Document No." := AuditExecutionHeader."Document No.";
                if not ObjAuditManagementAction.Insert(true) then
                    ObjAuditManagementAction.Modify(true);
            until AuditManagementAction.Next = 0;
        end;
        // 7. Populate Management Comments
        AuditManagementComment.Reset;
        AuditManagementComment.SetRange(AuditManagementComment."Engagement ID", AuditExecutionHeader."Engagement ID");
        if AuditManagementComment.FindSet then begin
            repeat
                ObjAuditManagementComment.Init;
                ObjAuditManagementComment.TransferFields(AuditManagementComment);
                ObjAuditManagementComment."Document Type" := AuditExecutionHeader."Document Type";
                ObjAuditManagementComment."Document No." := AuditExecutionHeader."Document No.";
                if not ObjAuditManagementComment.Insert(true) then
                    ObjAuditManagementComment.Modify(true);
            until AuditManagementComment.Next = 0;
        end;


        //5. Populate Audit Finding Implications
        AuditExecutionImplication.Reset;
        AuditExecutionImplication.SetRange(AuditExecutionImplication."Engagement ID", AuditExecutionHeader."Engagement ID");
        if AuditExecutionImplication.FindSet then begin
            repeat
                ObjAuditExecutionImplication.Init;
                ObjAuditExecutionImplication.TransferFields(AuditExecutionImplication);
                ObjAuditExecutionImplication."Document Type" := AuditExecutionHeader."Document Type";
                ObjAuditExecutionImplication."Document No." := AuditExecutionHeader."Document No.";
                if not ObjAuditExecutionImplication.Insert(true) then
                    ObjAuditExecutionImplication.Modify(true);
            until AuditExecutionImplication.Next = 0;
        end;

        //6. Populate the Default Risks
        AuditPlanLineRisk.Reset;
        AuditPlanLineRisk.SetRange(AuditPlanLineRisk."Audit Plan ID", AuditExecutionHeader."Audit Plan ID");
        if AuditPlanLineRisk.FindSet then begin
            repeat
                ObjAuditPlanLineRisk.Init;
                ObjAuditPlanLineRisk.TransferFields(AuditPlanLineRisk);
                ObjAuditPlanLineRisk."Audit Plan ID" := AuditExecutionHeader."Audit Plan ID";
                //ObjAuditPlanLineRisk."Document No.":=AuditExecutionHeader."Document No.";
                if not ObjAuditPlanLineRisk.Insert(true) then
                    ObjAuditPlanLineRisk.Modify(true);
            until AuditPlanLineRisk.Next = 0;
        end;
    end;


    procedure FnMakeFinalAuditReportFromDraftAuditReport(AuditExecutionHeader: Record "Audit Execution Header"; AuditExecutionFinding: Record "Audit Execution Finding"; AuditFindingLocation: Record "Audit Finding Location"; AuditFindingRecommendation: Record "Audit Finding Recommendation"; AuditManagementAction: Record "Audit Management Action"; AuditManagementComment: Record "Audit Management Comment")
    var
        ObjAuditExecutionHeader: Record "Audit Execution Header";
        ObjAuditExecutionFinding: Record "Audit Execution Finding";
        ObjAuditFindingLocation: Record "Audit Finding Location";
        ObjAuditFindingRecommendation: Record "Audit Finding Recommendation";
        ObjAuditManagementAction: Record "Audit Management Action";
        ObjAuditManagementComment: Record "Audit Management Comment";
    begin
        ObjAuditExecutionHeader.Init;
        ObjAuditExecutionHeader.TransferFields(AuditExecutionHeader);
        ObjAuditExecutionHeader."Document Type" := ObjAuditExecutionHeader."document type"::"Final Audit Report";
        ObjAuditExecutionHeader."Document No." := '';
        ObjAuditExecutionHeader."Created By" := UserId;
        ObjAuditExecutionHeader."Created DateTime" := CreateDatetime(Today, Time);
        ObjAuditExecutionHeader.Status := ObjAuditExecutionHeader.Status::Open;
        ObjAuditExecutionHeader."Document Date" := Today;
        ObjAuditExecutionHeader.Published := false;
        if not ObjAuditExecutionHeader.Insert(true) then
            ObjAuditExecutionHeader.Modify(true);

        //Populate Audit Execution Finding
        AuditExecutionFinding.Reset;
        //AuditExecutionFinding.SETRANGE(AuditExecutionFinding."Engagement ID",AuditExecutionHeader."Engagement ID");
        //AuditExecutionFinding.SETRANGE(AuditExecutionFinding."Document Type",AuditExecutionFinding."Document Type"::"Draft Audit Report");
        AuditExecutionFinding.SetRange(AuditExecutionFinding."Audit Finding Status", AuditExecutionFinding."audit finding status"::Open);
        if AuditExecutionFinding.FindSet then begin
            repeat
                ObjAuditExecutionFinding.Init;
                ObjAuditExecutionFinding.TransferFields(AuditExecutionFinding);
                ObjAuditExecutionFinding."Document Type" := ObjAuditExecutionFinding."document type"::"Final Audit Report";
                ObjAuditExecutionFinding."Document No." := ObjAuditExecutionHeader."Document No.";
                if not ObjAuditExecutionFinding.Insert(true) then
                    ObjAuditExecutionFinding.Modify;

                //Insert Audit Execution Location
                AuditFindingLocation.Reset;
                AuditFindingLocation.SetRange(AuditFindingLocation."Document Type", AuditExecutionFinding."Document Type");
                AuditFindingLocation.SetRange(AuditFindingLocation."Document No.", AuditExecutionFinding."Document No.");
                AuditFindingLocation.SetRange(AuditFindingLocation."Engagement ID", AuditExecutionFinding."Engagement ID");
                AuditFindingLocation.SetRange(AuditFindingLocation."Checklist ID", AuditExecutionFinding."Checklist ID");
                AuditFindingLocation.SetRange(AuditFindingLocation."Finding ID", AuditExecutionFinding."Finding ID");
                if AuditFindingLocation.FindSet then begin
                    repeat
                        ObjAuditFindingLocation.Init;
                        ObjAuditFindingLocation.TransferFields(AuditFindingLocation);
                        ObjAuditFindingLocation."Document Type" := ObjAuditExecutionFinding."document type"::"Final Audit Report";
                        ObjAuditFindingLocation."Document No." := ObjAuditExecutionHeader."Document No.";
                        if not ObjAuditFindingLocation.Insert(true) then
                            ObjAuditFindingLocation.Modify(true);
                    until AuditFindingLocation.Next = 0;
                end;

                //Insert Audit FInding Recommendation
                AuditFindingRecommendation.Reset;
                AuditFindingRecommendation.SetRange(AuditFindingRecommendation."Document Type", AuditExecutionFinding."Document Type");
                AuditFindingRecommendation.SetRange(AuditFindingRecommendation."Document No.", AuditExecutionFinding."Document No.");
                AuditFindingRecommendation.SetRange(AuditFindingRecommendation."Engagement ID", AuditExecutionFinding."Engagement ID");
                AuditFindingRecommendation.SetRange(AuditFindingRecommendation."Checklist ID", AuditExecutionFinding."Checklist ID");
                AuditFindingRecommendation.SetRange(AuditFindingRecommendation."Finding ID", AuditExecutionFinding."Finding ID");
                if AuditFindingRecommendation.FindSet then begin
                    repeat
                        ObjAuditFindingRecommendation.Init;
                        ObjAuditFindingRecommendation.TransferFields(AuditFindingRecommendation);
                        ObjAuditFindingRecommendation."Document Type" := ObjAuditExecutionFinding."document type"::"Final Audit Report";
                        ObjAuditFindingRecommendation."Document No." := ObjAuditExecutionHeader."Document No.";
                        if not ObjAuditFindingRecommendation.Insert(true) then
                            ObjAuditFindingRecommendation.Modify(true);
                    until AuditFindingRecommendation.Next = 0;
                end;


                //Insert Audit Management Action
                AuditManagementAction.Reset;
                AuditManagementAction.SetRange(AuditManagementAction."Document Type", AuditExecutionFinding."Document Type");
                AuditManagementAction.SetRange(AuditManagementAction."Document No.", AuditExecutionFinding."Document No.");
                AuditManagementAction.SetRange(AuditManagementAction."Engagement ID", AuditExecutionFinding."Engagement ID");
                AuditManagementAction.SetRange(AuditManagementAction."Checklist ID", AuditExecutionFinding."Checklist ID");
                AuditManagementAction.SetRange(AuditManagementAction."Finding ID", AuditExecutionFinding."Finding ID");
                if AuditManagementAction.FindSet then begin
                    repeat
                        ObjAuditManagementAction.Init;
                        ObjAuditManagementAction.TransferFields(AuditManagementAction);
                        ObjAuditManagementAction."Document Type" := ObjAuditExecutionFinding."document type"::"Final Audit Report";
                        ObjAuditManagementAction."Document No." := ObjAuditExecutionHeader."Document No.";
                        if not ObjAuditManagementAction.Insert(true) then
                            ObjAuditManagementAction.Modify(true);
                    until AuditManagementAction.Next = 0;
                end;

                //Insert Comments
                AuditManagementComment.Reset;
                AuditManagementComment.SetRange(AuditManagementComment."Document Type", AuditExecutionFinding."Document Type");
                AuditManagementComment.SetRange(AuditManagementComment."Document No.", AuditExecutionFinding."Document No.");
                AuditManagementComment.SetRange(AuditManagementComment."Engagement ID", AuditExecutionFinding."Engagement ID");
                AuditManagementComment.SetRange(AuditManagementComment."Checklist ID", AuditExecutionFinding."Checklist ID");
                AuditManagementComment.SetRange(AuditManagementComment."Finding ID", AuditExecutionFinding."Finding ID");
                if AuditManagementComment.FindSet then begin
                    repeat
                        ObjAuditManagementComment.Init;
                        ObjAuditManagementComment.TransferFields(AuditManagementComment);
                        ObjAuditManagementComment."Document Type" := ObjAuditExecutionFinding."document type"::"Final Audit Report";
                        ObjAuditManagementComment."Document No." := ObjAuditExecutionHeader."Document No.";
                        if not ObjAuditManagementComment.Insert(true) then
                            ObjAuditManagementComment.Modify(true);
                    until AuditManagementComment.Next = 0;
                end;
            until AuditExecutionFinding.Next = 0;
        end;
        Message('Final Audit Report %1 created successfully', ObjAuditExecutionHeader."Document No.");
    end;


    procedure FnMakeFinalReportLines(AuditExecutionFinding: Record "Audit Execution Finding"; AuditFindingLocation: Record "Audit Finding Location"; AuditFindingRecommendation: Record "Audit Finding Recommendation"; AuditManagementComment: Record "Audit Management Comment"; AuditManagementAction: Record "Audit Management Action"; AuditExecutionHeader: Record "Audit Execution Header")
    var
        ObjAuditExecutionFinding: Record "Audit Execution Finding";
        ObjAuditFindingLocation: Record "Audit Finding Location";
        ObjAuditFindingRecommendation: Record "Audit Finding Recommendation";
        ObjAuditManagementAction: Record "Audit Management Action";
    begin
        //Populate Audit Execution Finding
        AuditExecutionFinding.Reset;
        AuditExecutionFinding.SetRange(AuditExecutionFinding."Engagement ID", AuditExecutionHeader."Engagement ID");
        if AuditExecutionFinding.FindSet then begin
            repeat
                ObjAuditExecutionFinding.Init;
                ObjAuditExecutionFinding.TransferFields(AuditExecutionFinding);
                ObjAuditExecutionFinding."Document Type" := AuditExecutionHeader."document type"::"Final Audit Report";
                ObjAuditExecutionFinding."Document No." := AuditExecutionHeader."Document No.";
                if not ObjAuditExecutionFinding.Insert(true) then
                    ObjAuditExecutionFinding.Modify(true);
            until AuditExecutionFinding.Next = 0;
        end;

        //Populate Audit Finding Location
        AuditFindingLocation.Reset;
        AuditFindingLocation.SetRange(AuditFindingLocation."Engagement ID", AuditExecutionHeader."Engagement ID");
        if AuditFindingLocation.FindSet then begin
            repeat
                ObjAuditFindingLocation.Init;
                ObjAuditFindingLocation.TransferFields(AuditFindingLocation);
                ObjAuditFindingLocation."Document Type" := AuditExecutionHeader."document type"::"Final Audit Report";
                ObjAuditFindingLocation."Document No." := AuditExecutionHeader."Document No.";
                if not ObjAuditFindingLocation.Insert(true) then
                    ObjAuditFindingLocation.Modify(true);
            until AuditFindingLocation.Next = 0;
        end;

        //Populate Audit Finding Recommendations
        AuditFindingRecommendation.Reset;
        AuditFindingRecommendation.SetRange(AuditFindingRecommendation."Engagement ID", AuditExecutionHeader."Engagement ID");
        if AuditFindingRecommendation.FindSet then begin
            repeat
                ObjAuditFindingRecommendation.Init;
                ObjAuditFindingRecommendation.TransferFields(AuditFindingRecommendation);
                ObjAuditFindingRecommendation."Document Type" := AuditExecutionHeader."document type"::"Final Audit Report";
                ObjAuditFindingRecommendation."Document No." := AuditExecutionHeader."Document No.";
                if not ObjAuditFindingRecommendation.Insert(true) then
                    ObjAuditFindingRecommendation.Modify(true);
            until AuditFindingRecommendation.Next = 0;
        end;

        //Populate Audit Management Action
        AuditManagementAction.Reset;
        AuditManagementAction.SetRange(AuditManagementAction."Engagement ID", AuditExecutionHeader."Engagement ID");
        if AuditManagementAction.FindSet then begin
            repeat
                ObjAuditManagementAction.Init;
                ObjAuditManagementAction.TransferFields(AuditManagementAction);
                ObjAuditManagementAction."Document Type" := AuditExecutionHeader."document type"::"Final Audit Report";
                ObjAuditManagementAction."Document No." := AuditExecutionHeader."Document No.";
                if not ObjAuditManagementAction.Insert(true) then
                    ObjAuditManagementAction.Modify(true);
            until AuditManagementAction.Next = 0;
        end;
    end;


    procedure FnPostFinalAuditReport(AuditExecutionFinding: Record "Audit Execution Finding"; AuditFindingRecommendation: Record "Audit Finding Recommendation"; AuditManagementAction: Record "Audit Management Action"; AuditExecutionHeader: Record "Audit Execution Header")
    var
        AuditFindingLedger: Record "Audit Finding Ledger";
        AuditRecommendationLedger: Record "Audit Recommendation Ledger";
        AuditManagementActionLedger: Record "Audit Management Action Ledger";
    begin
        AuditExecutionFinding.Reset;
        AuditExecutionFinding.SetRange(AuditExecutionFinding."Document Type", AuditExecutionHeader."Document Type");
        AuditExecutionFinding.SetRange(AuditExecutionFinding."Document No.", AuditExecutionHeader."Document No.");
        if AuditExecutionFinding.FindSet then begin
            repeat
                //Populate Audit Finding Ledger
                AuditFindingLedger.Init;
                AuditFindingLedger."Document Type" := AuditExecutionHeader."Document Type";
                AuditFindingLedger."Document No." := AuditExecutionHeader."Document No.";
                AuditFindingLedger."Engagement ID" := AuditExecutionHeader."Engagement ID";
                AuditFindingLedger."Checklist ID" := AuditExecutionFinding."Checklist ID";
                AuditFindingLedger."Finding ID" := AuditExecutionFinding."Finding ID";
                AuditFindingLedger.Description := AuditExecutionFinding.Description;
                AuditFindingLedger."Compliance Status" := AuditExecutionFinding."Compliance Status";
                AuditFindingLedger."Risk Rating" := AuditExecutionFinding."Risk Rating Code";
                AuditFindingLedger."Affects All Audit Locations" := AuditExecutionFinding."Affects All Audit Locations";
                AuditFindingLedger."Audit Procedure ID" := AuditExecutionFinding."Audit Procedure ID";
                AuditFindingLedger."Audit Objective ID" := AuditExecutionFinding."Audit Objective ID";
                AuditFindingLedger."Dimension Set ID" := AuditExecutionFinding."Dimension Set ID";
                AuditFindingLedger."Mgt Comment Received Date" := AuditExecutionFinding."Mgt Comment Received Date";
                AuditFindingLedger."Management Response Type" := AuditExecutionFinding."Management Response Type";
                AuditFindingLedger."Ganeral Management Comments" := AuditExecutionFinding."Ganeral Management Comments";
                if not AuditFindingLedger.Insert(true) then
                    AuditFindingLedger.Modify;


                //Populate Audit Recommendation Ledger
                AuditFindingRecommendation.Reset;
                AuditFindingRecommendation.SetRange(AuditFindingRecommendation."Document Type", AuditExecutionFinding."Document Type");
                AuditFindingRecommendation.SetRange(AuditFindingRecommendation."Document No.", AuditExecutionFinding."Document No.");
                AuditFindingRecommendation.SetRange(AuditFindingRecommendation."Engagement ID", AuditExecutionFinding."Engagement ID");
                AuditFindingRecommendation.SetRange(AuditFindingRecommendation."Checklist ID", AuditExecutionFinding."Checklist ID");
                AuditFindingRecommendation.SetRange(AuditFindingRecommendation."Finding ID", AuditExecutionFinding."Finding ID");
                if AuditFindingRecommendation.FindSet then begin
                    repeat
                        AuditRecommendationLedger.Init;
                        AuditRecommendationLedger."Document Type" := AuditExecutionHeader."Document Type";
                        AuditRecommendationLedger."Document No." := AuditExecutionHeader."Document No.";
                        AuditRecommendationLedger."Engagement ID" := AuditFindingRecommendation."Engagement ID";
                        AuditRecommendationLedger."Checklist ID" := AuditFindingRecommendation."Checklist ID";
                        AuditRecommendationLedger."Finding ID" := AuditFindingRecommendation."Finding ID";
                        AuditRecommendationLedger."Recommendation ID" := AuditFindingRecommendation."Recommendation ID";
                        AuditRecommendationLedger.Description := AuditFindingRecommendation.Description;
                        AuditRecommendationLedger."Risk Rating" := AuditFindingRecommendation."Risk Rating Code";
                        AuditRecommendationLedger."Audit Procedure ID" := AuditFindingRecommendation."Audit Procedure ID";
                        AuditRecommendationLedger."Audit Objective ID" := AuditFindingRecommendation."Audit Objective ID";
                        AuditRecommendationLedger."Dimension Set ID" := AuditFindingRecommendation."Dimension Set ID";
                        if not AuditRecommendationLedger.Insert(true) then
                            AuditRecommendationLedger.Modify(true);
                    until AuditFindingRecommendation.Next = 0;
                end;


                //Populate Audit Management Action ledger
                AuditManagementAction.Reset;
                AuditManagementAction.SetRange(AuditManagementAction."Document Type", AuditExecutionFinding."Document Type");
                AuditManagementAction.SetRange(AuditManagementAction."Document No.", AuditExecutionFinding."Document No.");
                AuditManagementAction.SetRange(AuditManagementAction."Engagement ID", AuditExecutionFinding."Engagement ID");
                AuditManagementAction.SetRange(AuditManagementAction."Checklist ID", AuditExecutionFinding."Checklist ID");
                AuditManagementAction.SetRange(AuditManagementAction."Finding ID", AuditExecutionFinding."Finding ID");
                if AuditManagementAction.FindSet then begin
                    repeat
                        AuditManagementActionLedger.Init;
                        AuditManagementActionLedger."Entry No." := AuditManagementActionLedger.Count + 1;
                        AuditManagementActionLedger."Final Audit Report ID" := AuditManagementAction."Document No.";
                        AuditManagementActionLedger."Engagement ID" := AuditManagementAction."Engagement ID";
                        AuditManagementActionLedger."Checklist ID" := AuditManagementAction."Checklist ID";
                        AuditManagementActionLedger."Finding ID" := AuditManagementAction."Finding ID";
                        AuditManagementActionLedger."Management Action ID" := AuditManagementAction."Management Action ID";
                        AuditManagementActionLedger.Description := AuditManagementAction.Description;
                        AuditManagementActionLedger."Primary RC ID" := AuditManagementAction."Primary RC ID";
                        AuditManagementActionLedger."Action Owner ID" := AuditManagementAction."Action Owner ID";
                        AuditManagementActionLedger."Due Date" := AuditManagementAction."Due Date";
                        AuditManagementActionLedger."Action Type" := AuditManagementAction."Action Type";
                        AuditManagementActionLedger."Task Priority" := AuditManagementAction."Task Priority";
                        AuditManagementActionLedger."Auditee Implementation Status" := AuditManagementActionLedger."auditee implementation status"::Planned;
                        AuditManagementActionLedger.Validate("Auditee Implementation Status");
                        AuditManagementActionLedger."Auditor Followup Review Status" := AuditManagementActionLedger."auditor followup review status"::Open;
                        AuditManagementActionLedger.Validate("Auditee % Complete");
                        AuditManagementActionLedger."Audit Objective ID" := AuditManagementAction."Audit Objective ID";
                        AuditManagementActionLedger."Dimension Set ID" := AuditManagementAction."Dimension Set ID";
                        if not AuditManagementActionLedger.Insert(true) then
                            AuditManagementActionLedger.Modify(true);
                    until AuditManagementAction.Next = 0;
                end;
            until AuditExecutionFinding.Next = 0;
        end;
    end;


    procedure FnCheckIfAnyOpenLinesExist(AuditExecutionHeader: Record "Audit Execution Header"; AuditExecutionFinding: Record "Audit Execution Finding")
    var
        TXT0002: label 'There are open lines for final report %1. Please close them before posting.';
    begin
        AuditExecutionFinding.Reset;
        AuditExecutionFinding.SetRange(AuditExecutionFinding."Document Type", AuditExecutionHeader."Document Type");
        AuditExecutionFinding.SetRange(AuditExecutionFinding."Document No.", AuditExecutionHeader."Document No.");
        AuditExecutionFinding.SetRange(AuditExecutionFinding."Audit Finding Status", AuditExecutionFinding."audit finding status"::Open);
        if AuditExecutionFinding.FindFirst then
            Error(TXT0002, AuditExecutionHeader."Document No.");
    end;


    procedure FnPublishFinalReport(AuditExecutionHeader: Record "Audit Execution Header")
    var
        TXT0001: label 'Final Audit Report %1 Published Successfully.';
    begin
        AuditExecutionHeader.Published := true;
        AuditExecutionHeader.Modify(true);
        Message(TXT0001, AuditExecutionHeader."Document No.");
    end;


    procedure FnUpdateAuditProjectFromFinalAuditReport(AuditProject: Record "Audit Project"; AuditExecutionHeader: Record "Audit Execution Header")
    begin
        AuditProject.Reset;
        AuditProject.SetRange(AuditProject."Engagement ID", AuditExecutionHeader."Engagement ID");
        if AuditProject.FindSet then begin
            AuditProject.Status := AuditProject.Status::Completed;
            AuditProject.Modify(true);
        end;
    end;

    procedure FNnotifyAuditee(AuditMobilizationHeader: Record "Audit Mobilization Header1")
    var
        MyResources: Record Resource;
        Engaments: Record "Audit Project";
        Resources: Record "Audit Project Team";
        Window: Dialog;
        EmailBody: array[2] of Text[30];
        BodyText: Text[250];
        mymail: Codeunit Mail;
        WindowisOpen: Boolean;
        FileDialog: Codeunit "Email Message";
        SendingDate: Date;
        SendingTime: Time;
        Counter: Integer;
        cu400: Codeunit "Email Message";
        SenderAddress: Text[100];
        UserSetup: Record "User Setup";
        HRSetup: Record "Human Resources Setup";
        CompInfo: Record "Company Information";
        RequesterName: Text[100];
        RequesterEmail: Text[100];
        emailhdr: Text[100];
        ProcNote: Text[1000];
        LoginDetails: Text[1000];
        CustEmail: Text[100];
        CompanyDetails: Text[250];
        SupplierDetails: Text[1000];
        SenderMessage: Text[1000];
        FileDirectory: Text[100];
        FileName: Text[100];
        Plannedstartdate: Text[250];
    begin
        Resources.Reset;
        Resources.SetRange("Resource No.", AuditMobilizationHeader."Auditee Lead ID");
        if Resources.FindSet then begin
            CompInfo.Get;
            HRSetup.Get;
            //RequesterEmail:=Resources.Email;
            //RequesterName:=Resources.Name;
            Plannedstartdate := Format(AuditMobilizationHeader."Planned Start Date");
            Window.Open('Sending...');
            WindowisOpen := true;
            Engaments.Reset;
            Engaments.SetRange("Engagement ID", AuditMobilizationHeader."Engagement ID");
            if Engaments.FindSet then
                MyResources.Reset;
            MyResources.SetRange("No.", Engaments."Chief Audit Executive ID");
            if MyResources.FindSet then
                RequesterEmail := MyResources.Email;
            RequesterName := MyResources.Name;
            //Create message
            if Resources.Email = '' then
                Error('Kindly Ensure the Lead Auditee Has a valid E-Mail Address');
            SenderAddress := HRSetup."HR E-mail Address";
            CustEmail := Resources.Email;
            CompanyDetails := 'Dear ' + Resources.Name;
            SenderMessage := '<BR>This is to Notify of the Upcoming Audit Engagement ID' + AuditMobilizationHeader."Engagement ID" + ' :'
            + AuditMobilizationHeader."Engagement Name" + ' ,The Audit Engagement shall commence as from ' + Format(AuditMobilizationHeader."Planned Start Date")
            + 'to ' + Format(AuditMobilizationHeader."Planned End Date") + '  </BR>';
            SupplierDetails := '';
            //LoginDetails:='Regards';
            ProcNote := '<BR> Below are the Tentative Audit Entrance Meeting details<BR>' + 'Meeting Venue :' + AuditMobilizationHeader."Entrance Meeting Venue"
            + '<BR> Entrance Meeting Date : ' + Format(AuditMobilizationHeader."Entrance Meeting Start Date") + '<BR>Entrance Meeting Time : '
            + Format(AuditMobilizationHeader."Entrance Meeting Start Time") + '<BR><B>Kind Regard</B>';
            AuditMobilizationHeader.Reset;
            AuditMobilizationHeader.SetRange("Document No.", AuditMobilizationHeader."Document No.");
            if AuditMobilizationHeader.FindSet then
                FileDirectory := 'C:\DOCS\';
            FileName := 'Engagement Letter_' + AuditMobilizationHeader."Document No." + '.pdf';
            //Report.SaveAsPdf(95015, FileDirectory + FileName, AuditMobilizationHeader);
            if CustEmail = '' then
                exit;
            //MESSAGE:='Regards.';
            //MESSAGE:='This is to notify you that there has been a request for Registration ' +  SupplierRequest."No." + ' From Supplier'+ SupplierRequest.Name;
            emailhdr := AuditMobilizationHeader."Engagement Name";
            // cu400.Create(CompInfo.Name, SenderAddress, CustEmail, emailhdr,
            // CompanyDetails + '<BR></BR>' + SenderMessage + SupplierDetails + LoginDetails, true);
            // cu400.AddCC(RequesterEmail);
            // cu400.AppendToBody(ProcNote);
            // cu400.AddAttachment(FileDirectory + FileName, FileName);
            // cu400.Send;
            SendingDate := Today;
            SendingTime := Time;
            Sleep(1000);
            Window.Close;
            // UNTIL InsuranceReg.NEXT=0;
        end;
        //MESSAGE
        //END;
    end;

    procedure FNnotifyAuditor(AuditMobilizationHeader: Record "Audit Execution Header")
    var
        Resources: Record Resource;
        Window: Dialog;
        EmailBody: array[2] of Text[30];
        BodyText: Text[250];
        mymail: Codeunit Mail;
        WindowisOpen: Boolean;
        FileDialog: Codeunit "Email Message";
        SendingDate: Date;
        SendingTime: Time;
        Counter: Integer;
        cu400: Codeunit "Email Message";
        SenderAddress: Text[100];
        UserSetup: Record "User Setup";
        HRSetup: Record "Human Resources Setup";
        CompInfo: Record "Company Information";
        RequesterName: Text[100];
        RequesterEmail: Text[100];
        emailhdr: Text[100];
        ProcNote: Text[1000];
        LoginDetails: Text[1000];
        CustEmail: Text[100];
        CompanyDetails: Text[250];
        SupplierDetails: Text[1000];
        SenderMessage: Text[1000];
        FileDirectory: Text[100];
        FileName: Text[100];
        Plannedstartdate: Text[250];
    begin
        Resources.Reset;
        Resources.SetRange("No.", AuditMobilizationHeader."Audit Lead ID");
        if Resources.FindSet then begin
            Resources.TestField(Email);
            CompInfo.Get;
            HRSetup.Get;
            RequesterEmail := Resources.Email;
            RequesterName := Resources.Name;
            //Plannedstartdate:=FORMAT(AuditMobilizationHeader."Planned Start Date");
            Window.Open('Sending notification to the lead auditor.....');
            WindowisOpen := true;
            //Create message
            // IF Resources."E-Mail"='' THEN
            //  ERROR('Kindly Ensure the Lead Auditee Has a valid E-Mail Address');
            SenderAddress := HRSetup."HR E-mail Address";
            CustEmail := Resources.Email;
            CompanyDetails := 'Dear ' + Resources.Name;
            SenderMessage := '<BR>This is to Notify you that Response' + AuditMobilizationHeader."Document No." + ' for' + ' ' + AuditMobilizationHeader."Engagement ID" + ' '
            + AuditMobilizationHeader."Engagement Name" + ' ,has been submitted for your review.'
            + 'Please check' + '</BR>';
            SupplierDetails := '';
            //LoginDetails:='Regards';
            //ProcNote:='<BR> Below are the Tentative Audit Entrance Meeting details<BR>'+'Meeting Venue :'+AuditMobilizationHeader."Entrance Meeting Venue"
            //+'<BR> Entrance Meeting Date : '+FORMAT(AuditMobilizationHeader."Entrance Meeting Start Date")+'<BR>Entrance Meeting Time : '
            AuditMobilizationHeader.Reset;
            AuditMobilizationHeader.SetRange("Document No.", AuditMobilizationHeader."Document No.");
            if AuditMobilizationHeader.FindSet then
                FileDirectory := 'C:\DOCS\';
            FileName := 'Auditee_Notice_Response_' + AuditMobilizationHeader."Document No." + '.pdf';
            //Report.SaveAsPdf(95016, FileDirectory + FileName, AuditMobilizationHeader);
            if CustEmail = '' then
                exit;
            //MESSAGE:='Regards.';
            //MESSAGE:='This is to notify you that there has been a request for Registration ' +  SupplierRequest."No." + ' From Supplier'+ SupplierRequest.Name;
            emailhdr := UpperCase(AuditMobilizationHeader."Engagement Name");
            // cu400.Create(CompInfo.Name, SenderAddress, CustEmail, emailhdr,
            // CompanyDetails + '<BR></BR>' + SenderMessage + SupplierDetails + LoginDetails, true);
            // cu400.AddCC(RequesterEmail);
            // cu400.AppendToBody(ProcNote);
            // cu400.AddAttachment(FileDirectory + FileName, FileName);
            // cu400.Send();
            SendingDate := Today;
            SendingTime := Time;
            Sleep(1000);
            Window.Close;
            // UNTIL InsuranceReg.NEXT=0;
        end;
        //MESSAGE
        //END;
    end;

    procedure FNnotifyAudiTOR2(AuditMobilizationHeader: Record "Audit Mobilization Header1")
    var
        MyResources: Record Resource;
        Engaments: Record "Audit Project";
        Resources: Record "Audit Project Team";
        Window: Dialog;
        EmailBody: array[2] of Text[30];
        BodyText: Text[250];
        mymail: Codeunit Mail;
        WindowisOpen: Boolean;
        FileDialog: Codeunit "Email Message";
        SendingDate: Date;
        SendingTime: Time;
        Counter: Integer;
        cu400: Codeunit "Email Message";
        SenderAddress: Text[100];
        UserSetup: Record "User Setup";
        HRSetup: Record "Human Resources Setup";
        CompInfo: Record "Company Information";
        RequesterName: Text[100];
        RequesterEmail: Text[100];
        emailhdr: Text[100];
        ProcNote: Text[1000];
        LoginDetails: Text[1000];
        CustEmail: Text[100];
        CompanyDetails: Text[250];
        SupplierDetails: Text[1000];
        SenderMessage: Text[1000];
        FileDirectory: Text[100];
        FileName: Text[100];
        Plannedstartdate: Text[250];
    begin
        Resources.Reset;
        Resources.SetRange("Resource No.", AuditMobilizationHeader."Audit Lead ID");
        if Resources.FindSet then begin
            CompInfo.Get;
            HRSetup.Get;
            //RequesterEmail:=Resources.Email;
            //RequesterName:=Resources.Name;
            Plannedstartdate := Format(AuditMobilizationHeader."Planned Start Date");
            Window.Open('Sending...');
            WindowisOpen := true;
            Engaments.Reset;
            Engaments.SetRange("Engagement ID", AuditMobilizationHeader."Engagement ID");
            if Engaments.FindSet then
                MyResources.Reset;
            MyResources.SetRange("No.", Engaments."Chief Audit Executive ID");
            if MyResources.FindSet then
                RequesterEmail := MyResources.Email;
            RequesterName := MyResources.Name;
            //Create message
            if Resources.Email = '' then
                Error('Kindly Ensure the Lead Auditee Has a valid E-Mail Address');
            SenderAddress := HRSetup."HR E-mail Address";
            CustEmail := Resources.Email;
            CompanyDetails := 'Dear ' + Resources.Name;
            SenderMessage := '<BR>This is to Notify of the Upcoming Audit Engagement ID' + AuditMobilizationHeader."Engagement ID" + ' :'
            + AuditMobilizationHeader."Engagement Name" + ' ,The Audit Engagement shall commence as from ' + Format(AuditMobilizationHeader."Planned Start Date")
            + 'to ' + Format(AuditMobilizationHeader."Planned End Date") + '  </BR>';
            SupplierDetails := '';
            //LoginDetails:='Regards';
            ProcNote := '<BR> Below are the Tentative Audit Entrance Meeting details<BR>' + 'Meeting Venue :' + AuditMobilizationHeader."Entrance Meeting Venue"
            + '<BR> Entrance Meeting Date : ' + Format(AuditMobilizationHeader."Entrance Meeting Start Date") + '<BR>Entrance Meeting Time : '
            + Format(AuditMobilizationHeader."Entrance Meeting Start Time") + '<BR><B>Kind Regard</B>';
            AuditMobilizationHeader.Reset;
            AuditMobilizationHeader.SetRange("Document No.", AuditMobilizationHeader."Document No.");
            if AuditMobilizationHeader.FindSet then
                FileDirectory := 'C:\DOCS\';
            FileName := 'Engagement Letter_' + AuditMobilizationHeader."Document No." + '.pdf';
            //Report.SaveAsPdf(95015, FileDirectory + FileName, AuditMobilizationHeader);
            if CustEmail = '' then
                exit;
            //MESSAGE:='Regards.';
            //MESSAGE:='This is to notify you that there has been a request for Registration ' +  SupplierRequest."No." + ' From Supplier'+ SupplierRequest.Name;
            emailhdr := AuditMobilizationHeader."Engagement Name";
            // cu400.Create(CompInfo.Name, SenderAddress, CustEmail, emailhdr,
            // CompanyDetails + '<BR></BR>' + SenderMessage + SupplierDetails + LoginDetails, true);
            // cu400.AddCC(RequesterEmail);
            // cu400.AppendToBody(ProcNote);
            // cu400.AddAttachment(FileDirectory + FileName, FileName);
            // cu400.Send;
            SendingDate := Today;
            SendingTime := Time;
            Sleep(1000);
            Window.Close;
            // UNTIL InsuranceReg.NEXT=0;
        end;
        //MESSAGE
        //END;
    end;

    procedure FNnotifyImplementationLead(AuditFollowupHeader: Record "Audit Followup Header")
    var
        MyResources: Record Resource;
        Engaments: Record "Audit Project";
        Resources: Record "Audit Project Team";
        Window: Dialog;
        EmailBody: array[2] of Text[30];
        BodyText: Text[250];
        mymail: Codeunit Mail;
        WindowisOpen: Boolean;
        FileDialog: Codeunit "Email Message";
        SendingDate: Date;
        SendingTime: Time;
        Counter: Integer;
        cu400: Codeunit "Email Message";
        SenderAddress: Text[100];
        UserSetup: Record "User Setup";
        HRSetup: Record "Human Resources Setup";
        CompInfo: Record "Company Information";
        RequesterName: Text[100];
        RequesterEmail: Text[100];
        emailhdr: Text[100];
        ProcNote: Text[1000];
        LoginDetails: Text[1000];
        CustEmail: Text[100];
        CompanyDetails: Text[250];
        SupplierDetails: Text[1000];
        SenderMessage: Text[1000];
        FileDirectory: Text[100];
        FileName: Text[100];
        Plannedstartdate: Text[250];
        ResponsibilityCenter: Record "Responsibility Center";
        Employee: Record Employee;
    begin

        CompInfo.Get;
        HRSetup.Get;
        Window.Open('Sending...');
        WindowisOpen := true;

        ResponsibilityCenter.Reset;
        ResponsibilityCenter.SetRange(Code, AuditFollowupHeader."Primary RC ID");
        if ResponsibilityCenter.FindSet then
            Employee.Reset;
        Employee.SetRange("No.", ResponsibilityCenter."Current Head");
        if Employee.Find('-') then begin
            RequesterEmail := Employee."Company E-Mail";
            RequesterName := Employee.FullName;
        end;
        //Create message
        if RequesterEmail = '' then
            Error('Kindly Ensure the Lead Auditee Has a valid E-Mail Address');
        SenderAddress := HRSetup."HR E-mail Address";
        CustEmail := RequesterEmail;
        CompanyDetails := 'Dear ' + Employee.FullName;
        SenderMessage := '<BR>This is to Notify of you of the pending implementation status log number' + AuditFollowupHeader."Document No." + ' :'
        + AuditFollowupHeader.Description + ' ,Kindly log in and update. </BR>';

        if CustEmail = '' then
            exit;
        // cu400.Create(CompInfo.Name, SenderAddress,
        // CustEmail, 'Implementation Status Log  -' + 'Document No : ' + AuditFollowupHeader."Document No." + '-' + AuditFollowupHeader.Description,
        // 'Dear ' + 'Head' + ',<BR><BR>' +
        // 'Please Login to the ERP to update the above implementation status log', true);

        // cu400.AppendToBody(
        // '<BR><BR>Kind Regards,');
        // cu400.AppendToBody('<BR>' + CompInfo.Name);
        // cu400.AddAttachment(FileDirectory + FileName, FileName);
        // cu400.Send;
        Sleep(1000);
        Window.Close;

        // UNTIL InsuranceReg.NEXT=0;
    end;

    procedure FnPostRiskIncidentLogs(RiskIncidentLog: Record "Risk Incident Log"; RiskIncidentLedgerEntry: Record "Risk Incident Ledger Entry"; RiskIncidentLogImpact: Record "Risk Incident Log Impact R")
    var
        PoLogActions: Record "Risk Incident Log Actions";
        LogAction: Record "Risk Incident Log Action";
    begin
        RiskIncidentLogImpact.Reset;
        RiskIncidentLogImpact.SetRange(RiskIncidentLogImpact."Incident No", RiskIncidentLog."Incident ID");
        if RiskIncidentLogImpact.FindSet then begin
            repeat
                RiskIncidentLedgerEntry.Init;
                RiskIncidentLedgerEntry."Entry No" := RiskIncidentLedgerEntry.Count + 1;
                RiskIncidentLedgerEntry."Posting Date" := Today;
                RiskIncidentLedgerEntry."Posted By" := UserId;
                RiskIncidentLedgerEntry."Incident Document Type" := RiskIncidentLog."Risk Register Type";
                RiskIncidentLedgerEntry."HSE Management Plan ID" := RiskIncidentLog."HSE Management Plan ID";
                RiskIncidentLedgerEntry."Hazard ID" := RiskIncidentLog."Hazard ID";
                RiskIncidentLedgerEntry."Risk Management Plan ID" := RiskIncidentLog."Risk Management Plan ID";
                if not RiskIncidentLedgerEntry.Insert(true) then
                    RiskIncidentLedgerEntry.Modify(true);
            until RiskIncidentLogImpact.Next = 0;
        end;
        LogAction.Reset;
        LogAction.SetRange("Incident ID", RiskIncidentLog."Incident ID");
        if LogAction.FindSet then begin
            repeat
                PoLogActions.Init;
                PoLogActions."Incident ID" := LogAction."Incident ID";
                PoLogActions."Action Line No." := LogAction."Action Line No.";
                PoLogActions."Action Type" := LogAction."Action Type";
                PoLogActions.Description := LogAction.Description;
                PoLogActions."Action Status" := LogAction."Action Status";
                PoLogActions."% Complete" := LogAction."% Complete";
                PoLogActions."Actual Date Done" := LogAction."Actual Date Done";
                PoLogActions."Responsible Officer No." := LogAction."Responsible Officer No.";
                PoLogActions."Task Priority" := LogAction."Task Priority";
                PoLogActions."Planned Start Date" := LogAction."Planned Start Date";
                PoLogActions."Planned Due Date" := LogAction."Planned Due Date";
                PoLogActions.Insert(true);
            until LogAction.Next = 0;
        end;
    end;

    procedure FNnotifyEscalator(RiskLog: Record "Risk Incident Log")
    var
        MyResources: Record Resource;
        Engaments: Record "Audit Project";
        Resources: Record "Audit Project Team";
        Window: Dialog;
        EmailBody: array[2] of Text[30];
        BodyText: Text[250];
        mymail: Codeunit Mail;
        WindowisOpen: Boolean;
        FileDialog: Codeunit "Email Message";
        SendingDate: Date;
        SendingTime: Time;
        Counter: Integer;
        cu400: Codeunit "Email Message";
        SenderAddress: Text[100];
        UserSetup: Record "User Setup";
        HRSetup: Record "Human Resources Setup";
        CompInfo: Record "Company Information";
        RequesterName: Text[100];
        RequesterEmail: Text[100];
        emailhdr: Text[100];
        ProcNote: Text[1000];
        LoginDetails: Text[1000];
        CustEmail: Text[100];
        CompanyDetails: Text[250];
        SupplierDetails: Text[1000];
        SenderMessage: Text[1000];
        FileDirectory: Text[100];
        FileName: Text[100];
        Plannedstartdate: Text[250];
        ResponsibilityCenter: Record "Responsibility Center";
        Employee: Record Employee;
    begin
        //cc Send Escalation Notification
        CompInfo.Get;
        HRSetup.Get;
        Window.Open('Sending...');
        WindowisOpen := true;

        //cc
        RequesterEmail := RiskLog.Email;
        RequesterName := RiskLog."Ecalate to Officer Name";
        //Create message
        if RequesterEmail = '' then
            Error('Kindly Ensure the Escalator Has a valid E-Mail Address');
        SenderAddress := HRSetup."HR E-mail Address";
        CustEmail := RequesterEmail;
        CompanyDetails := 'Dear ' + Employee.FullName;
        SenderMessage := '<BR>This is to Notify of an Escalation of Incident ID :' + RiskLog."Incident ID" + ' :'
        + RiskLog."Incident Description" + ' ,Kindly log in and update. </BR>';

        //MESSAGE('%1',CustEmail);
        if CustEmail = '' then
            exit;
        // cu400.Create(CompInfo.Name, SenderAddress,
        // CustEmail, 'Escalation Incident ID  -' + 'Incident Description : ' + RiskLog."Incident ID" + '-' + RiskLog."Incident Description",
        // 'Dear ' + 'Head' + ',<BR><BR>' +
        // 'Please Login to the ERP to update the above Escalation status log', true);

        // cu400.AppendToBody(
        // '<BR><BR>Kind Regards,');
        // cu400.AppendToBody('<BR>' + CompInfo.Name);
        // cu400.AddAttachment(FileDirectory + FileName, FileName);
        // cu400.Send;
        Sleep(1000);
        Window.Close;
        Message('Escalation Notification Has Been Forwarded.');
        // UNTIL InsuranceReg.NEXT=0;
    end;

    // procedure FNnotifyBoard(RiskLog: Record "Board Meetings")
    // var
    //     MyResources: Record Resource;
    //     Engaments: Record "Audit Project";
    //     Resources: Record "Audit Project Team";
    //     Window: Dialog;
    //     EmailBody: array[2] of Text[30];
    //     BodyText: Text[250];
    //     mymail: Codeunit Mail;
    //     WindowisOpen: Boolean;
    //     FileDialog: Codeunit "Email Message";
    //     SendingDate: Date;
    //     SendingTime: Time;
    //     Counter: Integer;
    //     cu400: Codeunit "Email Message";
    //     SenderAddress: Text[100];
    //     UserSetup: Record "User Setup";
    //     HRSetup: Record "Human Resources Setup";
    //     CompInfo: Record "Company Information";
    //     RequesterName: Text[100];
    //     RequesterEmail: Text[100];
    //     emailhdr: Text[100];
    //     ProcNote: Text[1000];
    //     LoginDetails: Text[1000];
    //     CustEmail: Text[100];
    //     CompanyDetails: Text[250];
    //     SupplierDetails: Text[1000];
    //     SenderMessage: Text[1000];
    //     FileDirectory: Text[100];
    //     FileName: Text[100];
    //     Plannedstartdate: Text[250];
    //     ResponsibilityCenter: Record "Responsibility Center";
    //     Employee: Record Employee;
    // begin
    //     //cc Send Escalation Notification
    //     CompInfo.Get;
    //     HRSetup.Get;
    //     Window.Open('Sending...');
    //     WindowisOpen := true;

    //     //cc
    //     Employee.Reset;
    //     Employee.SetRange("No.", '00219');
    //     if Employee.FindSet then

    //         //need to add list of board members


    //         RequesterEmail := Employee."E-Mail";
    //     RequesterName := Employee."First Name";
    //     //Create message
    //     if RequesterEmail = '' then
    //         Error('Kindly Ensure the Board Member Has a valid E-Mail Address');
    //     SenderAddress := HRSetup."HR E-mail Address";
    //     CustEmail := RequesterEmail;
    //     CompanyDetails := 'Dear ' + Employee.FullName;
    //     SenderMessage := '<BR>This is to Notify of a Escalation of Incident ID :' + RiskLog."Conference Venue" + ' :'
    //     + RiskLog.Description + ' ,Kindly log in and update. </BR>';

    //     //MESSAGE('%1',CustEmail);
    //     if CustEmail = '' then
    //         exit;
    //     // cu400.Create(CompInfo.Name, SenderAddress,
    //     // CustEmail, 'Invitation To Board Meeting.  ' + RiskLog."Conference Venue" + '-' + RiskLog.Description,
    //     // 'Dear ' + 'Directors' + ',<BR><BR>' +
    //     // 'Please Login to the E-Board Portal to accept or decline the invitation of the upcoming meeting.', true);

    //     // cu400.AppendToBody(
    //     // '<BR><BR>Kind Regards,');
    //     // cu400.AppendToBody('<BR>' + CompInfo.Name);
    //     // cu400.AddAttachment(FileDirectory + FileName, FileName);
    //     // cu400.Send;
    //     Sleep(1000);
    //     Window.Close;
    //     Message('The Directors Have Been Notified Sucessfully.');
    //     // UNTIL InsuranceReg.NEXT=0;
    // end;

    procedure FnPostRiskIncidentFollowup(RiskIncidentLog: Record "Risk Incident Log"; RiskIncidentLedgerEntry: Record "Risk Incident Ledger Entry"; RiskIncidentLogImpact: Record "Risk Incident Log Impact R")
    var
        PoLogActions: Record "Risk Incident Log Actions";
        LogAction: Record "Risk Incident Log Action";
    begin
        LogAction.Reset;
        LogAction.SetRange("Incident ID", RiskIncidentLog."Incident ID");
        if LogAction.FindSet then begin
            repeat
                PoLogActions.Reset;
                PoLogActions.SetRange("Incident ID", RiskIncidentLog."Risk Incident No.");
                PoLogActions.SetRange("Action Line No.", LogAction."Action Line No.");
                if PoLogActions.FindSet then begin
                    PoLogActions.Init;
                    PoLogActions."Action Status" := LogAction."Action Status";
                    PoLogActions."% Complete" := LogAction."% Complete";
                    PoLogActions."Actual Date Done" := LogAction."Actual Date Done";
                    PoLogActions.Comments := LogAction.Comments;
                    PoLogActions.Modify(true);
                end;
            until LogAction.Next = 0;
        end;
    end;

    procedure FnSuggestFollowUp(RiskIncidentLog: Record "Risk Incident Log"; RiskIncidentLedgerEntry: Record "Risk Incident Ledger Entry"; RiskIncidentLogImpact: Record "Risk Incident Log Impact R")
    var
        PoLogActions: Record "Risk Incident Log Action";
        LogAction: Record "Risk Incident Log Actions";
    begin
        LogAction.Reset;
        LogAction.SetRange("Incident ID", RiskIncidentLog."Risk Incident No.");
        if LogAction.FindSet then begin
            repeat
                PoLogActions.Init;
                PoLogActions."Incident ID" := RiskIncidentLog."Incident ID";
                PoLogActions."Action Line No." := LogAction."Action Line No.";
                PoLogActions."Action Type" := LogAction."Action Type";
                PoLogActions.Description := LogAction.Description;
                PoLogActions."Action Status" := LogAction."Action Status";
                PoLogActions."% Complete" := LogAction."% Complete";
                PoLogActions."Actual Date Done" := LogAction."Actual Date Done";
                PoLogActions."Responsible Officer No." := LogAction."Responsible Officer No.";
                PoLogActions."Task Priority" := LogAction."Task Priority";
                PoLogActions."Planned Start Date" := LogAction."Planned Start Date";
                PoLogActions."Planned Due Date" := LogAction."Planned Due Date";
                PoLogActions.Insert(true);
            until LogAction.Next = 0;
        end;
        Message('Suggessted Successfully');
    end;
}

