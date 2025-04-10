Page 52194082 "Training Needs HOD"
{
    PageType = ListPart;
    SourceTable = "Training Needs1";
    SourceTableView = where("HOD/Individual"=const(HOD));

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field(EmployeeNo;"Employee No")
                {
                    ApplicationArea = Basic;
                }
                field(EmployeeName;"Employee Name")
                {
                    ApplicationArea = Basic;
                }
                field(DirectorateName;"Directorate Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(DepartmentName;"Department Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
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

