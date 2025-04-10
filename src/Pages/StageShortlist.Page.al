Page 52193873 "Stage Shortlist"
{
    PageType = ListPart;
    SourceTable = "Stage Shortlist1";
    SourceTableView = sorting("Stage Score")
                      order(descending);

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field(Applicant;Applicant)
                {
                    ApplicationArea = Basic;
                }
                field(FirstName;"First Name")
                {
                    ApplicationArea = Basic;
                }
                field(MiddleName;"Middle Name")
                {
                    ApplicationArea = Basic;
                }
                field(LastName;"Last Name")
                {
                    ApplicationArea = Basic;
                }
                field(IDNo;"ID No")
                {
                    ApplicationArea = Basic;
                }
                field(MaritalStatus;"Marital Status")
                {
                    ApplicationArea = Basic;
                }
                field(Gender;Gender)
                {
                    ApplicationArea = Basic;
                }
                field(StageScore;"Stage Score")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field(Qualified;Qualified)
                {
                    ApplicationArea = Basic;

                    trigger OnValidate()
                    begin
                        "Manual Change":=true;
                        Modify;
                    end;
                }
                field(ManualChange;"Manual Change")
                {
                    ApplicationArea = Basic;
                }
                field(Position;Position)
                {
                    ApplicationArea = Basic;
                }
                field(Employ;Employ)
                {
                    ApplicationArea = Basic;
                }
                field(ReportingDate;"Reporting Date")
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
        MyCount: Integer;


    procedure GetApplicantNo() AppicantNo: Code[20]
    begin
        AppicantNo:=Applicant;
    end;
}

