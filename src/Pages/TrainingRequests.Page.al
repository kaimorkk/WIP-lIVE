Page 52194116 "Training Requests"
{
    PageType = Card;
    SourceTable = Employee;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                Editable = true;
                field(No;"No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(FirstName;"First Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(MiddleName;"Middle Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(LastName;"Last Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Initials;Initials)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(IDNumber;"ID Number")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Gender;Gender)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Position;Position)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(ContractType;"Contract Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(DateOfJoin;"Date Of Join")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
            label(Control1000000030)
            {
                ApplicationArea = Basic;
                CaptionClass = Text19043222;
                Style = Strong;
                StyleExpr = true;
            }
            part(KPA;"Training Request Lines")
            {
                SubPageLink = "Employee No"=field("No.");
            }
        }
    }

    actions
    {
    }

    var
        GenJournal: Record "Gen. Journal Line";
        TrainingCharges: Record "HR Company or Other Training1";
        GenJournalPost: Record "Gen. Journal Line";
        Employee: Record Employee;
        LineNo: Integer;
        Text19043222: label 'Training Requests';
}

