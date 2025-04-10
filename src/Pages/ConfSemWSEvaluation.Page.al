Page 52194174 "Conf/Sem/WS Evaluation"
{
    PageType = Card;
    SourceTable = "Conf/Sem/WS Evaluation1";

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
                }
                field(EmployeeNo;"Employee No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Designation;Designation)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(RequestNo;"Request No")
                {
                    ApplicationArea = Basic;
                }
                field(Insitution;Insitution)
                {
                    ApplicationArea = Basic;
                }
                field(From;"Planned Start Date")
                {
                    ApplicationArea = Basic;
                    Caption = 'From';
                    Editable = false;
                }
                field(EvaluationDate;"Evaluation  Date")
                {
                    ApplicationArea = Basic;
                }
                field(EmployeeName;"Employee Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                    Caption = 'Course Title';
                    Editable = false;
                }
                field("To";"Planned End Date")
                {
                    ApplicationArea = Basic;
                    Caption = 'To';
                    Editable = false;
                }
                field(DepartmentCode;"Department Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Venue;Venue)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(NoOfDays;"No. Of Days")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
            part(Control1000000026;"Training Evaluation Lines")
            {
                SubPageLink = "Evaluation No"=field("No. Series");
                SubPageView = sorting("Line No");
            }
            part(Control1000000034;"Training Evaluation-Narrative")
            {
                SubPageLink = "Evaluation No"=field("No. Series");
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
                    //SETFILTER("No.","No.");
                    //REPORT.RUN(51511195,TRUE,TRUE,Rec);
                    //RESET;
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
}

