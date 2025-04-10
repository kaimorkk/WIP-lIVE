Page 52194367 "Training Needs List"
{
    PageType = List;
    SourceTable = "Training Needs1";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field("Code";Code)
                {
                    ApplicationArea = Basic;
                }
                field(Directorate;Directorate)
                {
                    ApplicationArea = Basic;
                }
                field(DepartmentCode;"Department Code")
                {
                    ApplicationArea = Basic;
                }
                field(EmployeeNo;"Employee No")
                {
                    ApplicationArea = Basic;
                }
                field(Period;"Appraisal Period")
                {
                    ApplicationArea = Basic;
                    Caption = 'Period';
                }
                field(EmployeeName;"Employee Name")
                {
                    ApplicationArea = Basic;
                }
                field(NeedSource;"Need Source")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field(ProposedTraining;"Proposed Training")
                {
                    ApplicationArea = Basic;
                }
                field(Duration;"Duration(Date)")
                {
                    ApplicationArea = Basic;
                    Caption = 'Duration';
                }
                field(HODIndividual;"HOD/Individual")
                {
                    ApplicationArea = Basic;
                }
                field(Select;Select)
                {
                    ApplicationArea = Basic;
                }
                field(Status;Status)
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }

    var
        GenJournal: Record "Gen. Journal Line";
        TrainingCharges: Record "Training Needs1";
        GenJournalPost: Record "Gen. Journal Line";
        LineNo: Integer;
}

