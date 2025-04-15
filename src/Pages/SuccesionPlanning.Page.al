Page 52194079 "Succesion Planning"
{
    ApplicationArea = Basic;
    PageType = Card;
    SourceTable = Employee;
    SourceTableView = where(Status = const(Active));
    UsageCategory = Tasks;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                Editable = true;
                field(No; "No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(FirstName; "First Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(MiddleName; "Middle Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(LastName; "Last Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Initials; Initials)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(IDNumber; "ID Number")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Gender; Gender)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Position; Position)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(ContractType; "Contract Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(DateOfJoin; "Date Of Join")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(PositionToSucceed; "Position To Succeed")
                {
                    ApplicationArea = Basic;
                }
                // field(PositionToSucceedName;"Position To Succeed Name")
                // {
                //     ApplicationArea = Basic;
                // }
                field(SuccesionDate; "Succesion Date")
                {
                    ApplicationArea = Basic;
                }
            }
            label(Control1000000026)
            {
                ApplicationArea = Basic;
                CaptionClass = Text19062331;
                Style = Strong;
                StyleExpr = true;
            }
            part(Gaps; "Succession Gaps")
            {
                SubPageLink = "Employee No" = field("No."),
                              "Job Id" = field("Position To Succeed");
            }
            label(Control1000000030)
            {
                ApplicationArea = Basic;
                CaptionClass = Text19065507;
                Style = Strong;
                StyleExpr = true;
            }
            part(KPA; "Succession Requirements")
            {
                SubPageLink = "Employee No." = field("No.");
            }
        }
    }

    actions
    {
    }

    var
        JobReq: Record "Job Requirementx1";
        Text19062331: label 'Requirements Gaps';
        Text19065507: label 'Succesion Training and Development Requirements';
}

