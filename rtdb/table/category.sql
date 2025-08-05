
CREATE TABLE category (
    id INT IDENTITY(1,1) PRIMARY KEY,
    name VARCHAR(255)
);

/*
// Exemplo de entidades Spring Data (Java 17 + Lombok)
// Evitando ciclo de serialização com @JsonManagedReference e @JsonBackReference
// Importante: adicionar a dependência do Jackson (com.fasterxml.jackson.annotation)

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Manufacturer {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String band;
    private String name;

    @ManyToMany
    @JoinTable(
        name = "manufacturer_category",
        joinColumns = @JoinColumn(name = "manufacturer_id"),
        inverseJoinColumns = @JoinColumn(name = "category_id")
    )
    @JsonManagedReference
    private Set<Category> categories;
}

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Category {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String name;

    @ManyToMany(mappedBy = "categories")
    @JsonBackReference
    private Set<Manufacturer> manufacturers;
}

// manufacturer_category não precisa de entidade se não houver atributos extras
*/

-- Tabela de relacionamento N:N entre manufacturer e category
CREATE TABLE manufacturer_category (
    manufacturer_id INT NOT NULL,
    category_id INT NOT NULL,
    PRIMARY KEY (manufacturer_id, category_id),
    FOREIGN KEY (manufacturer_id) REFERENCES manufacturer(id),
    FOREIGN KEY (category_id) REFERENCES category(id)
);
