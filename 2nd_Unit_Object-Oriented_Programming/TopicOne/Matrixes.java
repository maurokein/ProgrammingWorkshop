package tema1;
import PaqueteLectura.Lector;
import PaqueteLectura.GeneradorAleatorio;
/**
 *
 * @author mauro
 */
public class Matrixes {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // 1.Define an integer matrix of 10x10 size and initialize it with aleatory numbers between 0 and 200
        int [][] matrix = new int[10][10];
        int i, j;
        for(i = 0; i < 10; i++){
            for(j = 0; j < 10; j++){
                matrix[i][j] = GeneradorAleatorio.generarInt(200);
            }
        }
        
        //2. Show the content of generated matrix 
        for(i = 0; i < 10; i++){
            for(j= 0; j < 10; j++){
                System.out.print(matrix[i][j] + " ");
            }
        System.out.println();
        }
        
        //3. Calculate and inform the sum of all the stored numbers between files 2 and 9 and columns 0 and 3 
        int sum = 0; 
        for(i = 2; i < 10; i++){
            for(j = 0; j < 4; j++){
                sum += matrix[i][j];
            }
        }
        System.out.println("Sum of numbers of the requested sector is: " + sum);
        
        //4. Generate a 10 position vector with each i index contains the sum of the i column of the matrix 
        int vector[] = new int[10];
        for(i = 0; i < 10; i++){
            vector[i] = 0;
        }
        for (i = 0; i < 10; i++){
            for(j=0; j < 10; j++){
                vector[i] += matrix[j][i];
            }
        }
        System.out.println("Sum of numbers of first column of the matrix is: " + vector[0]);
        
        //5. Read an integer number a indicates if exists or not into the matrix. If exists, it must display her position (file and column). 
        //If it doesn´t, it must display "The entered number did not found."
        System.out.println("Insert a number for searching");
        int number = Lector.leerInt();
        boolean exists = false; 
        int indexA = 0, indexB = 0; 
        for(i = 0; i < 10; i++){
            for(j = 0; j < 10; j++){
                if(matrix[i][j] == number){
                    exists = true; 
                    indexA = i;
                    indexB = j;
                }
            }
        }
        if(exists){
            System.out.println("The number was found in file " + (indexA + 1) + " column " + (indexB + 1));
        }
        else{
            System.out.println("The element was not found into the matrix");
        }
    }
}
