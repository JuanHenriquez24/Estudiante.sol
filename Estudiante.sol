// SPDX-License-Identifier: MIT
// La version de solidity que usamos
pragma solidity ^0.8.14;
contract Estudiante {
  string private _nombre;
  string private _apellido;
  string private _curso;
  address private _docente;
  mapping(string => uint) private notas_materias;
  string[] private materias;
  constructor(string memory nombre_, string memory apellido_, string memory curso_){
      // Esto ocurre la primera vez que corre el programa
      _docente = msg.sender;
      _nombre = nombre_;
      _apellido = apellido_;
      _curso = curso_;
  }
  function apellido() public view returns(string memory){
      // Esto devuelve el apellido, logicamente
      return _apellido;
  }
   function curso() public view returns(string memory){
      // Esto, al igual que el del apellido, devuevle lo que esta escrito
      return _curso;
  }
 
  function nombre_completo() public view returns(string memory){
      // Esto devuelve el nombre y se le une al apellido
      return string.concat(_nombre, " ", _apellido);
  }
 
  function set_nota_materia(uint _nota, string memory _materia) public{
 
      //Esto empieza con un requerimiento diciendo que el docente, es decir que el que activa la funcion, puede setear la nota
      require(msg.sender == _docente, "Solo el docente puede acceder a esta funcion");
      notas_materias[_materia] = _nota;
      materias.push(_materia);
  }
  function nota_materia(string memory _materia) public view returns(uint){
      // Esto devuelve la nota segun la materia elegida
      return notas_materias[_materia];
  }
  function aprobo(string memory _materia) public view returns(bool){
      // Esto usa if y else para analizar si se aprobó o no. Se aprueba si la nota es mayor o igual a 6. Sino, dice que reprobó
      if(notas_materias[_materia] >= 6)
      {
          return true;
      }
      else
      {
          return false;
      }
  }
  function promedio() public view returns(uint){
      // Esto aumenta un total por cada materia introducida, y despues devuelve el total dividido la cantidad de materias
      uint _total;
      for(uint i = 0; i < materias.length; i++){
          _total += notas_materias[materias[i]];
      }
      return _total / materias.length;
  }
}
 
