Page 52193946 "Meeting Entries Subform"
{
    Caption = 'Base Calendar Entries Subform';
    DeleteAllowed = false;
    Editable = true;
    InsertAllowed = false;
    LinksAllowed = false;
    PageType = ListPart;
    SourceTable = Date;

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                field(CurrentCalendarCode;CurrentCalendarCode)
                {
                    ApplicationArea = Basic;
                    Caption = 'Base Calendar Code';
                    Editable = false;
                    Visible = false;
                }
                field(Date;"Period Start")
                {
                    ApplicationArea = Basic;
                    Caption = 'Date';
                    Editable = false;
                }
                field(Day;"Period Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Day';
                    Editable = false;
                }
                field(WeekNo;WeekNo)
                {
                    ApplicationArea = Basic;
                    Caption = 'Week No.';
                    Editable = false;
                    Visible = false;
                }
                field(FinanceAdmin;"Finance & Administration")
                {
                    ApplicationArea = Basic;
                    Caption = 'Finance  Admin';
                }
                field(Technical;Technical)
                {
                    ApplicationArea = Basic;
                }
                field(Audit;Audit)
                {
                    ApplicationArea = Basic;
                }
                field(Nonworking;Nonworking)
                {
                    ApplicationArea = Basic;
                    Caption = 'Nonworking';
                    Editable = true;

                    trigger OnValidate()
                    begin
                        UpdateBaseCalendarChanges;
                    end;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                    Caption = 'Description';

                    trigger OnValidate()
                    begin
                        UpdateBaseCalendarChanges;
                    end;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetRecord()
    begin
        Nonworking := CodeFactory.DetermineIfIsNonWorking("Period Start");
        WeekNo := Date2dwy("Period Start",2);
        CurrentCalendarCodeOnFormat;
        PeriodStartOnFormat;
        PeriodNameOnFormat;
        DescriptionOnFormat;
    end;

    // trigger OnFindRecord(Which: Text): Boolean
    // begin
    //     exit(PeriodFormMgt.FindDate(Which,Rec,ItemPeriodLength));
    // end;

    // trigger OnNextRecord(Steps: Integer): Integer
    // begin
    //     exit(PeriodFormMgt.NextDate(Steps,Rec,ItemPeriodLength));
    // end;

    trigger OnOpenPage()
    begin
        Reset;
        SetFilter("Period Start",'>=%1',00000101D);
    end;

    var
        Item: Record Item;
        //PeriodFormMgt: Codeunit PeriodFormManagement;
        ItemPeriodLength: Option Day,Week,Month,Quarter,Year,Period;
        Nonworking: Boolean;
        Description: Text[50];
        CurrentCalendarCode: Code[10];
        CalendarMgmt: Codeunit "Calendar Management";
        CodeFactory: Codeunit "Code Factory";
        BaseCalendarChange: Record "Base Calendar Change";
        WeekNo: Integer;
        "Finance & Administration": Boolean;
        Technical: Boolean;
        Audit: Boolean;


    procedure SetCalendarCode(CalendarCode: Code[10])
    begin
        CurrentCalendarCode := CalendarCode;
        CurrPage.Update;
    end;


    procedure UpdateBaseCalendarChanges()
    begin
        BaseCalendarChange.Reset;
        BaseCalendarChange.SetRange("Base Calendar Code",CurrentCalendarCode);
        BaseCalendarChange.SetRange(Date,"Period Start");
        if BaseCalendarChange.Find('-') then
          BaseCalendarChange.Delete;
        BaseCalendarChange.Init;
        BaseCalendarChange."Base Calendar Code" := CurrentCalendarCode;
        BaseCalendarChange.Date := "Period Start";
        BaseCalendarChange.Description := Description;
        BaseCalendarChange.Nonworking := Nonworking;
        BaseCalendarChange.Day := "Period No.";
        BaseCalendarChange.Insert;
    end;


    procedure ShowMonthlyCalendar()
    var
        GraphicCalendar: Page "Monthly Calendar";
    begin
        //GraphicCalendar.SetCalendarCode(1,0,'','',CurrentCalendarCode,"Period Start");
        GraphicCalendar.Run;
    end;

    local procedure CurrentCalendarCodeOnFormat()
    begin
        if Nonworking then;
    end;

    local procedure PeriodStartOnFormat()
    begin
        if Nonworking then;
    end;

    local procedure PeriodNameOnFormat()
    begin
        if Nonworking then;
    end;

    local procedure DescriptionOnFormat()
    begin
        if Nonworking then;
    end;
}

