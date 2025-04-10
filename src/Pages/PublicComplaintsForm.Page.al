Page 52193934 "Public Complaints Form"
{
    PageType = Card;
    SourceTable = Interaction1;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field(InteractionNo;"Interaction No.")
                {
                    ApplicationArea = Basic;
                }
                field(Name;Name)
                {
                    ApplicationArea = Basic;
                    Caption = 'Complainant';
                }
                field(DateandTime;"Date and Time")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Telephone;Telephone)
                {
                    ApplicationArea = Basic;
                }
                field(Email;"E-mail")
                {
                    ApplicationArea = Basic;
                }
                field(CellPhone;CellPhone)
                {
                    ApplicationArea = Basic;
                }
                field(Address;Address)
                {
                    ApplicationArea = Basic;
                }
                field(NatureofComplaint;"Nature of Complaint")
                {
                    ApplicationArea = Basic;
                }
                field(ModeofReceipt;"Mode of Receipt")
                {
                    ApplicationArea = Basic;
                }
                field(NameofReceivingOfficer;"Name of Receiving Officer")
                {
                    ApplicationArea = Basic;
                }
                field(DepartmentAllocated;"Department Allocated")
                {
                    ApplicationArea = Basic;
                }
                field(Status;Status)
                {
                    ApplicationArea = Basic;
                }
                field(ClosingDate;"Closing Date")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }
}

