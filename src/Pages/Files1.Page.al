Page 52193798 Files1
{
    PageType = Card;
    SourceTable = "File Details1";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field(FirstCategory;"First Category")
                {
                    ApplicationArea = Basic;
                }
                field(SecondCategory;"Second Category")
                {
                    ApplicationArea = Basic;
                    TableRelation = "File Details1"."First Category" where ("First Category"=field("First Category"));
                }
                field(ThirdCategory;"Third Category")
                {
                    ApplicationArea = Basic;
                }
                field(FourthCategory;"Fourth Category")
                {
                    ApplicationArea = Basic;
                }
                field(FileNo;"File Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'File No.';
                    Editable = false;
                }
                field(FileDescription;"File Description")
                {
                    ApplicationArea = Basic;
                }
                field(MaxSizeRecommended;"Max Size Recommended")
                {
                    ApplicationArea = Basic;
                }
                field(Measuretypeforsize;"Measure type for size")
                {
                    ApplicationArea = Basic;
                }
                field(FileStatus;"File Status")
                {
                    ApplicationArea = Basic;
                    Editable = false;

                    trigger OnValidate()
                    begin
                        if "Current Size">="Max Size Recommended" then
                        Find('=');
                        "File Status":="file status"::Open;
                        Modify;
                    end;
                }
                field(EmployeeFile;"Employee File?")
                {
                    ApplicationArea = Basic;
                }
                field(Status;Status)
                {
                    ApplicationArea = Basic;
                    Caption = 'Available in Registry?';
                    Editable = false;
                }
                field(FileHolder;FileHolder)
                {
                    ApplicationArea = Basic;
                    Caption = 'Current Holder';
                    Editable = false;
                }
                field(Volume;Volume)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(CurrentSize;"Current Size")
                {
                    ApplicationArea = Basic;
                }
                field(EmployeeID;"Employee ID")
                {
                    ApplicationArea = Basic;
                }
                field(Measuretype;"Measure type")
                {
                    ApplicationArea = Basic;
                }
                field(EmployeeName;"Employee Name")
                {
                    ApplicationArea = Basic;
                }
                field(CreationDate;"Creation Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(MemberStatus;"Member Status")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
            label(Control1000000038)
            {
                ApplicationArea = Basic;
                CaptionClass = Text19055465;
                Style = Strong;
                StyleExpr = true;
            }
            part(Control1000000021;"Document management listing")
            {
                SubPageLink = File=field("File Code");
            }
            group(FileClosing)
            {
                Caption = 'File Closing';
                field(RetentionPeriodYrs;"Retention Period(Yrs)")
                {
                    ApplicationArea = Basic;
                }
                field(DateClosed;"Date Closed")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(DisposalAction;"Disposal Action")
                {
                    ApplicationArea = Basic;
                }
                field(DisposalDate;"Disposal Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Create New Volume")
            {
                ApplicationArea = Basic;

                trigger OnAction()
                begin
                    //"File Status":="File Status".closed;

                    //FIND('=');
                    Vol:="File Code";
                    if Confirm('Are you sure you want to create a new volume of this file?',false)= true then begin


                    FIL.Init;
                    FIL."File Code":="File Code";
                    FIL."First Category":="First Category";
                    FIL."Second Category":="Second Category";
                    FIL."Third Category":="Third Category";
                    FIL."Fourth Category":="Fourth Category";
                    FIL."File Description":="File Description";
                    FIL."Max Size Recommended":="Max Size Recommended";
                    FIL."Measure type for size":="Measure type for size";
                    FIL."File Status":="file status"::Open;
                    FIL."Retention Period(Yrs)":="Retention Period(Yrs)";
                    FIL."Disposal Action":="Disposal Action";
                    FIL.Pensioner:=Pensioner;
                    FIL.Contributer:=Contributer;
                    FIL."Pensioner Name":="Pensioner Name";
                    FIL."Contributer Name":="Contributer Name";
                    FIL."Employee File?":="Employee File?";
                    FIL."Employee ID":="Employee ID";
                    FIL."Employee Name":="Employee Name";
                    FIL.Status:=Status;


                    FIL.Volume:=IncStr(Volume);

                    FIL.Insert(true);

                    Message('New File volume has been created');

                     end;

                    //MESSAGE(Vol);
                end;
            }
            action("Close File")
            {
                ApplicationArea = Basic;

                trigger OnAction()
                begin
                    //"File Status":="File Status".closed;
                    if Confirm('Are you sure you want to Close this file?',false)= true then begin
                    Find('=');
                    "File Status":="file status"::"Semi-Current";
                    "Date Closed":=Today;
                    RetYrs:="Retention Period(Yrs)";
                    "Disposal Date":=CalcDate('CD+2Y',Today);
                    Modify;
                    Message('File has been Closed');
                     end;


                    Vol:="File Code";
                    if Confirm('Are you sure you want to create a new volume of this file?',false)= true then begin


                    FIL.Init;
                    FIL."File Code":="File Code";
                    FIL."First Category":="First Category";
                    FIL."Second Category":="Second Category";
                    FIL."Third Category":="Third Category";
                    FIL."Fourth Category":="Fourth Category";
                    FIL."File Description":="File Description";
                    FIL."Max Size Recommended":="Max Size Recommended";
                    FIL."Measure type for size":="Measure type for size";
                    FIL."File Status":="file status"::Open;
                    FIL."Retention Period(Yrs)":="Retention Period(Yrs)";
                    FIL."Disposal Action":="Disposal Action";
                    FIL.Pensioner:=Pensioner;
                    FIL.Contributer:=Contributer;
                    FIL."Pensioner Name":="Pensioner Name";
                    FIL."Contributer Name":="Contributer Name";
                    FIL."Employee File?":="Employee File?";
                    FIL."Employee ID":="Employee ID";
                    FIL."Employee Name":="Employee Name";
                    FIL.Status:=Status;


                    FIL.Volume:=IncStr(Volume);

                    FIL.Insert(true);

                    Message('New File volume has been created');

                     end;
                end;
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref("Create New Volume_Promoted"; "Create New Volume")
                {
                }
                actionref("Close File_Promoted"; "Close File")
                {
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        /* IF "Disposal Action"="Disposal Action"::Destroy THEN BEGIN
        
        IF "Disposal Date"=TODAY THEN
         MESSAGE('You Need to distroy this File!');
         END;
          */
        
        fileMovementRec.Reset;
        fileMovementRec.SetRange(fileMovementRec."File Code","File Code");
        fileMovementRec.SetRange(fileMovementRec.Volume,Volume);
        fileMovementRec.SetRange(fileMovementRec.Transfered,false);
        fileMovementRec.SetRange(fileMovementRec."Returned?",false);
        if fileMovementRec.Find('+') then begin
        FileHolder:=fileMovementRec."Officer Name";
        
        end else begin
        FileHolder:='REGISTRY';
        end;

    end;

    var
        FIL: Record "File Details1";
        RetYrs: DateFormula;
        Vol: Code[20];
        FileHolder: Text[100];
        fileMovementRec: Record "File Movement Details1";
        Text19055465: label 'FILED DOCUMENTS';

    local procedure OnBeforePutRecord()
    begin
        FIL.Reset;
    end;

    local procedure ThirdCategoryOnBeforeInput()
    begin
         Reset;
    end;
}

