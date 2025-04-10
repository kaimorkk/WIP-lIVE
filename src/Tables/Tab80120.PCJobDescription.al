
table 80120 "PC Job Description"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Workplan No."; Code[30])
        {
            TableRelation = "Perfomance Contract Header".No;
        }
        field(2; "Line Number"; Code[30])
        {
            TableRelation = "Position Targets"."Position Code";
            Caption = 'S. No.';
            trigger OnValidate()
            var
                PositionTargets: Record "Position Targets";
            begin
                PositionTargets.Reset();
                PositionTargets.SetRange("Position Code", "Line Number");
                PositionTargets.SetRange("Line No.", PositionLineNo);
                if PositionTargets.FindFirst() then begin
                    //Description := PositionTargets.Target;
                    "Assigned Weight (%)" := PositionTargets."Assigned Weight (%)";
                end;

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
                EmployeeNotSetup: Label 'Employee has not been setup on user setup';
            begin
                UserSetup.Get(UserId);
                if Employee.Get(UserSetup."Employee No.") then begin

                    PerfomanceContrHdr.Reset();
                    PerfomanceContrHdr.SetRange(No, "Workplan No.");
                    if PerfomanceContrHdr.FindFirst() then;

                    PerfomanceContrHdr.TestField("Populate Activities From");

                    if PerfomanceContrHdr."Populate Activities From" = PerfomanceContrHdr."Populate Activities From"::"Job Description" then begin
                        PositionTargets.Reset();
                        PositionTargets.SetRange("Position Code", Employee."Current Position ID");
                        if Page.RunModal(Page::"Position Targets", PositionTargets) = Action::LookupOK then begin
                            PositionLineNo := PositionTargets."Line No.";
                            Validate("Line Number", PositionTargets."Position Code");
                        end
                    end;

                    if PerfomanceContrHdr."Populate Activities From" = PerfomanceContrHdr."Populate Activities From"::PMMU then begin
                        PMMUActivities.Reset();
                        PMMUActivities.SetRange("Contract No.", PerfomanceContrHdr."Directors PC ID");
                        PMMUActivities.SetRange("Strategy Plan ID", PerfomanceContrHdr."Strategy Plan ID");
                        if Page.RunModal(Page::"PMMU Activity List", PMMUActivities) = Action::LookupOK then begin
                            // Validate("Line Number",PMMUActivities."Entry No.");
                            Validate(Activity, PMMUActivities.Activities);
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
        field(3; Description; Text[700])
        {
            Editable = false;
            Caption = 'Strategic Objective';
        }
        field(9; Progress; Option)
        {
            OptionCaption = 'Not started,In progress,Completed';
            OptionMembers = "Not started","In progress",Completed;
        }
        field(10; "%Complete"; Decimal)
        {
        }
        field(11; "Priority Level"; Option)
        {
            OptionCaption = 'Urgent,Important,Medium,Low';
            OptionMembers = Urgent,Important,Medium,Low;
        }
        field(13; "Year Reporting Code"; Code[30])
        {
            TableRelation = "Annual Reporting Codes";
        }
        field(14; "Start Date"; Date)
        {
        }
        field(15; "Due Date"; Date)
        {
        }
        field(16; "Primary Directorate"; Code[100])
        {
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const(Directorate));
        }
        field(17; "Primary Department"; Code[100])
        {
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const("Department/Center"));

            trigger OnValidate()
            begin
                if ResponsibilityCenter.Get("Primary Department") then begin
                    "Primary Directorate" := ResponsibilityCenter."Direct Reports To";
                end;
            end;
        }
        field(18; "Overall Owner"; Code[100])
        {
        }
        field(19; "Key Perfomance Indicator"; Code[100])
        {
            //  TableRelation = "Performance Indicator".KPI;

            trigger OnValidate()
            begin
                /*IF PerformanceIndicator.GET("Outcome Perfomance Indicator") THEN BEGIN
                   "Unit of Measure":=PerformanceIndicator."Unit of Measure";
                  END;*/

            end;
        }
        field(20; "Unit of Measure"; Code[100])
        {
            /// TableRelation = "Unit of Measure";
        }
        field(21; "Desired Perfomance Direction"; Option)
        {
            OptionCaption = 'Increasing KPI,Decreasing KPI,Not Applicable';
            OptionMembers = "Increasing KPI","Decreasing KPI","Not Applicable";
        }
        field(22; "KPI Type"; Option)
        {
            OptionCaption = 'Lagging,Leading,Not Applicable';
            OptionMembers = Lagging,Leading,"Not Applicable";
        }
        field(23; "Imported Annual Target Qty"; Decimal)
        {
            Caption = 'Agreed Targets';
        }
        field(40; "Global Dimension 1 Code"; Code[30])
        {
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));
        }
        field(41; "Global Dimension 2 Code"; Code[30])
        {
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));
        }
        field(44; "Individual Achieved Targets"; Decimal)
        {
            CalcFormula = sum("Performance Diary Entry".Quantity where("Personal Scorecard ID" = field("Workplan No."),
                                                                        "Line Number" = field("Line Number"),
                                                                        "Posting Date" = field("Date filter")));
            FieldClass = FlowField;
        }
        field(50; "Assigned Weight (%)"; Decimal)
        {
            Caption = 'Weight';
        }
        field(51; "Plog Achieved Targets"; Decimal)
        {
            FieldClass = Normal;
        }
        field(52; "Date filter"; Date)
        {
            FieldClass = FlowFilter;
        }
        field(53; "Entry No"; Integer)
        {
            AutoIncrement = true;
        }
        field(54; Activity; Text[250])
        {
        }
    }

    keys
    {
        key(Key1; "Workplan No.", "Line Number", "Entry No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        PerformanceIndicator: Record "Performance Indicator";
        ResponsibilityCenter: Record "Responsibility Center";
        PositionLineNo: Integer;
}

