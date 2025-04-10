Page 50118 "Posted Partial Imprests"
{
    CardPageID = "Partial Imprest Issue";
    Editable = false;
    PageType = List;
    SourceTable = "Partial Imprest Issue";
    SourceTableView = where(Posted=const(true));

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(ImprestNo;"Imprest No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(LineNo;"Line No")
                {
                    ApplicationArea = Basic;
                }
                field(EmployeeNo;"Employee No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Date;Date)
                {
                    ApplicationArea = Basic;
                }
                field(ApprovedAmount;"Approved Amount")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(AmountAlreadyIssued;"Amount Already Issued")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(RemainingAmount;"Remaining Amount")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(PayMode;"Pay Mode")
                {
                    ApplicationArea = Basic;
                }
                field(AmounttoIssue;"Amount to Issue")
                {
                    ApplicationArea = Basic;
                }
                field(Posted;Posted)
                {
                    ApplicationArea = Basic;
                }
                field(SelecttoSurrender;"Select to Surrender")
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
        Commitments: Codeunit Committment;
}

