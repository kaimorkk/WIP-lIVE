table 50132 "Performance Targets"
{
    Caption = 'Performance Targets';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Contract No."; Code[100])
        {
            Caption = 'No.';
        }
        field(2; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
        }
        field(3; "PMMU No."; Code[20])
        {
            Caption = 'PMMU No.';
        }
        field(4; Activity; Text[250])
        {
            Caption = 'Activity';

            trigger OnValidate()
            var
                PositionTargets: Record "Position Targets";
            begin
                //PositionTargets.Reset();
                // PositionTargets.SetRange("Position Code", "Line Number");
                //PositionTargets.SetRange("Line No.", PositionLineNo);
                //if PositionTargets.FindFirst() then begin
                //Description := PositionTargets.Target;

                // end;

                /*PositionsResp.Reset;
                PositionsResp.SetRange("Position ID", "Line Number");
                PositionsResp.SetRange("Line No", PositionLineNo);
                if PositionsResp.FindFirst() then
                    Description := PositionsResp.Description;*/

            end;


            trigger OnLookup()
            var
                PositionsResp: Record "Positions Responsibility";
                PositionTargets: Record "Position Targets";
                UserSetup: Record "User Setup";
                Employee: Record Employee;
                PerfomanceContrHdr: Record "Perfomance Contract Header";
                PMMUActivities: Record "PMMU Activities";
                PMMUOutActivities: Record "PMMU Output Activities";
                EmployeeNotSetup: Label 'Employee has not been setup on user setup';
            begin
                UserSetup.Get(UserId);
                if Employee.Get(UserSetup."Employee No.") then begin

                    PerfomanceContrHdr.Reset();
                    PerfomanceContrHdr.SetRange(No, "Contract No.");
                    if PerfomanceContrHdr.FindFirst() then;

                    PerfomanceContrHdr.TestField("Populate Activities From");

                    if PerfomanceContrHdr."Populate Activities From" = PerfomanceContrHdr."Populate Activities From"::"Job Description" then begin
                        PositionTargets.Reset();
                        PositionTargets.SetRange("Position Code", Employee."Current Position ID");
                        if Page.RunModal(Page::"Position Targets", PositionTargets) = Action::LookupOK then begin
                            PositionLineNo := PositionTargets."Line No.";
                            Validate(Activity, PositionTargets."Strategic Objective");
                            Validate("Performance Indicator", PositionTargets.KPI);
                            Validate(Weight, PositionTargets."Assigned Weight (%)");
                        end
                    end;

                    if PerfomanceContrHdr."Populate Activities From" = PerfomanceContrHdr."Populate Activities From"::PMMU then begin
                        //PMMUActivities.Reset();
                        //PMMUActivities.SetRange("Contract No.", PerfomanceContrHdr."Directors PC ID");
                        //PMMUActivities.SetRange("Strategy Plan ID", PerfomanceContrHdr."Strategy Plan ID");

                        PMMUOutActivities.Reset();
                        PMMUOutActivities.SetRange("Contract No.", PerfomanceContrHdr."Department/Center PC ID");
                        //PMMUOutActivities.SetRange("Strategy Plan ID", PerfomanceContrHdr."Strategy Plan ID");
                        if Page.RunModal(Page::"PMMU Output Activities", PMMUOutActivities) = Action::LookupOK then begin
                            // Validate("Line Number",PMMUActivities."Entry No.");
                            Validate(Activity, PMMUOutActivities.Activities);
                        end;
                        ///if Page.Run(Page::"PMMU Activity List", PMMUActivities) = Action::LookupOK then begin
                        /// PositionLineNo := PMMUActivities."Line No.";
                        //    Validate("Line Number", PMMUActivities."Activity ID");
                        // end;
                    end;


                end else
                    Error(EmployeeNotSetup);
            end;




        }
        field(5; "PAS Activity"; Text[250])
        {
            Caption = 'Appraisee Duty/Responsibilities';
        }
        field(6; "Individual Target"; Text[250])
        {
            //  Caption = 'Agreed Performance Target';
        }
        field(7; "Performance Indicator"; Text[250])
        {
            Caption = 'Performance Indicator';
        }
        field(8; Weight; Decimal)
        {
        }
        field(9; Target; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(10; Score; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Actual Achievement';
        }
        field(11; "Appraisee Objective"; Text[250])
        {
            Caption = 'Appraisee Objective';
        }
        field(12; "Key Performance Indicator"; Code[250])
        {
        }
        field(13; "Unit of Measure"; Code[50])
        {
            TableRelation = "Unit of Measure" /*where("For Appraisal?" = const(true))*/;
        }
        field(14; "Self Assessment Target"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(15; "Joint/Agreed Target"; Decimal)
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                if (xRec."Joint/Agreed Target" > "Joint/Agreed Target") and (Target > 0) then
                    Score := ("Joint/Agreed Target" / Target) * Weight;

            end;
        }
        field(16; "Weighted Score"; Decimal)
        {
        }
    }
    keys
    {
        key(PK; "Contract No.", "PMMU No.", "Entry No.")
        {
            Clustered = true;
        }
    }

    var
        PositionLineNo: Integer;
}
