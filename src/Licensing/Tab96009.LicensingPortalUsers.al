table 96009 "Licensing Portal Users"
{
    Caption = 'Licensing Portal Users';
    DataCaptionFields = "First Name", "Last Name";
    DataPerCompany = false;
    ReplicateData = false;
    CompressionType = None;
    
    fields
    {
        field(1; "User ID"; Code[20])
        {
            Caption = 'User ID';
            Editable = false;
        }
        field(2; "First Name"; Text[30])
        {
            Caption = 'First Name';
        }
        field(3; "Last Name"; Text[30])
        {
            Caption = 'Last Name';
        }
        field(4; "E-Mail"; Text[80])
        {
            Caption = 'E-Mail';
            ExtendedDatatype = EMail;

            trigger OnValidate()
            var
                MailManagement: Codeunit "Mail Management";
            begin
                MailManagement.ValidateEmailAddressField("E-Mail");

                Users.Reset();
                Users.SetRange("E-Mail", "E-Mail");
                if Users.FindFirst() then
                    Error(EmailExistsErr, "E-Mail");
            end;
        }
        field(5; "ID Number"; Code[80])
        {
            Caption = 'ID Number';

            trigger OnValidate()
            begin
                Users.Reset();
                Users.SetRange("ID Number", "ID Number");
                if Users.FindFirst() then
                    Error(IDExistsErr, "ID Number");
            end;
        }
        field(6; Password; Text[2048])
        {
            Caption = 'Password';
            ExtendedDatatype = Masked;
        }
        field(7; "Phone No."; Text[30])
        {
            Caption = 'Phone No.';
            ExtendedDatatype = PhoneNo;

            trigger OnValidate()
            begin
                Users.Reset();
                Users.SetRange("Phone No.", "Phone No.");
                if Users.FindFirst() then
                    Error(PhoneExistsErr, "Phone No.");
            end;
        }
        field(8; "Document Date"; Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(9; "Last Date Modified"; Date)
        {
            Caption = 'Last Date Modified';
            Editable = false;
        }
        field(10; "Last DateTime Modified"; DateTime)
        {
            Caption = 'Last DateTime Modified';
            Editable = false;
        }
        field(11; "User Security ID"; Guid)
        {
            Editable = false;
        }
        field(12; "Email Verified"; Boolean)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(13; "Email Verified At"; DateTime)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(14; Blocked; Boolean)
        {
            Editable = false;
        }
        field(15; "Other Names"; Text[30])
        {
            Caption = 'Other Names';
        }
        field(16; "Full Name"; Text[100])
        {
            Caption = 'Full Name';
            Editable = false;
        }
        field(17; Nationality; Text[30])
        {
            Caption = 'Nationality';
        }
        field(18; Town; Text[30])
        {
            Caption = 'Town';
        }
        field(19; Street; Text[80])
        {
            Caption = 'Street';
        }
        field(20; Building; Text[80])
        {
            Caption = 'Building';
        }
        field(21; "Postal Address"; Code[20])
        {
            Caption = 'Postal Address';
        }
        field(22; "Postal Code"; Text[20])
        {
            Caption = 'Postal Code';
        }
        field(23; "Prof. Institutions Member"; Boolean)
        {
            Caption = 'Prof. Institutions Member';
        }
        field(24; "Has Work Experience"; Boolean)
        {
            Caption = 'Has Work Experience';
        }
        field(25; "Has Other Prof. Practices"; Boolean)
        {
            Caption = 'Has Other Prof. Practices';
        }
        field(26; "Has Bankruptcy/Conviction"; Boolean)
        {
            Caption = 'Has Bankruptcy/Conviction';
        }
        field(27; "Bankruptcy/Conviction Details"; Text[2048])
        {
            Caption = 'Bankruptcy/Conviction Details';
        }
        field(28; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }
        field(29; "Self Employed"; Boolean)
        {
            Caption = 'Self Employed';
        }
        field(30; "Current Residence"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(31; "Current Occupation"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(32; "Grounds of Application"; Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(33; "Competency Agreement"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(34; "Not Corrupt"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(35; "Not Offer Inducements"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(36; "Not Engaged in Corrosive Prac"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(37; "All Above is True"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(38; "Fully Read and Understood"; Boolean)
        {
            DataClassification = ToBeClassified;
        }   
        field(39; "Commit to Abide"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(40; "Not Working for Govt"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; "User ID")
        {
            Clustered = true;
        }
        key(UserInfo; "E-Mail", "ID Number", "User Security ID", "Phone No.")
        {
            Unique = true;
        }
    }

    trigger OnInsert()
    begin
        if "User ID" = '' then begin
            LicenceSetup.Get();
            LicenceSetup.TestField("User Nos.");

            if NoSeries.AreRelated(LicenceSetup."User Nos.", xRec."No. series") then
                "No. series" := xRec."No. series"
            else
                "No. series" := LicenceSetup."User Nos.";
            "User ID" := NoSeries.GetNextNo("No. series");
            Users.ReadIsolation(IsolationLevel::ReadUncommitted);
            Users.SetLoadFields("User ID");
            while Users.Get("User ID") do
                "User ID" := NoSeries.GetNextNo("No. series");

            TestField("First Name");
            TestField("Last Name");
            TestField("ID Number");
            Validate("ID Number");
            TestField("E-Mail");
            Validate("E-Mail");
            TestField("Phone No.");
            Validate("Phone No.");
            TestField(Password);

            "Document Date" := Today;

            PCategories.Reset();
            PCategories.SetRange(Blocked, false);
            if PCategories.FindSet() then begin
                repeat
                    RegPCategories.Init();
                    RegPCategories."Document No." := Rec."User ID";
                    RegPCategories."Practice Category Code" := PCategories.Code;
                    RegPCategories."Practice Category Name" := PCategories.Name;
                    RegPCategories.Insert(true);
                until PCategories.Next() = 0;
            end;
        end;
    end;

    trigger OnDelete()
    begin
        RegPCategories.Reset();
        RegPCategories.SetRange("Document No.", Rec."User ID");
        if RegPCategories.FindSet() then
            RegPCategories.DeleteAll(true);

        EducationInfo.Reset();
        EducationInfo.SetRange("Document No.", Rec."User ID");
        if EducationInfo.FindSet() then
            EducationInfo.DeleteAll(true);
        
        Membership.Reset();
        Membership.SetRange("Document No.", Rec."User ID");
        if Membership.FindSet() then
            Membership.DeleteAll(true);

        EmpHist.Reset();
        EmpHist.SetRange("Document No.", Rec."User ID");
        if EmpHist.FindSet() then
            EmpHist.DeleteAll(true);

        Agencies.Reset();
        Agencies.SetRange("Document No.", Rec."User ID");
        if Agencies.FindSet() then
            Agencies.DeleteAll(true);

        Prof.Reset();
        Prof.SetRange("Document No.", Rec."User ID");
        if Prof.FindSet() then
            Prof.DeleteAll(true);

        Referees.Reset();
        Referees.SetRange("Document No.", Rec."User ID");
        if Referees.FindSet() then
            Referees.DeleteAll(true);

        LicenceRegForm.Reset();
        LicenceRegForm.SetRange("User ID", Rec."User ID");
        if LicenceRegForm.FindSet() then
            LicenceRegForm.DeleteAll(true);
    end;

    trigger OnModify()
    begin
        SetLastDateTimeModified();
        FullName();
    end;

    trigger OnRename()
    begin
        SetLastDateTimeModified();
        FullName();
    end;

    var
        Users: Record "Licensing Portal Users";
        LicenceSetup: Record "Licensing Setup";
        NoSeries: Codeunit "No. Series";
        PCategories: Record "Licence Practice Categories";
        RegPCategories: Record "Licence Reg. Pract. Categories";
        EducationInfo: Record "Licence Reg. Education Info";
        Membership: Record "Professional Inst. Membership";
        EmpHist: Record "Licence Reg. Employment Hist";
        Agencies: Record "Licence Reg. Practice Agencies";
        Prof: Record "Licence Reg Proc Professionals";
        Referees: Record "Licence Restoration Referees";
        LicenceRegForm: Record "Licence Registration Form";
        IDExistsErr: Label 'The ID Number: %1 already exists.';
        EmailExistsErr: Label 'The Email: %1 already exists.';
        PhoneExistsErr: Label 'The Phone No: %1 already exists.';

    local procedure SetLastDateTimeModified()
    begin
        Rec."Last Date Modified" := Today;
        Rec."Last DateTime Modified" := CurrentDateTime;
    end;

    procedure HasProfInstMembership(): Boolean
    begin
        if Rec."Prof. Institutions Member" = true then exit(true);
    end;

    procedure HasWorkExperience(): Boolean
    begin
        if Rec."Has Work Experience" = true then exit(true);
    end;

    procedure HasOtherProfPractices(): Boolean
    begin
        if Rec."Has Other Prof. Practices" = true then exit(true);
    end;

    procedure HasBankruptcyOrConviction(): Boolean
    begin
        if Rec."Has Bankruptcy/Conviction" = true then exit(true);
    end;

    procedure FullName(): Text[100]
    var
        NewFullName: Text[100];
        Handled: Boolean;
    begin
        OnBeforeGetFullName(Rec, NewFullName, Handled);
        if Handled then
            exit(NewFullName);

        if "Other Names" = '' then
            exit("First Name" + ' ' + "Last Name");

        exit("First Name" + ' ' + "Other Names" + ' ' + "Last Name");
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeGetFullName(Users: Record "Licensing Portal Users"; var NewFullName: Text[100]; var Handled: Boolean)
    begin
    end;
}
