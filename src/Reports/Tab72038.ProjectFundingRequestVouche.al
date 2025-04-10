#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 72038 "Project Funding Request Vouche"
{
    DrillDownPageID = "Project Funding Voucher";
    LookupPageID = "Project Funding Voucher";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Document No"; Code[30])
        {
        }
        field(2; Description; Text[250])
        {
        }
        field(3; "Year Code"; Code[30])
        {
            TableRelation = "Funding Year Codes"."Year Code";

            trigger OnValidate()
            var
                FYCodes: Record "Funding Year Codes";
            begin
                if FYCodes.Get("Year Code") then begin
                    "Start Date" := FYCodes."Start Date";
                    "End Date" := FYCodes."End Date";
                end;
            end;
        }
        field(4; "Start Date"; Date)
        {
        }
        field(5; "End Date"; Date)
        {
        }
        field(6; Status; Option)
        {
            InitValue = Open;
            OptionCaption = ' ,Open,Pending Approval,Approved';
            OptionMembers = " ",Open,"Pending Approval",Approved;
        }
        field(7; Region; Code[30])
        {
            TableRelation = "Responsibility Center".Code where("Operating Unit Type" = filter(Region));
        }
        field(8; Directorate; Code[30])
        {
            TableRelation = "Responsibility Center".Code where("Operating Unit Type" = filter(Directorate));
        }
        field(9; Department; Code[30])
        {
            TableRelation = "Responsibility Center".Code where("Operating Unit Type" = filter("Department/Center"));
        }
        field(10; "Responsibility Center"; Code[30])
        {
            TableRelation = "Responsibility Center";
        }
        field(11; "Default Works Category"; Code[20])
        {
            TableRelation = "Procurement Category".Code where("Procurement Type" = filter('WORKS'));
        }
        field(12; "Created By"; Code[50])
        {
        }
        field(13; "Creation Date"; Date)
        {
        }
        field(14; "Creation Time"; Time)
        {
        }
        field(15; "Default Funding Source"; Code[20])
        {
            TableRelation = "Funding Source";
        }
        field(16; "Funding Total Value(LCY)"; Decimal)
        {
            CalcFormula = sum("Project Funding Voucher Line"."Total Estimated Cost(LCY)" where("Document No" = field("Document No")));
            FieldClass = FlowField;
        }
        field(17; "No. Series"; Code[20])
        {
        }
        field(18; Type; Option)
        {
            InitValue = Original;
            OptionCaption = ' ,Original,Revision';
            OptionMembers = " ",Original,Revision;
        }
        field(19; "Currency Code"; Code[30])
        {
            TableRelation = Currency;
        }
        field(20; "Document Type"; Option)
        {
            OptionCaption = ' ,PFV,PFW';
            OptionMembers = " ",PFV,PFW;
        }
        field(21; "PFV No"; Code[30])
        {
            TableRelation = "Project Funding Request Vouche"."Document No" where("Document Type" = filter(PFV));

            trigger OnValidate()
            begin
                LineNo := 0;

                PFVLine.Reset;
                PFVLine.SetRange(PFVLine."Document No", "PFV No");
                if PFVLine.Find('-') then
                    repeat
                        LineNo := LineNo + 100;
                        PFVLine.TransferFields(PFVLine);
                        PFVLine."Document No" := "Document No";
                        PFVLine."Line No" := LineNo;
                        PFVLine.Insert(true);
                    until PFVLine.Next = 0;
            end;
        }
        field(22; "Project No"; Code[30])
        {
        }
        field(23; "Contigencies(%)"; Decimal)
        {
        }
        field(24; Remarks; Text[30])
        {
        }
        field(25; "Rejection Comment"; Text[250])
        {
        }
    }

    keys
    {
        key(Key1; "Document No")
        {
            Clustered = true;
        }
        key(Key2; "Project No")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if "Document Type" = "document type"::PFV then begin
            if "Document No" = '' then begin
                // RMSetup.Get;
                // RMSetup.TestField("Project Funding Voucher Nos");
                // SeriesMgt.InitSeries(RMSetup."Project Funding Voucher Nos", xRec."No. Series", 0D, "Document No", "No. Series");
            end;
        end;

        if "Document Type" = "document type"::PFW then begin
            if "Document No" = '' then begin
                // RMSetup.Get;
                // RMSetup.TestField("Project Funding WorkSheet  Nos");
                // SeriesMgt.InitSeries(RMSetup."Project Funding WorkSheet  Nos", xRec."No. Series", 0D, "Document No", "No. Series");
            end;
        end;

        "Created By" := UpperCase(UserId);
        "Creation Date" := Today;
        "Creation Time" := Time;
    end;

    var
        // RMSetup: Record "Roads Management Setup";
        SeriesMgt: Codeunit NoSeriesManagement;
        PFVoucher: Record "Project Funding Request Vouche";
        PFVLine: Record "Project Funding Voucher Line";
        LineNo: Integer;
        ObjPFVLine: Record "Project Funding Voucher Line";
}

