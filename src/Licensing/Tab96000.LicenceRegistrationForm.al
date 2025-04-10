table 96000 "Licence Registration Form"
{
    Caption = 'Licence Registration Form';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
            Editable = false;
        }
        field(2; "User ID"; Code[20])
        {
            Caption = 'User ID';
            TableRelation = "Licensing Portal Users";
        }
        field(3; "Application Type"; Option)
        {
            OptionMembers = ,Registration,Renewal,Restoration,Category;
            OptionCaption = ',Registration,Renewal,Restoration,Category';
            Editable = false;
        }
        field(4; Submitted; Boolean)
        {
            Caption = 'Submitted';
            // Editable = false;
        }
        field(5; Status; Option)
        {
            OptionMembers = Open,"Pending Approval",Approved,Rejected;
            OptionCaption = 'Open,Pending Approval,Approved,Rejected';
            Editable = false;
        }
        field(6; "Last Date Modified"; Date)
        {
            Caption = 'Last Date Modified';
            Editable = false;
        }
        field(7; "Last DateTime Modified"; DateTime)
        {
            Caption = 'Last DateTime Modified';
            Editable = false;
        }
        field(8; Comments; Boolean)
        {
            Caption = 'Comments';
            Editable = false;
        }
        field(9; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }
        field(10; "Deregistration No."; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(11; "Registration Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(12; "Document Date"; Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(13; "Grounds of Application"; Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(14; Closed; Boolean)
        {
            // Editable = false;
        }
        field(15; "Closed By"; Code[50])
        {
            TableRelation = User."User Name";
            ValidateTableRelation = false;
            // Editable = false;
        }
        field(16; "Submission Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(17; Amount; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(18; "Amount Received"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(19; "Transaction Code"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(20; "Transaction Date"; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(21; "Processing Fee"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(22; "Payment Status"; Option)
        {
            OptionMembers = ,Pending,Paid;
        }
        field(23; "Invoice No."; Code[20])
        {
            TableRelation = "Sales Header"."No.";
            Editable = false;
        }
        field(24; "Amount (LCY)"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(25; "Currency Code"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(26; "Current Residence"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(27; "Current Occupation"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; "No.", "User ID", "Application Type")
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    begin
        if "No." = '' then begin
            LicenceSetup.Get();
            LicenceSetup.TestField("Licence Reg. Categories Nos.");
            LicenceSetup.TestField("Licence Registration Nos.");
            LicenceSetup.TestField("Licence Renewal Nos.");
            LicenceSetup.TestField("Licence Restoration Nos.");
            // LicenceSetup.TestField("Licence Invoice Nos.");

            if "Application Type" = "Application Type"::Registration then begin

                // LicenceRegForm.Reset();
                // LicenceRegForm.SetRange("User ID", "User ID");
                // LicenceRegForm.SetRange(Submitted, true);
                // LicenceRegForm.SetRange(Closed, false);
                // if LicenceRegForm.FindSet() then
                //     Error(RegExistsErr);

                if NoSeries.AreRelated(LicenceSetup."Licence Registration Nos.", xRec."No. series") then
                    "No. series" := xRec."No. series"
                else
                    "No. series" := LicenceSetup."Licence Registration Nos.";
                "No." := NoSeries.GetNextNo("No. series");
                LicenceRegForm.ReadIsolation(IsolationLevel::ReadUncommitted);
                LicenceRegForm.SetLoadFields("No.");
                while LicenceRegForm.Get("No.") do
                    "No." := NoSeries.GetNextNo("No. series");
            end;

            if "Application Type" = "Application Type"::Renewal then begin
                if NoSeries.AreRelated(LicenceSetup."Licence Renewal Nos.", xRec."No. series") then
                    "No. series" := xRec."No. series"
                else
                    "No. series" := LicenceSetup."Licence Renewal Nos.";
                "No." := NoSeries.GetNextNo("No. series");
                LicenceRegForm.ReadIsolation(IsolationLevel::ReadUncommitted);
                LicenceRegForm.SetLoadFields("No.");
                while LicenceRegForm.Get("No.") do
                    "No." := NoSeries.GetNextNo("No. series");
            end;

            if "Application Type" = "Application Type"::Restoration then begin
                if NoSeries.AreRelated(LicenceSetup."Licence Restoration Nos.", xRec."No. series") then
                    "No. series" := xRec."No. series"
                else
                    "No. series" := LicenceSetup."Licence Restoration Nos.";
                "No." := NoSeries.GetNextNo("No. series");
                LicenceRegForm.ReadIsolation(IsolationLevel::ReadUncommitted);
                LicenceRegForm.SetLoadFields("No.");
                while LicenceRegForm.Get("No.") do
                    "No." := NoSeries.GetNextNo("No. series");
            end;

            if "Application Type" = "Application Type"::Category then begin
                if NoSeries.AreRelated(LicenceSetup."Licence Reg. Categories Nos.", xRec."No. series") then
                    "No. series" := xRec."No. series"
                else
                    "No. series" := LicenceSetup."Licence Reg. Categories Nos.";
                "No." := NoSeries.GetNextNo("No. series");
                LicenceRegForm.ReadIsolation(IsolationLevel::ReadUncommitted);
                LicenceRegForm.SetLoadFields("No.");
                while LicenceRegForm.Get("No.") do
                    "No." := NoSeries.GetNextNo("No. series");
            end;

        end;

        // if NoSeries.AreRelated(LicenceSetup."Licence Invoice Nos.", xRec."No. series") then
        //     "No. series" := xRec."No. series"
        // else
        //     "No. series" := LicenceSetup."Licence Invoice Nos.";
        // "Invoice No." := NoSeries.GetNextNo("No. series");
        // LicenceRegForm.ReadIsolation(IsolationLevel::ReadUncommitted);
        // LicenceRegForm.SetLoadFields("Invoice No.");
        // while LicenceRegForm.Get("No.", "User ID", "Application Type", "Invoice No.") do
        //     "Invoice No." := NoSeries.GetNextNo("No. series");

        "Document Date" := Today;
        "Submission Date" := Today;
        "Registration Date" := Today;
    end;

    trigger OnModify()
    var
        Count: Integer;
    begin
        // if Rec.Status = Rec.Status::Approved then begin
        //     if Rec."Application Type" = Rec."Application Type"::Registration then begin
        //         Clear(Count);

        //         Count := LicensingPortal.fnCheckApprovedLicenceLines(Rec);

        //         if Count = 0 then
        //             LicensingPortal.fnApproveLicenceLines(Rec);

        //         LicensingPortal.fnNotifyApprovedApplication(Rec);
        //     end;
        // end;

        // if Rec.Status = Rec.Status::Rejected then begin
        //     LicensingPortal.fnNotifyRejectedApplication(Rec);
        // end;

        SetLastDateTimeModified();
    end;

    trigger OnRename()
    begin
        SetLastDateTimeModified();
    end;

    trigger OnDelete()
    begin
        RenewalLines.Reset();
        RenewalLines.SetRange("Document No.", "No.");
        if RenewalLines.FindSet() then
            RenewalLines.DeleteAll(true);

        CategoryLines.Reset();
        CategoryLines.SetRange("Document No.", "No.");
        if CategoryLines.FindSet() then
            CategoryLines.DeleteAll(true);
    end;

    var
        NoSeries: Codeunit "No. Series";
        LicenceSetup: Record "Licensing Setup";
        LicenceRegForm: Record "Licence Registration Form";
        Licences: Record Licences;
        RenewalLines: Record "Licence Renewal Lines";
        CategoryLines: Record "Licence Category Lines";
        RegExistsErr: Label 'Another application is underway. Please wait until it is closed.';
        LicensingPortal: Codeunit "Licensing Portal";

    local procedure SetLastDateTimeModified()
    begin
        Rec."Last Date Modified" := Today;
        Rec."Last DateTime Modified" := CurrentDateTime;
    end;

}
