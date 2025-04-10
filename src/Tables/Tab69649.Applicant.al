
table 69649 "Applicant"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Candidate No."; Code[20])
        {
            Caption = 'No.';
        }
        field(2; "First Name"; Text[30])
        {
            Caption = 'First Name';
        }
        field(3; "Middle Name"; Text[30])
        {
            Caption = 'Middle Name';
        }
        field(4; "Last Name"; Text[30])
        {
            Caption = 'Last Name';
        }
        field(5; "Full Names"; Text[200])
        {
            Caption = 'Initials';

            trigger OnValidate()
            begin
                NameBreakdown;
            end;
        }
        field(97; "Preferred Title"; Option)
        {
            OptionCaption = ',Prof,Dr,Mr.,Mrs.,Ms,Rev';
            OptionMembers = ,Prof,Dr,Mr,Mrs,Ms,Rev;
        }
        field(8; Address; Text[100])
        {
            Caption = 'Address';
        }
        field(9; "Address 2"; Text[50])
        {
            Caption = 'Address 2';
        }
        field(10; City; Text[30])
        {
            Caption = 'City';
            TableRelation = if ("Country/Region Code" = const('')) "Post Code".City
            else
            if ("Country/Region Code" = filter(<> '')) "Post Code".City where("Country/Region Code" = field("Country/Region Code"));
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;

            trigger OnLookup()
            begin
                PostCode.LookupPostCode(City, "Post Code", "County of Birth", Nationality);
            end;

            trigger OnValidate()
            begin
                PostCode.ValidateCity(City, "Post Code", "County of Birth", Nationality, (CurrFieldNo <> 0) and GuiAllowed);
            end;
        }
        field(11; "Post Code"; Code[20])
        {
            Caption = 'Post Code';
            TableRelation = if ("Country/Region Code" = const('')) "Post Code"
            else
            if ("Country/Region Code" = filter(<> '')) "Post Code" where("Country/Region Code" = field("Country/Region Code"));
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;

            trigger OnLookup()
            begin
                PostCode.LookupPostCode(City, "Post Code", "County of Birth", Nationality);
            end;

            trigger OnValidate()
            begin
                PostCode.ValidatePostCode(City, "Post Code", "County of Birth", Nationality, (CurrFieldNo <> 0) and GuiAllowed);
            end;
        }
        field(12; "County of Birth"; Text[30])
        {
            Caption = 'County';
        }
        field(13; "Phone No."; Text[15])
        {
            Caption = 'Phone No.';
            ExtendedDatatype = PhoneNo;
        }
        field(14; "Mobile Phone No."; Text[15])
        {
            Caption = 'Mobile Phone No.';
            ExtendedDatatype = PhoneNo;
        }
        field(15; "E-Mail"; Text[70])
        {
            Caption = 'Email';
            ExtendedDatatype = EMail;

            trigger OnValidate()
            var
                MailManagement: Codeunit "Mail Management";
            begin
                MailManagement.ValidateEmailAddressField("E-Mail");
            end;
        }
        field(16; Picture; Media)
        {
            Caption = 'Picture';
            ObsoleteReason = 'Replaced by Image field';
            ObsoleteState = Pending;
        }
        field(17; "Birth Date"; Date)
        {
            Caption = 'Birth Date';
        }
        field(18; Gender; Option)
        {
            Caption = 'Gender';
            OptionCaption = ' ,Male,Female,Both';
            OptionMembers = " ",Male,Female,Both;
        }
        field(19; "Country/Region Code"; Code[10])
        {
            Caption = 'Country/Region Code';
            TableRelation = "Country/Region";

            trigger OnValidate()
            begin
                PostCode.CheckClearPostCodeCityCounty(City, "Post Code", "County of Birth", Nationality, xRec.Nationality);
            end;
        }
        field(20; "ID Number"; Integer)
        {
        }
        field(21; "Passport No."; Code[30])
        {
            ExtendedDatatype = EMail;

            trigger OnValidate()
            var
                MailManagement: Codeunit "Mail Management";
            begin
            end;
        }
        field(22; "Marital Status"; Option)
        {
            OptionCaption = ' ,Single,Married,Divorced,Others,Widow(er),Separated';
            OptionMembers = " ",Single,Married,Divorced,Others,Widowed,Separated;
        }
        field(23; Religion; Code[20])
        {

        }
        field(24; "Ethnic Group"; Code[30])
        {
            // TableRelation = "Ethnic Background";
            TableRelation = "Ethnic Groups1".Code;
        }
        field(25; Nationality; Code[30])
        {
        }
        field(26; "Specialization Area"; Code[30])
        {
            TableRelation = "Domain Area";
        }
        field(27; "Highest Academic Qualification"; Code[30])
        {
            TableRelation = Qualification;

            trigger OnValidate()
            begin
                if Qualification.Get("Highest Academic Qualification") then begin
                    "Qualification Name" := Qualification.Description;
                end
            end;
        }
        field(28; "Qualification Name"; Text[250])
        {
        }
        field(29; "Work Experience (Years)"; Integer)
        {
        }
        field(30; "Management Experience (Years)"; Integer)
        {
        }
        field(31; "Disability Code"; Code[30])
        {
            TableRelation = "Disability Code";
            Caption = 'PWD Code';
        }
        field(32; Disabled; Boolean)
        {
            Caption = 'PWD';
        }
        field(33; "Disability Description"; Text[30])
        {
        }
        field(34; "Disability Certificate No"; Code[30])
        {
            Caption = 'NCPWD No.';
        }
        field(35; Status; Option)
        {
            OptionCaption = 'Active,Inactive';
            OptionMembers = Active,Inactive;
        }
        field(36; "Inactive Date"; Date)
        {
        }
        field(37; "Cause of Inactivity Code"; Code[30])
        {
        }
        field(38; "Termination Date"; Date)
        {
        }
        field(39; "Grounds for Term. Code"; Code[30])
        {
        }
        field(40; "Last Date Modified"; Date)
        {
        }
        field(41; "Last Modified Date Time"; DateTime)
        {
        }
        field(42; "No. of Job Applications"; Integer)
        {
        }
        field(43; "Skills & Competences"; Text[440])
        {
        }
        field(44; "No. Series"; Code[30])
        {
        }
        field(45; Tittles; Option)
        {
            OptionCaption = ' ,Prof,Doctor,Mr,Mrs,Miss,Ms';
            OptionMembers = " ",Prof,Doctor,Mr,Mrs,Miss,Ms;
        }
        field(46; "NHIF No"; Code[50])
        {
        }
        field(47; "NSSF No"; Code[50])
        {
        }
        field(48; "KRA Pin"; Code[50])
        {
        }
        field(49; "Employee No"; Code[30])
        {
            TableRelation = Employee;

            trigger OnValidate()
            begin
                Payroll.Reset;
                Payroll.SetRange("No.", "Employee No");
                if Payroll.FindFirst then begin
                    if Payroll.Status = Payroll.Status::Active then
                        Active := true;
                end
            end;
        }
        field(50; Active; Boolean)
        {
        }
        field(51; "Inactive Reason Code"; Code[30])
        {
        }
        field(52; "Profile Completed"; Boolean)
        {
        }
        field(53; "County of Residence"; Code[100])
        {
        }
        field(54; "Disability Certificate Expiry"; Date)
        {
        }
        field(55; "Alternative Email"; text[100])
        {
        }
        field(56; ApplicantNo; code[50])
        {
        }
        field(57; "Constituency ID"; Code[20])
        {
            TableRelation = "Responsibility Center".Code where("Operating Unit Type" = filter(Constituency));
            trigger OnValidate()
            var
                RespC: Record "Responsibility Center";
            begin
                RespC.Reset();
                RespC.SetRange(Code, "Constituency ID");
                RespC.SetRange("Operating Unit Type", RespC."Operating Unit Type"::Constituency);
                if RespC.find('-') then
                    "Constituency Name" := RespC.Name;
            end;
        }
        field(58; "Constituency Name"; text[100])
        {
        }
        field(59; "Ward ID"; Code[20])
        {
            TableRelation = "Responsibility Center".Code where("Operating Unit Type" = filter(Ward));
            trigger OnValidate()
            var
                RespC: Record "Responsibility Center";
            begin
                RespC.Reset();
                RespC.SetRange(Code, "Ward ID");
                RespC.SetRange("Operating Unit Type", RespC."Operating Unit Type"::Ward);
                if RespC.find('-') then
                    "Ward Name" := RespC.Name;
            end;
        }
        field(61; Age; Text[30])
        {

        }
        field(62; "Age In Years"; Integer)
        {

        }
        field(63; "County of Origin"; Code[10])
        {
            DataClassification = CustomerContent;
            TableRelation = County.Code;

            trigger OnValidate()
            var
                Countys: Record County;
            begin
                if Countys.Get("County of Origin") then begin

                    "County of Origin Name" := Countys.Description;
                end;
            end;
        }
        field(64; "County of Origin Name"; Text[250])
        {
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(65; "Sub County"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Sub County".Code where(County = field("County of Origin"));
        }
        field(66; Constituency; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(67; "Alternative Contact Person"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(68; "Alternative Contact Phone"; Text[100])
        {
            ExtendedDatatype = PhoneNo;
        }
        field(69; "Social Security No."; Text[50])
        {
            Caption = 'NSSF No.';
        }
        field(70; "SHA No."; Text[50])
        {
            Caption = 'SHIF No.';
        }
        field(71; "KRA PIN NO."; Code[50])
        {
        }
        field(72; "Current Employment Status"; Option)
        {
            OptionCaption = 'Public Service,Private Sector,Unemployed';
            OptionMembers = "Public Service","Private Sector",Unemployed;
        }
        field(73; "Employer Name"; Text[150])
        {
        }
        field(74; Station; Text[150])
        {
        }
        field(75; "Personal No."; Code[50])
        {
        }
        field(76; "Present Substantive Post"; Text[150])
        {
        }
        field(77; "Job Grade"; Text[150])
        {
        }
        field(78; "Secondment Organization"; Text[150])
        {
        }
        field(79; "Secondment Designation"; Text[150])
        {
        }
        field(80; "Secondment Job Group"; Text[50])
        {
        }
        field(81; "Gross Salary"; Integer)
        {
        }
        field(82; "Is Tax Compliant"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(83; "Has Helb Loan"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(84; "Convicted/On Probation"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(85; "Has On-going Investigation"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(86; "Investigation Details"; Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(87; "Dismissed from Employment"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(88; "Is Impaired"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(89; "Impairment Details"; Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(90; "Appointment Availability Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(91; "Has Voilated Laws"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(92; "Charge Details"; Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(93; "Investigation Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(94; "Proficient Languages"; Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(95; "Relatives In PPRA"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(96; "Name & Relationship"; Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(98; "Terms Of Service"; Option)
        {
            OptionCaption = ',Permanent and Pensionable,Contract';
            OptionMembers = " ","Permanent and Pensionable","Contract";
        }
        field(99; "Date of Current Appointment"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(100; "Upgraded Post"; Text[200])
        {
            DataClassification = ToBeClassified;
        }
        field(101; "Date of Previous Appointment"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(102; Ward; Code[20])
        {
            TableRelation = Ward.Code where(County = field("County of Origin"), "Sub County" = field("Sub County"));
            DataClassification = ToBeClassified;
        }
        field(103; Village; Code[20])
        {
            TableRelation = Village.Code where(County = field("County of Origin"), "Sub County" = field("Sub County"), Ward = field(Ward));
            DataClassification = ToBeClassified;
        }
        field(104; "Sub County Name"; Text[250])
        {
            FieldClass = FlowField;
            CalcFormula = lookup("Sub County".Name where(Code = field("Sub County")));
            Editable = false;
        }
        field(105; "Ward Name"; Text[250])
        {
            FieldClass = FlowField;
            CalcFormula = lookup(Ward.Name where(Code = field(Ward)));
            Editable = false;
        }
        field(106; "Village Name"; Text[250])
        {
            FieldClass = FlowField;
            CalcFormula = lookup(Village.Name where(Code = field(Village)));
            Editable = false;
        }
    }

    keys
    {
        key(Key1; "Candidate No.")
        {
            Clustered = true;
        }
        key(Key2; "Disability Code", "Marital Status")
        {
        }
        key(Key3; "Last Name", "First Name", "Middle Name")
        {
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Candidate No.", "First Name", "Last Name", "Full Names")
        {
        }
        fieldgroup(Brick; "Last Name", "First Name")
        {
        }
    }

    trigger OnDelete()
    begin
        AlternativeAddr.SetRange("Employee No.", "Candidate No.");
        AlternativeAddr.DeleteAll;

        EmployeeQualification.SetRange("Employee No.", "Candidate No.");
        EmployeeQualification.DeleteAll;

        Relative.SetRange("Employee No.", "Candidate No.");
        Relative.DeleteAll;

        EmployeeAbsence.SetRange("Employee No.", "Candidate No.");
        EmployeeAbsence.DeleteAll;

        MiscArticleInformation.SetRange("Employee No.", "Candidate No.");
        MiscArticleInformation.DeleteAll;

        ConfidentialInformation.SetRange("Employee No.", "Candidate No.");
        ConfidentialInformation.DeleteAll;

        HumanResComment.SetRange("No.", "Candidate No.");
        HumanResComment.DeleteAll;

        DimMgt.DeleteDefaultDim(Database::Employee, "Candidate No.");
    end;

    trigger OnInsert()
    begin
        // HumanResourcesSetup.Get;
        // HumanResourcesSetup.TestField("Candidate No.");
        // if "Candidate No." = '' then
        //     NoSeriesMgt.InitSeries(HumanResourcesSetup."Candidate No.", xRec."No. Series", 0D, "Candidate No.", "No. Series");
    end;

    trigger OnRename()
    begin
        DimMgt.RenameDefaultDim(Database::Employee, xRec."Candidate No.", "Candidate No.");
        "Last Modified Date Time" := CurrentDatetime;

        UpdateSearchName;
    end;

    var
        HumanResourcesSetup: Record "Human Resources Setup";
        Res: Record Resource;
        PostCode: Record "Post Code";
        AlternativeAddr: Record "Alternative Address";
        EmployeeQualification: Record "Employee Qualification";
        Relative: Record "Employee Relative";
        EmployeeAbsence: Record "Employee Absence";
        MiscArticleInformation: Record "Misc. Article Information";
        ConfidentialInformation: Record "Confidential Information";
        HumanResComment: Record "Human Resource Comment Line";
        SalespersonPurchaser: Record "Salesperson/Purchaser";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        EmployeeResUpdate: Codeunit "Employee/Resource Update";
        EmployeeSalespersonUpdate: Codeunit "Employee/Salesperson Update";
        DimMgt: Codeunit DimensionManagement;
        Text000: label 'Before you can use Online Map, you must fill in the Online Map Setup window.\See Setting Up Online Map in Help.';
        CauseOfAbsence: Record "Cause of Absence";
        Dates: Codeunit "HR Dates";
        SalPointer: Record "Salary Pointers";
        Scale: Record "Salary Scales";
        DateInt: Integer;
        // Earnings: Record EarningsX;
        AssMatrix: Record "Assignment Matrix-X";
        // Ded: Record DeductionsX;
        PayPeriod: Record "Payroll PeriodX";
        ScaleBenefits: Record "Scale Benefits";
        PeriodStartDate: Date;
        Begindate: Date;
        Payroll: Record Employee;
        OK: Boolean;
        "....added by daudi....": Integer;
        UserMgt: Codeunit "User Management";
        BlockedEmplForJnrlErr: label 'You cannot create this document because employee %1 is blocked due to privacy.', Comment = '%1 = employee no.';
        BlockedEmplForJnrlPostingErr: label 'You cannot post this document because employee %1 is blocked due to privacy.', Comment = '%1 = employee no.';
        EmployeeLinkedToResourceErr: label 'You cannot link multiple employees to the same resource. Employee %1 is already linked to that resource.', Comment = '%1 = employee no.';
        GTermination: Record "Grounds for Termination";
        EthnicBackground: Record "Ethnic Background";
        // EmployeeBank: Record "Employee Bank AccountX";
        EmpNo: Record Employee;
        Qualification: Record Qualification;

    procedure AssistEdit(): Boolean
    begin
    end;

    procedure FullName(): Text[100]
    var
        NewFullName: Text[100];
        Handled: Boolean;
    begin
        /*OnBeforeGetFullName(Rec,NewFullName,Handled);
        IF Handled THEN
          EXIT(NewFullName);
        
        IF "Middle Name" = '' THEN
          EXIT("First Name" + ' ' + "Last Name");
        
        EXIT("First Name" + ' ' + "Middle Name" + ' ' + "Last Name");*/

    end;

    procedure ValidateShortcutDimCode(FieldNumber: Integer; var ShortcutDimCode: Code[20])
    begin
        DimMgt.ValidateDimValueCode(FieldNumber, ShortcutDimCode);
        DimMgt.SaveDefaultDim(Database::Employee, "Candidate No.", FieldNumber, ShortcutDimCode);
        Modify;
    end;

    procedure DisplayMap()
    var
        MapPoint: Record "Online Map Setup";
        MapMgt: Codeunit "Online Map Management";
    begin
        if MapPoint.FindFirst then
            MapMgt.MakeSelection(Database::Employee, GetPosition)
        else
            Message(Text000);
    end;


    procedure GetPayPeriod()
    begin
        PayPeriod.Reset;
        PayPeriod.SetRange(PayPeriod."Close Pay", false);
        if PayPeriod.Find('-') then begin
            //PayPeriodtext:=PayPeriod.Name;
            Begindate := PayPeriod."Starting Date";
            //MESSAGE('%1',Begindate);
        end;
    end;


    procedure CreateResource(): Boolean
    var
        ResourceRec: Record Resource;
        ResourceGroup: Record "Resource Group";
    begin
        /*IF NOT ResourceRec.GET("No.") THEN
        BEGIN
         ResourceRec."No.":="No.";
         ResourceRec.Name:="First Name"+' '+"Middle Name"+' '+"Last Name";
         ResourceRec."Job Title":="Job Title";
         ResourceRec.Type:=ResourceRec.Type::Person;
         {IF NOT ResourceGroup.GET("Salary Scale") THEN
           ERROR(Text000,"Salary Scale");}
         ResourceRec."Resource Group No.":="Salary Scale";
         ResourceRec.INSERT;
         EXIT(TRUE)
        END ELSE
        EXIT(FALSE);*/

    end;


    procedure CreateCustomer(): Boolean
    var
        CustRec: Record Customer;
        CashMgtSetup: Record "Cash Management Setup";
    begin
        if not CustRec.Get("Candidate No.") then begin
            CashMgtSetup.Get;
            CashMgtSetup.TestField("Imprest Posting Group");
            CustRec."No." := "Candidate No.";
            CustRec.Name := "First Name" + ' ' + "Middle Name" + ' ' + "Last Name";
            CustRec."Customer Posting Group" := CashMgtSetup."Imprest Posting Group";
            CustRec.Insert;
            exit(true)
        end else
            exit(false);
    end;

    local procedure UpdateSearchName()
    var
        PrevSearchName: Code[250];
    begin
    end;

    local procedure SetSearchNameToFullnameAndInitials(): Code[250]
    begin
    end;

    procedure GetBankAccountNo(): Text
    begin
    end;

    procedure CheckBlockedEmployeeOnJnls(IsPosting: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeGetFullName(Employee: Record Employee; var NewFullName: Text[100]; var Handled: Boolean)
    begin
    end;

    local procedure CheckIfAnEmployeeIsLinkedToTheResource(ResourceNo: Code[20])
    var
        Employee: Record Employee;
    begin
    end;

    local procedure NameBreakdown()
    var
        NamePart: array[30] of Text[100];
        TempName: Text[250];
        FirstName250: Text[250];
        i: Integer;
        NoOfParts: Integer;
    begin
        TempName := "Full Names";
        while StrPos(TempName, ' ') > 0 do begin
            if StrPos(TempName, ' ') > 1 then begin
                i := i + 1;
                NamePart[i] := CopyStr(TempName, 1, StrPos(TempName, ' ') - 1);
            end;
            TempName := CopyStr(TempName, StrPos(TempName, ' ') + 1);
        end;
        i := i + 1;
        NamePart[i] := CopyStr(TempName, 1, MaxStrLen(NamePart[i]));
        NoOfParts := i;

        "First Name" := '';
        "Middle Name" := '';
        "Last Name" := '';
        for i := 1 to NoOfParts do
            if (i = NoOfParts) and (NoOfParts > 1) then
                "Last Name" := CopyStr(NamePart[i], 1, MaxStrLen("Last Name"))
            else
                if (i = NoOfParts - 1) and (NoOfParts > 2) then
                    "Middle Name" := CopyStr(NamePart[i], 1, MaxStrLen("Middle Name"))
                else begin
                    FirstName250 := DelChr("First Name" + ' ' + NamePart[i], '<', ' ');
                    "First Name" := CopyStr(FirstName250, 1, MaxStrLen("First Name"));
                end;
    end;
}

