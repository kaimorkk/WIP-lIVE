Page 52194156 "Training Evaluation"
{
    PageType = Card;
    SourceTable = "Training Evaluation1";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field(No;"No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(EvaluationDate;"Evaluation  Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(EmployeeNo;"Employee No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(EmployeeName;"Employee Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Designation;Designation)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(DepartmentCode;"Department Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(SelectTraining;"Request No")
                {
                    ApplicationArea = Basic;
                    Caption = 'Select Training ';
                    NotBlank = true;
                }
                field(TrainingInsitution;"Training Insitution")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Venue;Venue)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(From;"Planned Start Date")
                {
                    ApplicationArea = Basic;
                    Caption = 'From';
                    Editable = false;
                }
                field("To";"Planned End Date")
                {
                    ApplicationArea = Basic;
                    Caption = 'To';
                    Editable = false;
                }
                field(NoOfDays;"No. Of Days")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(QualificationType;"Qualification Type")
                {
                    ApplicationArea = Basic;
                    NotBlank = true;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                    Caption = 'Course Title';
                    Editable = false;
                }
                field(QualificationCode;"Qualification Code")
                {
                    ApplicationArea = Basic;
                    NotBlank = false;
                }
            }
            part(TrainingEvaluationSelection;"Training Evaluation Lines")
            {
                Caption = 'Training Evaluation-Selection';
                SubPageLink = "Evaluation No"=field("No.");
                SubPageView = sorting("Line No");
            }
            part(Control1000000034;"Training Evaluation-Narrative")
            {
                SubPageLink = "Evaluation No"=field("No.");
                SubPageView = sorting("Line No");
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(Print)
            {
                ApplicationArea = Basic;
                Caption = 'Print';
                Image = Print;

                trigger OnAction()
                begin
                    Reset;
                    SetFilter("No.","No.");
                    Report.Run(51511195,true,true,Rec);
                    Reset;
                end;
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref(Print_Promoted; Print)
                {
                }
            }
        }
    }

    trigger OnOpenPage()
    begin
        // SetRange("User ID",UserId);
    end;
}

