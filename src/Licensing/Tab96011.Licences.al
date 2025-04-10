table 96011 Licences
{
    Caption = 'Licences';
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1; "Licence ID"; Code[20])
        {
            Caption = 'Licence ID';
        }
        field(2; "User ID"; Code[20])
        {
            Caption = 'User ID';
            TableRelation = "Licensing Portal Users";
        }
        field(3; Status; Option)
        {
            Caption = 'Status';
            OptionMembers = ,Active,Expired,Deregistered;
            OptionCaption = ',Active,Expired,Deregistered';
        }
        field(4; "Last Date Modified"; Date)
        {
            Caption = 'Last Date Modified';
        }
        field(5; "Last DateTime Modified"; DateTime)
        {
            Caption = 'Last DateTime Modified';
        }
        field(6; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            TableRelation = "No. Series";
            Editable = false;
        }
        field(7; "Licence Start Date"; Date)
        {
            Caption = 'Licence Start Date';
        }
        field(8; "Licence Expiry Date"; Date)
        {
            Caption = 'Licence Expiry Date';
        }
        field(9; "Document Date"; Date)
        {
            Caption = 'Document Date';
        }
        field(10; "Issue Date"; Date)
        {
            Caption = 'Issue Date';
        }
        field(11; "Application ID"; Code[20])
        {
            Caption = 'Registration ID';
            TableRelation = "Licence Registration Form";
        }
        field(12; "Issued By"; Code[50])
        {
            Caption = 'Issued By';
            TableRelation = User."User Name";
            ValidateTableRelation = false;
        }
        field(13; "Category ID"; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Licence Practice Categories";
        }
        field(14; "Category Name"; Text[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Licence Practice Categories".Name;
            ValidateTableRelation = false;
        }
        field(15; Renew; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(16; "Registration No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(17; Deregister; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(18; Restore; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(19; "Grounds of Removal"; Text[500])
        {
            DataClassification = ToBeClassified;
        }
        field(20; "Deregister Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; "Licence ID")
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    begin
        if "Licence ID" = '' then begin
            LicenceSetup.Get();
            LicenceSetup.TestField("Licence Nos.");

            if NoSeries.AreRelated(LicenceSetup."Licence Nos.", xRec."No. series") then
                "No. series" := xRec."No. series"
            else
                "No. series" := LicenceSetup."Licence Nos.";
            "Licence ID" := NoSeries.GetNextNo("No. series");
            Licences.ReadIsolation(IsolationLevel::ReadUncommitted);
            Licences.SetLoadFields("Licence ID");
            while Licences.Get("Licence ID") do
                "Licence ID" := NoSeries.GetNextNo("No. series");
        end;

        if "Registration No." = '' then begin
            LicenceSetup.Get();
            LicenceSetup.TestField("Registration Nos.");

            if NoSeries.AreRelated(LicenceSetup."Registration Nos.", xRec."No. series") then
                "No. series" := xRec."No. series"
            else
                "No. series" := LicenceSetup."Registration Nos.";
            "Registration No." := NoSeries.GetNextNo("No. series");
            Licences.ReadIsolation(IsolationLevel::ReadUncommitted);
            Licences.SetLoadFields("Registration No.");
            while Licences.Get("Registration No.") do
                "Registration No." := NoSeries.GetNextNo("No. series");
        end;

        "Document Date" := Today;
    end;

    trigger OnModify()
    begin
        SetLastDateTimeModified();
    end;

    trigger OnRename()
    begin
        SetLastDateTimeModified();
    end;

    var
        PCategories: Record "Licence Practice Categories";
        RegPCategories: Record "Licence Reg. Pract. Categories";
        LicenceSetup: Record "Licensing Setup";
        LicenceRegForm: Record "Licence Registration Form";
        Licences: Record Licences;
        NoSeries: Codeunit "No. Series";
        LicensingPortal: Codeunit "Licensing Portal";

    local procedure SetLastDateTimeModified()
    begin
        Rec."Last Date Modified" := Today;
        Rec."Last DateTime Modified" := CurrentDateTime;
    end;

    procedure fnDeregisterLicence(var Licence: Record Licences)
    begin
        Licences.Reset();
        Licences.SetRange("Licence ID", Licence."Licence ID");
        if Licences.FindFirst() then begin
            Licences.Deregister := true;
            Licences.Status := Licences.Status::Deregistered;
            Licences."Deregister Date" := Today;
            if Licences.Modify(true) then begin
                RegPCategories.Reset();
                RegPCategories.SetRange("Document No.", Licence."User ID");
                RegPCategories.SetRange("Practice Category Code", Licence."Category ID");
                if RegPCategories.FindFirst() then begin
                    RegPCategories.Deregistered := true;
                    if RegPCategories.Modify() then
                        LicensingPortal.fnNotifyLicenceDeregistration(Licences);
                end;
            end;
        end;
    end;
}
