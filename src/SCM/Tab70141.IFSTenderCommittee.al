table 70141 "IFS Tender Committee"
{
    DrillDownPageID = "IFS Tender Committees";
    LookupPageID = "IFS Tender Committees";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Document No."; Code[20])
        {
            Description = 'Linked to E-Procurement No. Series (Procurement Standing Committee No. Series field)';

            trigger OnValidate()
            begin
                if "Document No." <> '' then begin

                    ProcurementSetup.TestField("IFS Tender Committee No.");
                    NoMgt.TestManual(ProcurementSetup."IFS Tender Committee No.");
                    "No. Series" := ''
                end;
            end;
        }
        field(2; "Committee Type"; Code[10])
        {
            TableRelation = "Procurement Committee Types"."Committee Type";

            trigger OnValidate()
            begin
                ProcCommType.Reset;
                ProcCommType.SetRange("Committee Type", "Committee Type");
                if ProcCommType.FindSet then begin
                    ProcCommType.CalcFields("Min. No. of Members");
                    "Min Required No. of Members" := ProcCommType."Min. No. of Members";
                    Inspection := ProcCommType."Inspection Committee";
                end;
            end;
        }
        field(3; Description; Text[250])
        {
        }
        field(4; "Appointment Effective Date"; Date)
        {
        }
        field(5; "Appointing Authority"; Code[50])
        {
        }
        field(6; "Tender Name"; Text[250])
        {
        }
        field(7; "Approval Status"; Option)
        {
            OptionCaption = 'Open,Pending Approval,Released';
            OptionMembers = Open,"Pending Approval",Released;

            trigger OnValidate()
            begin
                // IF "Approval Status"="Approval Status"::Released THEN BEGIN
                // NoOfMembers:=0;
                // ProcCommType.RESET;
                // ProcCommType.SETRANGE("Committee Type","Committee Type");
                // IF ProcCommType.FINDSET THEN BEGIN
                //  IfsCommitteMembers.RESET;
                //  IfsCommitteMembers.SETRANGE("Committee Type","Committee Type");
                //  IfsCommitteMembers.SETRANGE("Document No.","Document No.");
                //  IF IfsCommitteMembers.FINDSET THEN BEGIN
                //    REPEAT
                //    NoOfMembers+=1;
                //   UNTIL IfsCommitteMembers.NEXT=0;
                //  END;
                //  ProcCommType.CALCFIELDS(ProcCommType."Min. No. of Members");
                //  CALCFIELDS("Actual No. of Committee Memb");
                //  MESSAGE('%1'+' Appointed Successfully',Description);
                //  IF "Actual No. of Committee Memb" < ProcCommType."Min. No. of Members" THEN
                //    ERROR('The appointed members should be more than the allowed minimum no of members %1',ProcCommType."Min. No. of Members");
                //  ifs.RESET;
                //  ifs.SETRANGE(Code,"IFS Code");
                //  IF ifs.FINDSET THEN BEGIN
                //    IF "Committee Type"='TEC' THEN
                //      ifs."Bid Evaluation Committe":="Document No."
                //    ELSE IF "Committee Type"='TOC' THEN
                //      ifs."Bid Opening Committe":="Document No.";
                //    ifs.MODIFY;
                //    END;
                //
                //  END;
                //
                //
                //  IF "Committee Type"='TEC' THEN BEGIN
                //  Procurement.FnSendTenderCommitteNotification2(Rec);
                //    END;
                // IF "Committee Type"='TOC' THEN BEGIN
                //    Procurement.FnSendTenderCommitteNotification1(Rec);
                //
                //    END ELSE BEGIN
                //    Procurement.FnSendTenderCommitteNotification1(Rec);
                //
                //    END;
                //  END
            end;
        }
        field(8; "Primary Region"; Code[30])
        {
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const(Region));
        }
        field(9; "Primary Directorate"; Code[30])
        {
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const(Directorate));
        }
        field(10; "Primary Department"; Code[30])
        {
            TableRelation = "Responsibility Center".Code where("Operating Unit Type" = const("Department/Center"),
                                                                "Direct Reports To" = field("Primary Directorate"));
        }
        field(11; Blocked; Boolean)
        {
        }
        field(12; "No. Series"; Code[10])
        {
        }
        field(13; "Created By"; Code[100])
        {
            Editable = false;
        }
        field(14; "Created Date"; Date)
        {
            Editable = false;
        }
        field(15; "Created Time"; Time)
        {
            Editable = false;
        }
        field(16; "IFS Code"; Code[20])
        {
            TableRelation = "Standard Purchase Code".Code;

            trigger OnValidate()
            begin
                ifs.Reset;
                ifs.SetRange(Code, "IFS Code");
                if ifs.FindSet then begin
                    ProcCommType.Reset;
                    ProcCommType.SetRange("Committee Type", "Committee Type");
                    if ProcCommType.FindSet then begin
                        Description := "IFS Code" + '_' + ProcCommType.Description;

                    end;
                    "Raised By" := UserId;
                    "Document Date" := Today;
                    "External Document No" := ifs.Code;
                    "Appointment Effective Date" := Today;
                    "Tender Name" := ifs."Tender Name";
                    //  CompanyInfo.GET;
                    //  "Appointing Authority":=CompanyInfo."Position Name";
                end;

            end;
        }
        field(17; "Document Date"; Date)
        {
        }
        field(18; "Document Status"; Option)
        {
            OptionCaption = 'Active,Cancelled';
            OptionMembers = Active,Cancelled;
        }
        field(19; "Contract No."; Code[30])
        {
        }
        field(20; "External Document No"; Code[30])
        {
        }
        field(21; "Raised By"; Code[100])
        {
            Editable = false;
            trigger OnValidate()
            var
                myInt: Integer;
            begin
                // "Appointing Authority" := CompanyInfo."Position Name";
                UserSetup.Reset;
                UserSetup.SetRange("User ID", rec."Raised By");
                UserSetup.SetRange(UserSetup."Procurement officer", true);
                if UserSetup.Find('-') then begin
                    Name := UserSetup."Employee Name";
                    "Staff Id" := UserSetup."Employee No.";
                    Emp.Reset;
                    Emp.SetRange("No.", UserSetup."Employee No.");
                    if Emp.FindSet then begin
                        Designation := Emp."Job Title";
                        rec."Global Dimension 1 Code" := Emp."Global Dimension 1 Code";
                        rec."Global Dimension 2 Code" := Emp."Global Dimension 2 Code";
                        "Primary Department" := Emp."Department Code";
                        "Primary Directorate" := Emp."Directorate Code";
                        //"Primary Region" := Emp.Region;
                    end;
                end;
            end;
        }
        field(22; Name; Text[100])
        {
            Editable = false;
        }
        field(23; "Staff Id"; Code[50])
        {
            Editable = false;
        }
        field(24; Designation; Code[50])
        {
        }
        field(25; "Min Required No. of Members"; Decimal)
        {
            Description = 'Minimum Required No. of Members';
            Editable = false;
        }
        field(26; "Actual No. of Committee Memb"; Integer)
        {
            CalcFormula = count("IFS Tender Committee Member" where("Document No." = field("Document No.")));
            Caption = 'Actual No. of Committee Members';
            FieldClass = FlowField;
        }
        field(27; Duration; Decimal)
        {
        }
        field(28; Location; Text[30])
        {
            Editable = false;
        }
        field(29; "Imprest Created"; Boolean)
        {
        }
        field(30; "Memo No."; Code[30])
        {
        }
        field(31; "Road Code"; Code[30])
        {
        }
        field(32; "Road Section No."; Text[100])
        {
        }
        field(33; "Measurement Sheets"; Code[30])
        {
        }
        field(34; Inspection; Boolean)
        {
            Editable = false;
        }
        field(35; Type; Option)
        {
            OptionCaption = 'Individual,Clustered';
            OptionMembers = Individual,Clustered;
        }
        field(36; "Applicable Area"; Option)
        {
            OptionCaption = ', ICT,Stores,Disposal';
            OptionMembers = " ",ICT,Stores,Disposal;
        }
        field(37; "ICT Project No"; Code[10])
        {
            // TableRelation = "ICT Project"."No.";
        }
        field(38; "Opening Time"; Time)
        {
            Editable = false;
        }
        field(39; "IFP Code"; Code[30])
        {

            trigger OnValidate()
            begin
                // RequestForInformation.RESET;
                // RequestForInformation.SETRANGE(Code,"IFP Code");
                // IF RequestForInformation.FINDSET THEN
                //  "Tender Name":=RequestForInformation.Description;
                // ProcurementCommitteeTypes.RESET;
                // ProcurementCommitteeTypes.SETRANGE("Committee Type","Committee Type");
                // IF ProcurementCommitteeTypes.FINDSET THEN
                //  Description:=ProcurementCommitteeTypes.Description;
            end;
        }
        field(40; "Reference Number"; Text[100])
        {
        }
        field(41; "Emails Sent"; Boolean)
        {
        }
        field(42; "Financial Year Code"; Code[20])
        {
            TableRelation = "Financial Year Code";

            trigger OnValidate()
            begin
                YearCodes.Reset;
                YearCodes.SetRange("Code", "Financial Year Code");
                if YearCodes.FindSet then begin
                    "FY Start Date" := YearCodes."Starting Date";
                    "FY End Date" := YearCodes."Ending Date";
                end;
            end;
        }
        field(43; "FY Start Date"; Date)
        {
        }
        field(44; "FY End Date"; Date)
        {
        }
        field(45; "Stock report Due Date"; Date)
        {
            Caption = 'Stocktake Report Due Date';
        }
        field(46; "Stock Taking Type"; Option)
        {
            InitValue = Annual;
            OptionCaption = ' ,Annual,Quarterly';
            OptionMembers = " ",Annual,Quarterly;
        }
        field(47; "Period Ending Date"; Date)
        {
            Caption = 'Period Ending Date';

            trigger OnValidate()
            begin
                if "Stock Taking Type" <> "stock taking type"::Quarterly then begin
                    Error('ERROR!!, Kindly note that this only applies to Quartely committees');
                end;
            end;
        }
        field(48; "LPO No"; Code[50])
        {
            TableRelation = "Purchase Header"."No." where(Status = const(Released),
                                                           "Document Type" = const(Order));

            trigger OnValidate()
            begin
                PurchaseHeader.Reset;
                PurchaseHeader.SetRange("No.", "LPO No");
                if PurchaseHeader.FindSet then
                    "IFS Code" := PurchaseHeader."IFS Code";
                Validate("IFS Code");
            end;
        }
        field(51; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Global Dimension 1 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));

        }
        field(52; "Global Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            Caption = 'Global Dimension 2 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));


        }
    }

    keys
    {
        key(Key1; "Document No.", "Committee Type")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    begin
        Error('Error! Kindly note that you are  not allowed to delete this document');
    end;

    trigger OnInsert()
    begin
        if "Document No." = '' then begin
            ProcurementSetup.Get;
            ProcurementSetup.TestField("IFS Tender Committee No.");
            NoMgt.InitSeries(ProcurementSetup."IFS Tender Committee No.", xRec."No. Series", 0D, "Document No.", "No. Series");
        end;
        "Created By" := UserId;
        "Created Date" := Today;
        "Created Time" := Time;
        CompanyInfo.Get;
        //"Appointing Authority" := CompanyInfo."Position Name";
        UserSetup.Reset;
        UserSetup.SetRange("User ID", UserId);
        UserSetup.SetRange(UserSetup."Procurement officer", true);
        if UserSetup.FindSet then begin
            Name := UserSetup."Employee Name";
            "Staff Id" := UserSetup."Employee No.";
            Emp.Reset;
            Emp.SetRange("No.", UserSetup."Employee No.");
            if Emp.FindSet then begin
                Designation := Emp."Job Title";
                rec."Global Dimension 1 Code" := Emp."Global Dimension 1 Code";
                rec."Global Dimension 2 Code" := Emp."Global Dimension 2 Code";
                "Primary Department" := Emp."Department Code";
                "Primary Directorate" := Emp."Directorate Code";
                //"Primary Region" := Emp.Region;
            end;
        end else begin
            Error('Error! You must be assigned the necessary rights to create a committee');

        end;
        if ("Applicable Area" = "applicable area"::Stores) or ("Applicable Area" = "applicable area"::Disposal) then begin
            // Description:='Stock Taking Committee';
            "Appointment Effective Date" := Today;
        end;
    end;

    trigger OnModify()
    begin
        if ("Approval Status" = "approval status"::Released) and ("Emails Sent" = false) then begin
            //INDIVIDUAL
            if Inspection = true then begin
                if Inspection = true then begin
                    //Procurement.FnSendInspectTenderCommitteNotification1(Rec);
                end;
            end else begin
                if Type = Type::Individual then begin
                    NoOfMembers := 0;
                    ProcCommType.Reset;
                    ProcCommType.SetRange("Committee Type", "Committee Type");
                    if ProcCommType.FindSet then begin
                        IfsCommitteMembers.Reset;
                        IfsCommitteMembers.SetRange("Committee Type", "Committee Type");
                        IfsCommitteMembers.SetRange("Document No.", "Document No.");
                        if IfsCommitteMembers.FindSet then begin
                            repeat
                                NoOfMembers += 1;
                            until IfsCommitteMembers.Next = 0;
                        end;
                        ProcCommType.CalcFields(ProcCommType."Min. No. of Members");
                        CalcFields("Actual No. of Committee Memb");
                        Message('%1' + ' Appointed Successfully', Description);
                        if "Actual No. of Committee Memb" < ProcCommType."Min. No. of Members" then
                            Error('The appointed members should be more than the allowed minimum no of members %1', ProcCommType."Min. No. of Members");
                        ifs.Reset;
                        ifs.SetRange(Code, "IFS Code");
                        if ifs.FindSet then begin
                            if "Committee Type" = 'TEC' then
                                ifs."Bid Evaluation Committe" := "Document No."
                            else
                                if "Committee Type" = 'TOC' then
                                    ifs."Bid Opening Committe" := "Document No.";
                            ifs.Modify;
                        end;

                    end;


                    if "Committee Type" = 'TEC' then begin
                        // Procurement.FnSendTenderCommitteNotification2(Rec);
                    end;
                    if "Committee Type" = 'TOC' then begin
                        // Procurement.FnSendTenderCommitteNotification1(Rec);

                    end;
                    if "Committee Type" = 'STC' then begin
                        //  Procurement.FnSendTenderCommitteNotificationSTC(Rec);

                    end;
                    "Emails Sent" := true;
                end;

                //CLUSTERED
                if Type = Type::Clustered then begin
                    NoOfMembers := 0;
                    ProcCommType.Reset;
                    ProcCommType.SetRange("Committee Type", "Committee Type");
                    if ProcCommType.FindSet then begin
                        IfsCommitteMembers.Reset;
                        IfsCommitteMembers.SetRange("Committee Type", "Committee Type");
                        IfsCommitteMembers.SetRange("Document No.", "Document No.");
                        if IfsCommitteMembers.FindSet then begin
                            repeat
                                NoOfMembers += 1;
                            until IfsCommitteMembers.Next = 0;
                        end;
                        ProcCommType.CalcFields(ProcCommType."Min. No. of Members");
                        CalcFields("Actual No. of Committee Memb");
                        Message('%1' + ' Appointed Successfully', Description);
                        if "Actual No. of Committee Memb" < ProcCommType."Min. No. of Members" then
                            Error('The appointed members should be more than the allowed minimum no of members %1', ProcCommType."Min. No. of Members");
                        IFSTenderCommitteEntry.Reset;
                        IFSTenderCommitteEntry.SetRange("Document No.", "Document No.");
                        if IFSTenderCommitteEntry.FindSet then begin
                            repeat
                                ifs.Reset;
                                ifs.SetRange(Code, IFSTenderCommitteEntry."IFS Code");
                                if ifs.FindSet then begin
                                    if "Committee Type" = 'TEC' then
                                        ifs."Bid Evaluation Committe" := "Document No."
                                    else
                                        if "Committee Type" = 'TOC' then
                                            ifs."Bid Opening Committe" := "Document No.";
                                    ifs.Modify;
                                end;
                            until IFSTenderCommitteEntry.Next = 0;
                        end;

                    end;


                    if "Committee Type" = 'TEC' then begin
                        // Procurement.FnSendCLUSTTenderCommitteNotification2(Rec);
                    end;
                    if "Committee Type" = 'TOC' then begin
                        // Procurement.FnSendCLUSTTenderCommitteNotification1(Rec);

                    end;
                    // IF "Committee Type"='STC' THEN BEGIN
                    //    Procurement.FnSendTenderCommitteNotificationSTC(Rec);
                    //
                    //    END;
                    "Emails Sent" := true;
                end;
            end;
        end
    end;

    var
        ProcurementSetup: Record "Procurement Setup";
        NoMgt: Codeunit NoSeriesManagement;
        Emp: Record Employee;
        UserSetup: Record "User Setup";
        ProcCommType: Record "Procurement Committee Types";
        ifs: Record "Standard Purchase Code";
        CompanyInfo: Record "Company Information";
        Procurement: Codeunit "Procurement Processing";
        ShowWorkflowStatus: Boolean;
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        PRN: Record "Purchase Header";
        IfsCommitteMembers: Record "IFS Tender Committee Member";
        NoOfMembers: Integer;
        YearCodes: Record "Financial Year Code";
        IFSTenderCommitteEntry: Record "IFS Tender Committe Entry";
        PurchaseHeader: Record "Purchase Header";
}

