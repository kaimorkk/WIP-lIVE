
table 69619 "Recruitment Requisition Header"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Document No."; Code[30])
        {
            Editable = false;
        }
        field(2; "Document Date"; Date)
        {
            Editable = false;
        }
        field(3; "Recruitment Plan ID"; Code[30])
        {
            Caption = 'Recuitment Plan Code';
            TableRelation = "Recruitment Plan" where("Recruitment Plan Type" = field("Recruitment Plan Type"));
        }
        field(4; "Recruitment Plan Type"; Option)
        {
            OptionCaption = 'Annual HR Plan,Special Recruitment,Project Recruitment';
            OptionMembers = "Annual HR Plan","Special Recruitment","Project Recruitment";
        }
        field(5; "Position ID"; Code[100])
        {
            Caption = 'Position Code';
            TableRelation = if ("Recruitment Plan Type" = const("Annual HR Plan")) "Recruitment Planning Line"."Position ID" where("Recruitment Plan ID" = field("Recruitment Plan ID"),
                                                                                                                                  "Recruitment Plan Type" = const("Annual HR Plan"))

            else
            if ("Recruitment Plan Type" = const("Special Recruitment")) "Company Positions"."Position ID"
            else
            if ("Recruitment Plan Type" = const("Project Recruitment")) "Recruitment Planning Line"."Position ID" where("Recruitment Plan ID" = field("Recruitment Plan ID"),
                 "Recruitment Plan Type" = const("Project Recruitment"));

            trigger OnValidate()
            begin
                CompanyPositions.Reset;
                CompanyPositions.SetRange("Position ID", "Position ID");
                if CompanyPositions.FindFirst then begin
                    "Hierarchically Reports To" := CompanyPositions."Directly Reports To";
                    "Functionally  Reports To" := CompanyPositions."Indirectly Reports To";
                    "Job Grade ID" := CompanyPositions."Job Grade ID";
                    "Job Title/Designation" := CompanyPositions."Job Title";

                    "Position Category" := CompanyPositions."Position Category";
                    "Overall Appointment Authority" := CompanyPositions."Overall Appointment Authority";
                    "Seniority Level" := CompanyPositions."Seniority Level";
                    // Department := CompanyPositions.Department;
                    //Directorate := CompanyPositions.Directorate;
                    "Default Terms of Service Code" := CompanyPositions."Default Terms of Service";

                    //"Staff Establishment":=CompanyPositions."Approved Establishment";
                end;


                PlanningLine.Reset;
                PlanningLine.SetRange("Recruitment Plan ID", "Recruitment Plan ID");
                PlanningLine.SetRange("Position ID", "Position ID");
                if PlanningLine.FindSet then begin
                    "No of Openings" := PlanningLine."No. of Planned New Hires";
                    "Sourcing Method" := PlanningLine."Sourcing Method";
                    PlanningLine.CalcFields("Current Headcount", "Staff Establishment");
                    "Primary Recruitment Reason" := PlanningLine."Primary Recruitment Reason";
                    "Recruitment Cycle Type" := PlanningLine."Recruitment Cycle Type";
                    "Recruitment Justification" := PlanningLine."Recruitment Justification";
                    "Recruitment Lead Time" := PlanningLine."Recruitment Lead Time";
                    "Recruitment Line Budget Cost" := PlanningLine."Recruitment Line Budget Cost";
                    "Planned Recruitment Start Date" := PlanningLine."Planned Employment Start Date";
                    "Planned Recruitment End Date" := PlanningLine."Planned Employment End Date";
                    "Planned Employment End Date" := PlanningLine."Planned Employment Start Date";
                    "Planned Employment End Date" := PlanningLine."Planned Employment End Date";
                    "Staff Establishment" := PlanningLine."Staff Establishment";
                    "Current Headcount" := PlanningLine."Current Headcount";
                    "Duty Station ID" := PlanningLine."Duty Station ID";
                    // Department := PlanningLine.Department;
                    //Directorate := PlanningLine.Directorate;
                    Region := PlanningLine."Region ID";
                    "Estimate Annual Salary" := PlanningLine."Estimate Annual Salary";
                    "Job No." := PlanningLine."Job No.";
                    "Job Task No." := PlanningLine."Job Task No.";
                    "Funding Source ID" := PlanningLine."Funding Source ID";

                end
            end;
        }

        field(6; "Requester ID"; Code[30])
        {

            Editable = false;
            TableRelation = "User Setup";
        }
        field(7; "Requester Staff No"; Code[30])
        {
            Editable = false;
            TableRelation = Employee;
            trigger onvalidate()
            var
                HrEmp: Record Employee;
            begin
                if HrEmp.Get("Requester Staff No") then begin
                    "Requester Name" := HrEmp.FullName();
                    Directorate := HrEmp."Directorate Code";
                    Department := HrEmp."Department Code";
                    // Region := HrEmp.Region;
                end;

            end;

        }
        field(8; "Requester Name"; Text[250])
        {
            Editable = false;
            TableRelation = Employee;
            ValidateTableRelation = false;
        }
        field(9; Directorate; Code[30])
        {
            TableRelation = "Responsibility Center" where("Operating Unit Type" = filter(Directorate));
        }
        field(10; Department; Code[30])
        {
            TableRelation = "Responsibility Center" where("Operating Unit Type" = filter("Department/Center"));
        }
        field(11; Region; Code[30])
        {
            TableRelation = "Responsibility Center" where("Operating Unit Type" = filter(Region));
        }
        field(12; "Finacial Year Code"; Code[30])
        {
            Caption = 'Financial Year';
            // TableRelation = "Financial Year Code";
            TableRelation = "G/L Budget Name";
        }
        field(13; "Approval Status"; Option)
        {
            OptionCaption = 'Open,Pending Approval,Released';
            OptionMembers = Open,"Pending Approval",Released;
        }
        field(14; "Created By"; Code[30])
        {
            Editable = false;
        }
        field(15; "Created On"; Date)
        {
            Editable = false;
        }
        field(16; "Created Time"; Time)
        {
            Editable = false;
        }
        field(17; "Staff Establishment"; Integer)
        {
            Editable = false;
        }
        field(18; "Current Headcount"; Integer)
        {
            Editable = false;
        }
        field(19; "No of Openings"; Integer)
        {
        }
        field(20; "Primary Recruitment Reason"; Code[30])
        {
            TableRelation = "Recruitment Reason Code";
        }
        field(21; "Recruitment Justification"; Text[2000])
        {
        }
        field(22; "Target Candidate Source"; Option)
        {
            OptionCaption = 'Open,Limited-Internal Staff,Limited-External Staff';
            OptionMembers = Open,"Limited-Internal Staff","Limited-External Staff";
        }
        field(23; "Sourcing Method"; Option)
        {
            OptionCaption = 'Recruitment Agency,Direct Hire';
            OptionMembers = "Recruitment Agency","Direct Hire";
        }
        field(24; "Recruitment Cycle Type"; Option)
        {
            OptionCaption = 'Standard,Expedited';
            OptionMembers = Standard,Expedited;
        }
        field(25; "Recruitment Lead Time"; DateFormula)
        {
        }
        field(26; "Planned Recruitment Start Date"; Date)
        {
        }
        field(27; "Planned Recruitment End Date"; Date)
        {
        }
        field(28; "Planned Employment Start Date"; Date)
        {
        }
        field(29; "Planned Employment End Date"; Date)
        {
        }
        field(30; "Job No."; Code[30])
        {
            Caption = 'Budget No';
            TableRelation = Job;
        }
        field(31; "Job Task No."; Code[30])
        {
            Caption = 'Budget line no';
            TableRelation = "Job Task"."Job Task No." where("Job No." = field("Job No."));

            //             trigger OnValidate()
            //             begin
            //                 Job.Reset;
            //                 Job.SetRange("Job No.","Job No.");
            //                 Job.SetRange("Job Task No.","Job Task No.");
            //                 if Job.FindFirst then
            // ;
        }
        field(32; "Funding Source ID"; Code[30])
        {
            Editable = false;
            Caption = 'Funding Source';
            TableRelation = "Funding Source".Code;
        }
        field(33; "Recruitment Line Budget Cost"; Decimal)
        {
            Caption = 'Recruitment Line Budget Cost(LCY)';
        }
        field(34; "Average Cost/Hire"; Decimal)
        {
        }
        field(35; "Estimate Annual Salary"; Decimal)
        {
        }
        field(36; "Hierarchically Reports To"; Code[30])
        {
            TableRelation = "Company Positions";
        }
        field(37; "Functionally  Reports To"; Code[30])
        {
            TableRelation = "Company Positions";
        }
        field(38; "Job Grade ID"; Code[30])
        {
            TableRelation = "Salary Scales";
        }
        field(39; "Overall Appointment Authority"; Code[30])
        {
            TableRelation = "Responsibility Center";
        }
        field(40; "Seniority Level"; Option)
        {
            OptionCaption = ',Entry-Level,Mid-Level,Senior-Level,Executive';
            OptionMembers = ,"Entry-Level","Mid-Level","Senior-Level",Executive;
        }
        field(41; "Default Terms of Service Code"; Code[30])
        {
            TableRelation = "Terms of Service";
        }
        field(42; "Employment Type"; Option)
        {
            OptionCaption = 'Permanent,Contract,Casual,Internship,Attachment';
            OptionMembers = Permanent,Contract,Casual,Internship,Attachment;
        }
        field(43; "Dimension Set ID"; Code[30])
        {
        }
        field(44; "Vacancy No"; Code[30])
        {
        }
        field(45; "Vacancy Status"; Option)
        {
            OptionCaption = 'Draft,Published,Evaluation,Closed,Cancelled';
            OptionMembers = Draft,Published,Evaluation,Closed,Cancelled;
        }
        field(46; "Vacancy Announcement ID"; Code[30])
        {
        }
        field(47; "Date Published"; Date)
        {
        }
        field(48; "Application Closing Date"; Date)
        {
        }
        field(49; "Application Closing Time"; Time)
        {
        }
        field(50; "No. of Applications"; Integer)
        {
            CalcFormula = count("Job Applications" where("Vacancy Id" = field("Document No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(51; "No of Filled Posts"; Integer)
        {
        }
        field(52; "Job Title/Designation"; Text[2048])
        {
        }
        field(53; "Duty Station ID"; Code[30])
        {
            Caption = 'Cost center code';
            TableRelation = "Duty Station";
        }
        field(54; "Work Location Details"; Text[300])
        {
        }
        field(55; "Document Type"; Option)
        {
            OptionCaption = 'Recruitment Requisition,Job Vacancy';
            OptionMembers = "Recruitment Requisition","Job Vacancy";
        }
        field(56; Published; Boolean)
        {
        }
        field(57; "No. Series"; Code[30])
        {
        }
        field(58; "Vacancy Created"; Boolean)
        {
        }
        field(59; "Requisition ID"; Code[30])
        {
            caption = 'Requisition Code';
            TableRelation = "Recruitment Requisition Header" where("Document Type" = filter("Recruitment Requisition"));
        }
        field(60; "Position Category"; Option)
        {
            OptionCaption = 'Employee,Resource';
            OptionMembers = Employee,Resource;
        }
        field(61; "Estimate Gross Salary"; Decimal)
        {
            CalcFormula = sum("Recruitment Salary Benefits".Amount where("Document No" = field("Document No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(62; "Job Purpose"; Text[1000])
        {
        }
        field(71; "Application Procedure 1"; Text[2000])
        {
        }
        field(72; "Application Procedure 2"; Text[2000])
        {
        }
        field(73; "Application Procedure 3"; Text[2000])
        {
        }
        field(74; "Application Procedure 4"; Text[2000])
        {
        }
        field(75; "Hierarchically Reports Name"; Text[250])
        {
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = lookup("Company Positions"."Job Title" where("Position ID" = field("Hierarchically Reports To")));
        }
        field(76; "Functionally Reports Name"; Text[250])
        {
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = lookup("Company Positions"."Job Title" where("Position ID" = field("Functionally  Reports To")));
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
        fieldgroup(DropDown; "Document No.", "Job Title/Designation", Department, "Planned Employment Start Date")
        {
        }
    }

    trigger OnInsert()
    begin
        if "Document Type" = "document type"::"Job Vacancy" then begin
            HumanResourcesSetup.Get;
            HumanResourcesSetup.TestField("Training Deduction");
            if "Document No." = '' then
                NoSeriesMgt.InitSeries(HumanResourcesSetup."Training Deduction", xRec."No. Series", 0D, "Document No.", "No. Series");

        end;

        if "Document Type" = "document type"::"Recruitment Requisition" then begin
            HumanResourcesSetup.Get;
            HumanResourcesSetup.TestField("Recruitment Requsition Nos.");
            if "Document No." = '' then
                NoSeriesMgt.InitSeries(HumanResourcesSetup."Recruitment Requsition Nos.", xRec."No. Series", 0D, "Document No.", "No. Series");

        end;


        UserSetup.Reset;
        if UserSetup.Get(UserId) then begin
            UserSetup.TestField("Employee No.");
            Employee.Reset;
            Employee.SetRange("No.", UserSetup."Employee No.");
            if Employee.FindFirst then begin
                "Requester Name" := Employee."First Name" + ' ' + Employee."Middle Name" + ' ' + Employee."Last Name";
                "Requester Staff No" := Employee."No.";
                Department := Employee."Department Code";
                Directorate := Employee."Directorate Code";

            end;
        end;
        "Requester ID" := UserId;
        "Created On" := Today;
        "Created Time" := Time;
        "Created By" := UserId;
        "Document Date" := Today;
    end;

    var
        UserSetup: Record "User Setup";
        Employee: Record Employee;
        PlanningLine: Record "Recruitment Planning Line";
        CompanyPositions: Record "Company Positions";
        HumanResourcesSetup: Record "Human Resources Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        Job: Record "Job Task";
}

