﻿Attribute VB_Name = "modConstants"
'---------------------------------------------------------------------------------------
' Module    : modConstants
' Author    : Adam Waller
' Date      : 12/4/2020
' Purpose   : Constants and enums used throughout the project, but not exposed publicly.
'---------------------------------------------------------------------------------------
Option Compare Database
Option Private Module
Option Explicit


' Read/write chunks of text, rather than the whole thing at once for massive
' performance gains when reading large files.
' See https://docs.microsoft.com/is-is/sql/ado/reference/ado-api/readtext-method
Public Const CHUNK_SIZE As Long = 131072    ' (128K)

' Whitespace indentation for outputing JSON content
Public Const JSON_WHITESPACE As Integer = 2

' BOM characters for UTF-8/UTF-16 files
Public Const UTF8_BOM As String = "ï»¿"
Public Const UCS2_BOM As String = "ÿþ"

' Default hashing algorithm
Public Const DefaultHashAlgorithm As String = "SHA256"

' This value seems to indicate that the theme was not used.
Public Const NO_THEME_INDEX As Integer = -1

' Object types used when determining SQL modification date.
Public Enum eSqlObjectType
    estView
    estStoredProcedure
    estTable
    estTrigger
    estOther
End Enum

' Types of objects that can be exported/imported from a database.
' (Use corresponding constants wherever possible)
' Be careful not to create collisions with two members sharing the
' same value.
Public Enum eDatabaseComponentType
    ' Standard database objects
    edbForm
    edbMacro
    edbModule
    edbQuery
    edbReport
    edbTableDef
    edbTableDataMacro
    edbLinkedTable
    ' ADP specific
    edbAdpTable
    edbAdpFunction
    edbAdpServerView
    edbAdpStoredProcedure
    edbAdpTrigger
    ' Custom object types we are also handling.
    edbTableData
    edbRelation
    edbDbsProperty
    edbProjectProperty
    edbFileProperty
    edbSharedImage
    edbDocument
    edbHiddenAttribute
    edbSavedSpec
    edbImexSpec
    edbNavPaneGroup
    edbTheme
    edbVbeForm
    edbVbeProject
    edbVbeReference
    edbProject
End Enum

' Error levels used for logging and monitoring the status
' of the current operation.
Public Enum eErrorLevel
    eelNoError
    eelWarning      ' Logged to file
    eelError        ' Displayed and logged
    eelCritical     ' Cancel operation
End Enum

' Compare mode for cloning dictionary object
' See CloneDictionary function
Public Enum eCompareMethod2
    ecmBinaryCompare = 0
    ecmTextCompare = 1
    ecmDatabaseCompare = 2
    ' Added this to use original compare method
    ecmSourceMethod = 3
End Enum

' Options for resolving file conflicts
Public Enum eResolveConflict
    ercSkip
    ercOverwrite
End Enum
