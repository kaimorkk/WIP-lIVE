
table 69615 "Recruitment Plan Position"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Recruitment Plan ID"; Code[30])
        {
            TableRelation = "Recruitment Plan";
        }
        field(2; "Position ID"; Code[30])
        {
            TableRelation = "Company Positions"."Position ID";
            Caption = 'Position Code';
            trigger OnValidate()
            begin
                RecruitmentPlan.Reset;
                RecruitmentPlan.SetRange("Document No.", "Recruitment Plan ID");
                if RecruitmentPlan.FindSet then begin
                    if RecruitmentPlan."Recruitment Plan Type" = RecruitmentPlan."recruitment plan type"::"Functional Plan"
                       then begin
                        CompanyPositions.Reset;
                        CompanyPositions.SetRange("Position ID", "Position ID");
                        if CompanyPositions.FindFirst then begin
                            "Position Category" := CompanyPositions."Position Category";
                            "Job Title/Designation" := CompanyPositions."Job Title";
                            "Current Headcount" := CompanyPositions."No of Active Contracts";
                            "Staff Establishment" := CompanyPositions."Approved Establishment";
                        end;
                    end else begin
                        EstablishmentPlanPosition.Reset;
                        EstablishmentPlanPosition.SetRange("Job ID", "Position ID");
                        EstablishmentPlanPosition.CalcFields("Actual Terminated", "Approved No.");
                        //EstablishmentPlanPosition.SETFILTER("Department Code",'>%1',EstablishmentPlanPosition."Actual Terminated");
                        if EstablishmentPlanPosition.FindSet then begin
                            // EstablishmentPlanPosition.CALCFIELDS("Actual Active");
                            // EstablishmentPlanPosition.CALCFIELDS("Job Title");
                            "Job Title/Designation" := EstablishmentPlanPosition."Job Title";
                            "Staff Establishment" := EstablishmentPlanPosition."Approved No.";
                            "Current Headcount" := EstablishmentPlanPosition."Actual Active";
                            "Designation Group" := EstablishmentPlanPosition."Designation Group";
                            Department := EstablishmentPlanPosition."Department Code";
                            Directorate := EstablishmentPlanPosition."Directorate Code";
                        end;
                    end;
                end;
                Validate("Recruitment Plan ID");
            end;
        }
        field(3; "Job Title/Designation"; Text[100])
        {
            Editable = false;
        }
        field(4; "Designation Group"; Code[30])
        {
            TableRelation = "Designation Groups";
        }
        field(5; Directorate; Code[30])
        {
            TableRelation = "Responsibility Center" where("Operating Unit Type" = filter(Directorate));
        }
        field(6; Department; Code[30])
        {
            TableRelation = "Responsibility Center" where("Operating Unit Type" = filter("Department/Center"));
        }
        field(7; "Staff Establishment"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = sum("Establishment Planning Line"."Optimal Staffing" where("Position ID" = field("Position ID"),
                                                                                      Blcoked = const(false)));
            Editable = false;
        }
        field(8; "Current Headcount"; Integer)
        {
            CalcFormula = count(Employee where("Current Position ID" = field("Position ID"),
                                                Status = const(Active)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(9; "Total Planned New Hires"; Integer)
        {
            CalcFormula = sum("Recruitment Planning Line"."No. of Planned New Hires" where("Recruitment Plan ID" = field("Recruitment Plan ID"),
                                                                                            "Position ID" = field("Position ID")));
            FieldClass = FlowField;
        }
        field(10; "Recruitment Budget Cost (LCY)"; Decimal)
        {
        }
        field(11; "Position Category"; Option)
        {
            OptionCaption = 'Employee,Resource';
            OptionMembers = Employee,Resource;
        }
    }

    keys
    {
        key(Key1; "Recruitment Plan ID", "Position ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        EstablishmentPlanPosition: Record "Establishment Plan Position";
        RecruitmentPlan: Record "Recruitment Plan";
        CompanyPositions: Record "Company Positions";
        Employee: Record Employee;
}

