page 52193907 "Inactive Employees"
{
    ApplicationArea = All;
    Caption = 'Inactive Employees';
    CardPageID = "Employee Card-HR1";
    Editable = false;
    PageType = List;
    SourceTable = Employee;
    InsertAllowed = false;
    ModifyAllowed = false;
    UsageCategory = Lists;
    SourceTableView = where(Status = filter(Inactive));

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    Caption = 'Personal No.';
                    ToolTip = 'Specifies the number of the involved entry or record, according to the specified number series.';
                }
                field(Title; Rec.Title)
                {
                    ApplicationArea = Basic;
                    ShowMandatory = true;
                    ToolTip = 'Specifies the Title of the Employee';
                }
                field("First Name"; Rec."First Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the employee''s first name.';
                }
                field("Last Name"; Rec."Last Name")
                {
                    Caption = 'Surname';
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the employee''s last name.';
                }
                field("Middle Name"; Rec."Middle Name")
                {
                    Caption = 'Other Names';
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the employee''s middle name.';
                }

                field("ID Number"; Rec."ID Number")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the ID Number field.';
                }

                // field("Current Position ID"; Rec."Current Position ID")
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the Current Position ID field.';
                // }
                field("Job Title2"; Rec."Job Title2")
                {
                    Caption = 'Designation';
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the employee''s job title.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the employment status of the employee.';
                }
                // field("Termination Date"; Rec."Termination Date")
                // {
                //     ApplicationArea = Basic;
                //     Caption = 'Exit Date';
                //     ToolTip = 'Specifies the date when the employee was terminated, due to retirement or dismissal, for example.';
                // }
                // field("Reason for termination Code"; "Reason for termination Code")
                // {
                //     ApplicationArea = Basic;
                //     Caption = 'Grounds for Exit';
                //     ToolTip = 'Specifies the value of the Grounds for Exit field.';
                // }
                // field("Date Of Birth"; Rec."Date Of Birth")
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the Date Of Birth field.';
                // }
                // field("Retirement Date"; Rec."Retirement Date")
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the Retirement Date field.';
                // }
                field("Salary Scale"; Rec."Salary Scale")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Salary Scale field.';
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Global Dimension 2 Code field.';
                }

                field("Implementing Unit Name"; Rec."Implementing Unit Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Implementing Unit Name field.';
                }

                field("Posting Group"; Rec."Posting Group")
                {

                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Posting Group field.';
                }
                // field("Employment Date"; Rec."Employment Date")
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the date when the employee began to work for the company.';
                // }
                // field("Date Of Join"; Rec."Date Of Join")
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the Date Of Join field.';
                // }
                // field("Salary Scale"; Rec."Salary Scale")
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the Salary Scale field.';
                // }
            }
        }
        area(factboxes)
        {

            systempart(Control1900383207; Links)
            {
                Visible = false;
                ApplicationArea = Basic;
            }
            systempart(Control1905767507; Notes)
            {
                Visible = true;
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("E&mployee")
            {
                Caption = 'E&mployee';
                Image = Employee;
                action("Co&mments")
                {
                    ApplicationArea = Basic;
                    Caption = 'Co&mments';
                    Image = ViewComments;
                    RunObject = Page "Human Resource Comment Sheet";
                    RunPageLink = "Table Name" = const(Employee),
                                  "No." = field("No.");
                    ToolTip = 'Executes the Co&mments action.';
                }
                group(Dimensions)
                {
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    action("Dimensions-Single")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Dimensions-Single';
                        Image = Dimensions;
                        RunObject = Page "Default Dimensions";
                        RunPageLink = "Table ID" = const(5200),
                                      "No." = field("No.");
                        ShortCutKey = 'Shift+Ctrl+D';
                        ToolTip = 'Executes the Dimensions-Single action.';
                    }
                    action("Dimensions-&Multiple")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Dimensions-&Multiple';
                        Image = DimensionSets;
                        ToolTip = 'Executes the Dimensions-&Multiple action.';
                        trigger OnAction()
                        var
                            Employee: Record Employee;
                            DefaultDimMultiple: Page "Default Dimensions-Multiple";
                        begin
                            CurrPage.SetSelectionFilter(Employee);
                            DefaultDimMultiple.SetMultiEmployee(Employee);
                            DefaultDimMultiple.RunModal;
                        end;
                    }
                }
                action("&Picture")
                {
                    ApplicationArea = Basic;
                    Caption = '&Picture';
                    Image = Picture;
                    RunObject = Page "Employee Picture";
                    RunPageLink = "No." = field("No.");
                    ToolTip = 'Executes the &Picture action.';
                }
                action("&Alternative Addresses")
                {
                    ApplicationArea = Basic;
                    Caption = '&Alternative Addresses';
                    Image = Addresses;
                    RunObject = Page "Alternative Address List";
                    RunPageLink = "Employee No." = field("No.");
                    ToolTip = 'Executes the &Alternative Addresses action.';
                }
                action("&Relatives")
                {
                    ApplicationArea = Basic;
                    Caption = '&Relatives';
                    Image = Relatives;
                    RunObject = Page "Employee Relatives";
                    RunPageLink = "Employee No." = field("No.");
                    ToolTip = 'Executes the &Relatives action.';
                }
                action("Mi&sc. Article Information")
                {
                    ApplicationArea = Basic;
                    Caption = 'Mi&sc. Article Information';
                    Image = Filed;
                    RunObject = Page "Misc. Article Information";
                    RunPageLink = "Employee No." = field("No.");
                    ToolTip = 'Executes the Mi&sc. Article Information action.';
                }
                action("Co&nfidential Information")
                {
                    ApplicationArea = Basic;
                    Caption = 'Co&nfidential Information';
                    Image = Lock;
                    RunObject = Page "Confidential Information";
                    RunPageLink = "Employee No." = field("No.");
                    ToolTip = 'Executes the Co&nfidential Information action.';
                }
                action("Q&ualifications")
                {
                    ApplicationArea = Basic;
                    Caption = 'Q&ualifications';
                    Image = Certificate;
                    RunObject = Page "Employee Qualifications";
                    RunPageLink = "Employee No." = field("No.");
                    ToolTip = 'Executes the Q&ualifications action.';
                }
                action("A&bsences")
                {
                    ApplicationArea = Basic;
                    Caption = 'A&bsences';
                    Image = Absence;
                    RunObject = Page "Employee Absences";
                    RunPageLink = "Employee No." = field("No.");
                    ToolTip = 'Executes the A&bsences action.';
                }
                separator(Action51)
                {
                }
                action("Absences by Ca&tegories")
                {
                    ApplicationArea = Basic;
                    Caption = 'Absences by Ca&tegories';
                    Image = AbsenceCategory;
                    RunObject = Page "Empl. Absences by Categories";
                    RunPageLink = "No." = field("No."),
                                  "Employee No. Filter" = field("No.");
                    ToolTip = 'Executes the Absences by Ca&tegories action.';
                }
                action("Misc. Articles &Overview")
                {
                    ApplicationArea = Basic;
                    Caption = 'Misc. Articles &Overview';
                    Image = FiledOverview;
                    RunObject = Page "Misc. Articles Overview";
                    ToolTip = 'Executes the Misc. Articles &Overview action.';
                }
                action("Con&fidential Info. Overview")
                {
                    ApplicationArea = Basic;
                    Caption = 'Con&fidential Info. Overview';
                    Image = ConfidentialOverview;
                    RunObject = Page "Confidential Info. Overview";
                    ToolTip = 'Executes the Con&fidential Info. Overview action.';
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    var
        EmpPost: Record "PR Employee Posting Groups";
    begin
        // HumanResourcesSetup.GET;
        // EmpPost.Reset();
        // EmpPost.SetRange(EmpPost.Code, Rec."Posting Group");
        // if EmpPost.Find('-') then begin
        //     EmpPost.TestField("Retirement Age");
        //     if Rec.Disabled then begin
        //         EmpPost.TestField("PWD Retirement Age");
        //         Rage := CALCDATE(EmpPost."PWD Retirement Age", Rec."Date Of Birth");
        //         Rec."Retirement Date" := CALCDATE('<+1D>', Rage);
        //         if Rec."Retirement Date" - Today < 366 then
        //             Rec."Due for Retirement" := true
        //         else
        //             Rec."Due for Retirement" := false;

        //     end else begin
        //         Rage := CALCDATE(EmpPost."Retirement Age", Rec."Date Of Birth");
        //         Rec."Retirement Date" := CALCDATE('<+1D>', Rage);
        //         if Rec."Retirement Date" - Today < 366 then
        //             Rec."Due for Retirement" := true
        //         else
        //             Rec."Due for Retirement" := false;

        //     end;
        // end;
    end;

    trigger OnOpenPage()
    var
        EmpPost: Record "PR Employee Posting Groups";
    begin
        if UserRec.get(UserId) then begin
            if UserRec."Can View HR" = false then
                Error('You do not have rights to access the employee list');

        end else
            Error('You do not have rights to access the employee list');


        // HumanResourcesSetup.GET;
        // EmpPost.Reset();
        // EmpPost.SetRange(EmpPost.Code, Rec."Posting Group");
        // if EmpPost.Find('-') then begin
        //     EmpPost.TestField("Retirement Age");
        //     if Rec."Date Of Birth" > 0D then begin
        //         if Rec.Disabled then begin
        //             EmpPost.TestField("PWD Retirement Age");
        //             Rage := CALCDATE(EmpPost."PWD Retirement Age", Rec."Date Of Birth");
        //             Rec."Retirement Date" := CALCDATE('<+1D>', Rage);
        //             if Rec."Retirement Date" - Today < 366 then
        //                 Rec."Due for Retirement" := true
        //             else
        //                 Rec."Due for Retirement" := false;

        //         end else begin
        //             Rage := CALCDATE(EmpPost."Retirement Age", Rec."Date Of Birth");
        //             Rec."Retirement Date" := CALCDATE('<+1D>', Rage);
        //             if Rec."Retirement Date" - Today < 366 then
        //                 Rec."Due for Retirement" := true
        //             else
        //                 Rec."Due for Retirement" := false;

        //         end;
        //         Rec.MODIFY(true);
        //     end;
        // end;
    end;

    var
        HumanResourcesSetup: Record "Human Resources Setup";
        Rage: Date;
        UserRec: Record "User Setup";
}

#pragma implicitwith restore

