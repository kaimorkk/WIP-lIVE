
table 69600 "Company Positions"
{
    DrillDownPageID = "Positions Lists";
    LookupPageID = "Positions Lists";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Position ID"; Code[20])
        {
            // NotBlank = true;
            Caption = 'Position No';
        }
        field(2; "Job Title"; Text[250])
        {
        }
        field(3; "Directly Reports To"; Code[30])
        {
            Caption = 'Hierarchically (Directly) Reports To';
            TableRelation = "Company Positions";
        }
        field(4; "Indirectly Reports To"; Code[30])
        {
            Caption = 'Functionally (Indirectly) Reports To';
            TableRelation = "Company Positions";
        }
        field(5; "Executive Summary/Job Purpose"; Text[2000])
        {
        }
        field(6; "Designation Group"; Code[30])
        {
            TableRelation = "Designation Groups";
        }
        field(7; "Job Grade ID"; Code[30])
        {
            TableRelation = "Salary Scales";
            Caption = 'Job Grade';
        }
        field(8; "Overall Appointment Authority"; Code[30])
        {
            TableRelation = "Responsibility Center".Code where("Blocked?" = const(false),
                                                                "Operating Unit Type" = filter(Authority));
        }
        field(9; "Seniority Level"; Option)
        {
            OptionCaption = ',Entry-Level,Mid-Level,Senior-Level,Executive,Supervisory Level';
            OptionMembers = ,"Entry-Level","Mid-Level","Senior Level",Executive,"Supervisory Level";
        }
        field(10; "Default Terms of Service"; Code[30])
        {
            TableRelation = "Terms of Service";
        }
        field(11; "Employment Type"; Option)
        {
            OptionCaption = 'Permanent,Contract,Casual,Secondment,Internship,Attachment,Volunteer';
            OptionMembers = Permanent,Contract,Casual,Secondment,Internship,Attachment,Volunteer;
        }
        field(12; Directorate; Code[30])
        {
            TableRelation = "Responsibility Center".Code where("Operating Unit Type" = filter(Directorate),
                                                                "Blocked?" = const(false));
        }
        field(13; Department; Code[30])
        {
            TableRelation = "Responsibility Center".Code where("Operating Unit Type" = filter("Department/Center"),
                                                                "Blocked?" = const(false));
        }
        field(14; "Minimum Academic Qualification"; Code[30])
        {
            TableRelation = Qualification where("Qualification Category" = filter(Academic),
                                                 Blocked = filter(false));

            trigger OnValidate()
            begin
                if Qualification.Get("Minimum Academic Qualification") then
                    "Academic Hierarchy Code" := Qualification."Academic Hierachy Code";
            end;
        }
        field(15; "Minimum Work Experience"; Integer)
        {
        }
        field(16; "Minimum Mngmnt Experience"; Integer)
        {
            Caption = 'Minimum Management Experience';
        }
        field(17; "Default Probation Period"; DateFormula)
        {
        }
        field(18; "Default Duty Station"; Code[30])
        {
            TableRelation = "Duty Station";

            trigger OnValidate()
            begin
                if DesignationGroups.Get("Default Duty Station") then begin
                    "Job Grade ID" := DesignationGroups."Job Grade";
                end;
            end;
        }
        field(19; "Effective Date"; Date)
        {
        }
        field(20; "Travel Frequency"; Option)
        {
            OptionCaption = 'None,Occassional,Frequent';
            OptionMembers = "None",Occassional,Frequent;
        }
        field(21; "Default Work Shift"; Code[30])
        {
            TableRelation = "Employee Work Shift";

            trigger OnValidate()
            var
                EmployeeWorkShift: Record "Employee Work Shift";
            begin
                if EmployeeWorkShift.Get("Default Work Shift") then
                    "Work Shift Description" := EmployeeWorkShift.Description;
            end;
        }
        field(22; "Work Shift Description"; Text[100])
        {
        }
        field(23; "Additional Responsibilities"; Boolean)
        {
            Caption = 'Additional Responsibilities may be added';
        }
        field(24; "Loc Relocation/Transfers"; Boolean)
        {
            Caption = 'Local Relocation/Transfers Apply';
        }
        field(25; "Int Relocation/Transfers"; Boolean)
        {
            Caption = 'International Relocation/Transfers Apply';
        }
        field(26; "Qualifies for Overtime"; Boolean)
        {
        }
        field(27; "Direct Hire Unit Cost"; Decimal)
        {
        }
        field(28; "Average Monthly Salary (LCY)"; Decimal)
        {
        }
        field(29; "Approved Establishment"; Integer)
        {
        }
        field(30; "No of Active Contracts"; Integer)
        {
        }
        field(31; "No. of Terminated Contracts"; Integer)
        {
        }
        field(32; "Dimension Set ID"; Integer)
        {

            trigger OnLookup()
            begin
                ShowDimensions;
            end;

            trigger OnValidate()
            begin
                DimMgt.UpdateGlobalDimFromDimSetID("Dimension Set ID", Directorate, Department);
            end;
        }
        field(33; Blocked; Boolean)
        {
        }
        field(34; "Academic Hierarchy Code"; Integer)
        {
            Editable = false;
        }
        field(35; "Position Category"; Option)
        {
            OptionCaption = 'Employee,Resource,Intern,Management Trainee';
            OptionMembers = Employee,Resource,Intern,"Management Trainee";
        }
        field(36; "Cadre Type"; Code[30])
        {
            TableRelation = "Cadre Groups Setup".Code;
        }
        field(37; "Maximum Monthly Salary (LCY)"; Decimal)
        {
        }
        field(38; Status; Option)
        {
            OptionCaption = ' ,Approved,Not Approved';
            OptionMembers = " ",Approved,"Not Approved";
        }
        field(39; "Approval Status"; Option)
        {
            OptionCaption = 'Open,Pending Approval,Released';
            OptionMembers = Open,"Pending Approval",Released;
        }
        field(40; "No. Series"; code[50])
        {
        }
        field(41; "Created By"; code[100])
        {
        }
        field(42; "Document Date"; date)
        {
        }

        field(43; "Number of Staff Per Scale"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count(Employee where(Status = filter(Active), "Salary Scale" = field("Job Grade ID")));
        }
        field(44; "Basic Pay Per Scale"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = Sum("PR Period Transactions".Amount where("Payroll Period" = field("Period Filter"), "Transaction Code" = filter('BPAY'), "Salary Scale" = field("Job Grade ID")));
        }
        field(45; "Period Filter"; Date)
        {
            FieldClass = FlowFilter;
            TableRelation = "PR Payroll Periods"."Date Opened";
        }
        field(46; "Commuter"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = Sum("PR Period Transactions".Amount where("Payroll Period" = field("Period Filter"), "Transaction Code" = filter('ALW-0013'), "Salary Scale" = field("Job Grade ID")));
        }
        field(47; "Non-Practising"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = Sum("PR Period Transactions".Amount where("Payroll Period" = field("Period Filter"), "Transaction Code" = filter('ALW-0018'), "Salary Scale" = field("Job Grade ID")));
        }
        field(48; "Special Responsibility"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = Sum("PR Period Transactions".Amount where("Payroll Period" = field("Period Filter"), "Transaction Code" = filter('ALW-0034'), "Salary Scale" = field("Job Grade ID")));
        }
        field(49; "Market Salary"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = Sum("PR Period Transactions".Amount where("Payroll Period" = field("Period Filter"), "Transaction Code" = filter('ALW-0043'), "Salary Scale" = field("Job Grade ID")));
        }
        field(50; "Risk Allowance"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = Sum("PR Period Transactions".Amount where("Payroll Period" = field("Period Filter"), "Transaction Code" = filter('ALW-0049'), "Salary Scale" = field("Job Grade ID")));
        }
        field(51; "Responsibility Allowance"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = Sum("PR Period Transactions".Amount where("Payroll Period" = field("Period Filter"), "Transaction Code" = filter('ALW-0012'), "Salary Scale" = field("Job Grade ID")));
        }
        field(52; "Extraneous Duty Allowance"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = Sum("PR Period Transactions".Amount where("Payroll Period" = field("Period Filter"), "Transaction Code" = filter('ALW-0016'), "Salary Scale" = field("Job Grade ID")));
        }
        field(53; "Special Judicial Duty"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = Sum("PR Period Transactions".Amount where("Payroll Period" = field("Period Filter"), "Transaction Code" = filter('ALW-0032'), "Salary Scale" = field("Job Grade ID")));
        }
        field(54; "Extra Duty"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = Sum("PR Period Transactions".Amount where("Payroll Period" = field("Period Filter"), "Transaction Code" = filter('ALW-0021'), "Salary Scale" = field("Job Grade ID")));
        }
        field(55; "Special Duty"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = Sum("PR Period Transactions".Amount where("Payroll Period" = field("Period Filter"), "Transaction Code" = filter('ALW-0010'), "Salary Scale" = field("Job Grade ID")));
        }
        field(56; "Gross Pay"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = Sum("PR Period Transactions".Amount where("Payroll Period" = field("Period Filter"), "Transaction Code" = filter('GPAY'), "Salary Scale" = field("Job Grade ID")));
        }
        field(57; "Rental House"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = Sum("PR Period Transactions".Amount where("Payroll Period" = field("Period Filter"), "Transaction Code" = filter('ALW-0004'), "Salary Scale" = field("Job Grade ID")));
        }
    }
    keys
    {
        key(Key1; "Position ID")
        {
            Clustered = true;
        }
        key(Key2; "Job Title")
        {

        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Position ID", "Job Title")
        {
        }
    }
    trigger OnInsert()
    begin
        if "Position ID" = '' then begin
            HumanResourcesSetup.Get;
            HumanResourcesSetup.TestField("Job Position No.s");
            NoSeriesManagement.InitSeries(HumanResourcesSetup."Job Position No.s", xRec."No. Series", 0D, "Position ID", "No. Series");
        end;
        "Created By" := UserId;
        "Document Date" := Today;
    end;

    var
        HumanResourcesSetup: Record "Human Resources Setup";
        NoSeriesManagement: Codeunit NoSeriesManagement;
        CompanyPositions: Record "Company Positions";
        NoOfPosts: Decimal;
        HREmp: Record Employee;
        SalaryScales: Record "Salary Scales";
        DimMgt: Codeunit DimensionManagement;
        Qualification: Record Qualification;
        DesignationGroups: Record "Designation Groups";

    procedure ShowDimensions()
    var
        DimMgt: Codeunit DimensionManagement;
    begin
        DimMgt.ShowDimensionSet("Dimension Set ID", StrSubstNo('%1 %2', TableCaption, "Position ID"));
    end;
}

