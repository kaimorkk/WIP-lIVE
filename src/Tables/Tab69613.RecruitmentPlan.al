
table 69613 "Recruitment Plan"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Document No."; Code[30])
        {
        }
        field(2; "Document Date"; Date)
        {
        }
        field(3; "Financial Year Code"; Code[30])
        {
            TableRelation = "Financial Year Code";

            trigger OnValidate()
            begin
                FinancialYearCode.Reset;
                FinancialYearCode.SetRange(Code, "Financial Year Code");
                if FinancialYearCode.FindFirst then begin
                    Description := FinancialYearCode.Code + ' Annual recruitment Plan';
                    "Planning Start Date" := FinancialYearCode."Starting Date";
                    "Planning End Date" := FinancialYearCode."Ending Date";

                end;
            end;
        }
        field(4; Description; Text[100])
        {
        }
        field(5; "External Document No"; Code[30])
        {
        }
        field(6; "Planning Start Date"; Date)
        {
        }
        field(7; "Planning End Date"; Date)
        {
        }
        field(8; "Corporate Strategic Plan ID"; Code[30])
        {
            TableRelation = "Corporate Strategic Plans";
        }
        field(9; "Approved Staff Establishment"; Integer)
        {
            CalcFormula = count("Establishment Planning Line" where("Primary Key" = field("Staff Establishement"), "Duty Station ID" = field("Duty Station ID")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(10; "No. of Planned New Hires"; Integer)
        {
            CalcFormula = sum("Recruitment Planning Line"."No. of Planned New Hires" where("Recruitment Plan ID" = field("Document No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(11; "Total Recruitment Budget (LCY)"; Decimal)
        {
        }
        field(12; "No. of Recruitment Requisition"; Integer)
        {
        }
        field(13; "Approval Status"; Option)
        {
            OptionCaption = 'Open,Pending Approval,Released';
            OptionMembers = Open,"Pending Approval",Released;
        }
        field(14; "Created BY"; Code[30])
        {
        }
        field(15; "Created On"; DateTime)
        {
        }
        field(16; Posted; Boolean)
        {
            Editable = false;
        }
        field(17; "Posted By"; Code[30])
        {
        }
        field(18; "Posted On"; DateTime)
        {
        }
        field(19; "Recruitment Plan Type"; Option)
        {
            OptionCaption = 'Annual HR Plan,Special Recruitment,Project Recruitment,Manpower Forecast,Functional Plan';
            OptionMembers = "Annual HR Plan","Special Recruitment","Project Recruitment","Manpower Forecast","Functional Plan";
        }
        field(20; "Job No"; Code[30])
        {
        }
        field(21; "Average Cost/Hire"; Decimal)
        {
        }
        field(22; "Estimated Annual Salary"; Decimal)
        {
            Caption = 'Total Estimated Annual Salary (LCY)';
        }
        field(23; "No. of Vacancies"; Integer)
        {
            CalcFormula = count(Vacancy where("Recruitment Plan ID" = field("Document No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(24; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Global Dimension 1 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(1, "Global Dimension 1 Code");
            end;
        }
        field(25; "Global Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            Caption = 'Global Dimension 2 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(2, "Global Dimension 2 Code");
            end;
        }
        field(26; "Global Dimension 1"; Text[30])
        {
            CaptionClass = '1,1,1';
            Caption = 'Global Dimension 1';
            TableRelation = "Dimension Value".Name where("Global Dimension No." = const(1));

            trigger OnValidate()
            begin
                DimensionValue.Reset;
                DimensionValue.SetRange("Dimension Code", "Global Dimension 1 Code");
                if DimensionValue.FindSet then begin
                    "Global Dimension 1" := DimensionValue.Name;
                end;
            end;
        }
        field(27; "Global Dimension 2"; Text[30])
        {
            CaptionClass = '1,1,2';
            Caption = 'Global Dimension 2';
            TableRelation = "Dimension Value".Name where("Global Dimension No." = const(2));

            trigger OnValidate()
            begin
                DimensionValue.Reset;
                DimensionValue.SetRange("Dimension Code", "Global Dimension 2");
                if DimensionValue.FindSet then begin
                    "Global Dimension 2" := DimensionValue.Name;
                end;
            end;
        }
        field(28; "No. Series"; Code[30])
        {
        }
        field(29; "Functional Planned Hires"; Integer)
        {
            CalcFormula = sum("Recruitment Planning Line"."No. of Planned New Hires" where("Recruitment Plan ID" = field("Document No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(30; "Annual Recruitment Plan No."; Code[30])
        {
            TableRelation = "Recruitment Plan"."Document No." where("Financial Year Code" = field("Financial Year Code"),
                                                                     "Recruitment Plan Type" = const("Annual HR Plan"));
        }
        field(31; "Duty Station ID"; Code[30])
        {

            TableRelation = "Duty Station" where(blocked = const(false));
            trigger OnValidate()
            begin

                "Global Dimension 1" := "Duty Station ID";
            end;
        }
        field(32; "Staff Establishement"; Code[30])
        {
            TableRelation = "Staff Establishment Plan" where(Status = filter(Approved));
        }
        field(33; "Implementing Unit"; Code[30])
        {

            TableRelation = "Responsibility Center" where("Operating Unit Type" = filter(Directorate | "Court Stations" | "Department/Center" | "Division/Section" | Office));
            trigger OnValidate()
            var
                RespC: Record "Responsibility Center";
            begin
                if RespC.get("Implementing Unit") then
                    "Implementing Unit Name" := RespC.Name;
            end;
        }
        field(34; "Implementing Unit Name"; Text[100])
        {
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(Key1; "Document No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if "Recruitment Plan Type" = "recruitment plan type"::"Functional Plan" then begin
            if "Document No." = '' then begin
                HumanResourcesSetup.Get;
                HumanResourcesSetup.TestField("Functional Plan Nos.");
                NoSeriesMgt.InitSeries(HumanResourcesSetup."Functional Plan Nos.", xRec."No. Series", 0D, "Document No.", "No. Series");
                "Staff Establishement" := HumanResourcesSetup."Current Global Staff Est";
            end;

            Employee.Reset;
            Employee.SetRange("User ID", UserId);
            if Employee.FindFirst then begin
                /* "Global Dimension 1 Code":=Employee."Global Dimension 1 Code";//activated per client
                 VALIDATE("Global Dimension 1 Code");
                 "Global Dimension 2 Code":=Employee."Global Dimension 2 Code";
                 VALIDATE("Global Dimension 2 Code");*/
            end;
        end else begin
            if "Recruitment Plan Type" = "recruitment plan type"::"Annual HR Plan" then begin
                if "Document No." = '' then begin
                    HumanResourcesSetup.Get;
                    HumanResourcesSetup.TestField("Recruitment Plan Nos.");
                    NoSeriesMgt.InitSeries(HumanResourcesSetup."Recruitment Plan Nos.", xRec."No. Series", 0D, "Document No.", "No. Series");
                    "Staff Establishement" := HumanResourcesSetup."Current Global Staff Est";
                end;
            end;
            if "Recruitment Plan Type" = "recruitment plan type"::"Project Recruitment" then begin
                if "Document No." = '' then begin
                    HumanResourcesSetup.Get;
                    HumanResourcesSetup.TestField("Recruitment Plan Nos.");
                    NoSeriesMgt.InitSeries(HumanResourcesSetup."Recruitment Plan Nos.", xRec."No. Series", 0D, "Document No.", "No. Series");
                    "Staff Establishement" := HumanResourcesSetup."Current Global Staff Est";
                end;
            end;
        end;
        "Document Date" := Today;
        "Created BY" := UserId;
        "Created On" := CurrentDatetime;


    end;

    trigger OnModify()
    var
        myInt: Integer;
    begin
        if (Rec."Recruitment Plan Type" = Rec."Recruitment Plan Type"::"Annual HR Plan") and ("Approval Status" = "Approval Status"::Released) then begin
            SendEmailNotif2(Rec);
        end;



    end;

    var
        DimMgt: Codeunit DimensionManagement;
        HumanResourcesSetup: Record "Human Resources Setup";
        Employee: Record Employee;
        DimensionValue: Record "Dimension Value";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        FinancialYearCode: Record "Financial Year Code";

    procedure ValidateShortcutDimCode(FieldNumber: Integer; var ShortcutDimCode: Code[20])
    begin
        DimMgt.ValidateDimValueCode(FieldNumber, ShortcutDimCode);
        DimMgt.SaveDefaultDim(Database::"Recruitment Plan", "Document No.", FieldNumber, ShortcutDimCode);
        Modify;
    end;

    procedure SendEmailNotif2(BulkProcessingHeader: Record "Recruitment Plan")
    var
        Customer: Record Customer;
        // SMTPMail: Codeunit "SMTP Mail";
        TempBlob: Codeunit "Temp Blob";
        RecRef: RecordRef;
        Recipients: List of [Text];
        OutStr: OutStream;
        InStr: InStream;
        OutStr2: OutStream;
        InStr2: InStream;
        BodyTxt: Text;
        usersetup: Record "User Setup";

        Email: Codeunit Email;
        EmailMessage: Codeunit "Email Message";
        BulkProcessingHead: Record "Recruitment Plan";

        BulkProcessingHead2: Record "Recruitment Plan";
    begin
        BulkProcessingHead2.Reset();
        BulkProcessingHead2.setrange("Annual Recruitment Plan No.", BulkProcessingHeader."Document No.");
        if BulkProcessingHead2.findset() then begin
            repeat
                usersetup.Reset();
                usersetup.SetRange("User ID", BulkProcessingHead2."Created BY");
                if usersetup.FindSet() then

                    // get the customer record and save the report to outstream then do instream and wrtie it to text
                    BulkProcessingHead.SetRange("Document No.", BulkProcessingHeader."Document No.");
                RecRef.GetTable(BulkProcessingHead);
                TempBlob.CreateOutStream(OutStr);
                // Report.SaveAs(Report::"Registration Invoice", '', ReportFormat::Pdf, OutStr, RecRef);
                TempBlob.CreateInStream(InStr);
                InStr.ReadText(BodyTxt);

                EmailMessage.Create(usersetup."E-Mail", 'Annual Consolidated Recruitment Plan', 'Dear Sir/Madam,<BR></BR>' +
                'Please find attached approved consolidated Recruitment plan');

                // add attachment for with pdf
                TempBlob.CreateOutStream(OutStr2);
                // Report.SaveAs(Report::"Registration Invoice", '', ReportFormat::Pdf, OutStr, RecRef);
                TempBlob.CreateInStream(InStr2);
                // EmailMessage.AddAttachmentStream(InStr2, 'attachment.pdf');
                // EmailMessage.add
                EmailMessage.AddAttachment('attachment.pdf', 'PDF', InStr2);
                Email.Send(EmailMessage, Enum::"Email Scenario"::Default);
            until BulkProcessingHead2.next = 0;
        end;
    end;
}



