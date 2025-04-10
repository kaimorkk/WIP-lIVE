

page 70051 "Contract Management"
{
    CardPageID = "Contract Management Header";
    DeleteAllowed = false;
    PageType = List;
    SourceTable = "Contract Management Header";
    SourceTableView = where(Status = const(Open),
                            "Assigned User" = filter(''));


    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date field.';
                }
                field("Contract Description"; Rec."Contract Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contract Description field.';
                }
                field("Tender No"; Rec."Tender No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Tender No field.';
                }
                field("Contract Vol No"; Rec."Contract Vol No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contract Vol No field.';
                }
                field(Supplier; Rec.Supplier)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Supplier field.';
                }
                field("Supplier Name"; Rec."Supplier Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Supplier Name field.';
                }
                field("Contract Status"; Rec."Contract Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contract Status field.';
                }
                field("Serial No"; Rec."Serial No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Serial No field.';
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Start Date field.';
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the End Date field.';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control10; Links)
            {
                Visible = true;
                ApplicationArea = Basic;
            }
            systempart(Control9; Notes)
            {
                Visible = true;
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(PROC)
            {
                ApplicationArea = Basic;
                Caption = '&Assign Users';
                Image = Approve;
                ToolTip = 'Executes the &Assign Users action.';
                trigger OnAction()
                var
                    PurchRec: Record "Contract Management Header";
                    Text001: label 'Are you sure you want to assign the selected requisition to a procurement officer';
                begin
                    PurchSetup.Get;
                    //PurchSetup.TESTFIELD("DIRECTOR LEGAL");
                    //IF (USERID = PurchSetup."DIRECTOR LEGAL") THEN BEGIN
                    if Confirm(Text005) = true then begin
                        //ProcPage.RUN;
                        //ProcPage.SETSELECTIONFILTER(UserSetup);
                        if Page.RunModal(51511952, UserSetup) = Action::LookupOK then begin
                            UserRecID := UserSetup."User ID";
                        end;
                        if UserRecID <> '' then begin
                            contractrec.Reset;
                            contractrec.Get(Rec.Code);
                            contractrec."Assigned User" := UserRecID;
                            contractrec.Modify;
                            Message('%1  Successfully Assigned', UserRecID);
                        end;
                    end;
                    //END;
                    /*IF (USERID <> PurchSetup."DIRECTOR LEGAL") THEN BEGIN
                       ERROR ('You do not have the right to this function');
                    END;*/

                end;
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref(PROC_Promoted; PROC)
                {
                }
            }
        }
    }

    var
        PurchSetup: Record "Purchases & Payables Setup";
        UserRecID: Code[70];
        UserSetup: Record "User Setup";
        Text005: label 'Are you sure you want to Assign this Contract to a Legal Officer?';
        contractrec: Record "Contract Management Header";
}

#pragma implicitwith restore

