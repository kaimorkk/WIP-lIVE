page 52193887 "HR Activities Cue"
{
    PageType = CardPart;
    SourceTable = "HR Activities Cue";


    layout
    {
        area(content)
        {

            cuegroup(JobsActivities)
            {
                Caption = 'Jobs Dashboard';
                ShowCaption = true;
                Visible = false;
                field("All Jobs"; "All Jobs")
                {
                    ApplicationArea = All;

                }
            }

            cuegroup(EmployeeActivitiesActive)
            {
                Caption = 'Employee Dashboard';
                ShowCaption = true;
                Visible = true;
                // field("Active Employees"; "Active Employees")
                // {
                //     ApplicationArea = Number;
                //     Caption = 'Active Employees';


                // }
                // field("In-Active Employees"; "In-Active Employees")
                // {
                //     ApplicationArea = All;
                //     Caption = 'Exited Employees';
                // }
                field("Suspended Employees"; Rec."Suspended Employees")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Suspended Employees field.';
                }
                field("Interdicted Employees"; Rec."Interdicted Employees")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Interdicted Employees field.';
                }
                field("Dismissed Employees"; Rec."Dismissed Employees")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Dismissed Employees field.';
                }
                field("Contract Staff"; "Contract Staff")
                {
                    ApplicationArea = all;
                    Caption = 'Contract Staff';
                }

                field("Permanent Staff"; "Permanent Staff")
                {
                    ApplicationArea = all;
                    Caption = 'Permanent Staff';
                }
                field("Seconded Staff"; "Seconded Staff")
                {
                    Caption = 'Seconded Staff';
                    ApplicationArea = all;
                }
            }


            cuegroup(EmployeeActivitiesGender)
            {
                Caption = 'Gender Dashboard';
                ShowCaption = false;
                Visible = true;


                field("Male Employees"; "Male Employees")
                {
                    ApplicationArea = All;
                    Caption = 'Male Employees';
                }

                field("Female Employees"; "Female Employees")
                {
                    ApplicationArea = All;
                    Caption = 'Female Employees';
                }
            }
            cuegroup(DueEmployeesGroup)
            {
                Caption = 'Staff Dashboard';
                ShowCaption = true;
                Visible = true;


                field("Staff on Leave"; "Staff on Leave")
                {
                    ApplicationArea = All;
                    Caption = 'Staff On Leave';
                }

                field("Contracts Due"; "Contracts Due")
                {
                    ApplicationArea = All;
                    Caption = 'Contracts Due';
                }


                field("Retirement Report"; "Retirement Report")
                {
                    ApplicationArea = all;
                    Caption = 'Retirement';
                }

                field("Probation Report"; "Probation Report")
                {
                    ApplicationArea = all;
                    Caption = 'Probation Report';
                }

            }
            cuegroup(Leave)
            {
                field("Staff on Leave Count"; Rec."Staff on Leave Count")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Staff on Leave Count field.';
                }
            }

        }

    }



    trigger OnOpenPage();
    begin

        RESET;
        if not GET then begin
            INIT;
            INSERT;
        end;
    end;
}




